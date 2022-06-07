#!/usr/bin/env python3

import rospy
import numpy as np
import cv2

from core import logger

from autonomous_slam.srv import *
from geometry_msgs.msg import Pose
from autonomous_slam.msg import MapDataMsg

log = logger.Logger('voronoi')

PATH = '/home/parallels/Programs/ros/src/autonomous_slam/maps/'


class MapData():
    mask: np.ndarray = None
    resolution: float = 0.0
    origin: tuple = None


map_data = MapData()

start_voronoi = False


def handle_start_voronoi(req: MyBoolSrvRequest) -> bool:
    global start_voronoi

    start_voronoi = req.input

    return True


def get_map_data(data: MapDataMsg) -> None:
    global map_data

    if not data.height or not data.width:
        return

    mask_data = np.array(data.mask).astype(np.uint8)
    map_data.mask = np.reshape(mask_data, (data.height, data.width, 1))

    map_data.origin = (data.origin_x, data.origin_y)
    map_data.resolution = data.resolution


def get_skeleton() -> np.ndarray:
    global map_data

    if map_data.mask is None:
        return

    kernel = cv2.getStructuringElement(cv2.MORPH_CROSS, (3, 3))
    skeleton = np.zeros(map_data.mask.shape, dtype='uint8')

    mask_iterative = map_data.mask.copy()

    while (cv2.countNonZero(mask_iterative) != 0):

        eroded_img = cv2.erode(mask_iterative, kernel)
        openned_img = cv2.morphologyEx(eroded_img, cv2.MORPH_OPEN, kernel)
        subset = eroded_img - openned_img
        # Union of all previous sets
        skeleton = cv2.bitwise_or(subset, skeleton)
        # Set the eroded image for next iteration
        mask_iterative = eroded_img.copy()

    cv2.imshow('skeleton', skeleton)
    cv2.waitKey(1)

    return skeleton


def get_path(skeleton: np.ndarray) -> np.ndarray:
    global map_data

    if skeleton is None:
        return

    _, binary_img = cv2.threshold(skeleton, 128, 10, cv2.THRESH_BINARY)

    filter = np.array([[1, 1, 1],
                       [1, 10, 1],
                       [1, 1, 1]])

    filtered_img = cv2.filter2D(binary_img, -1, filter)

    (height, width) = binary_img.shape
    points_mask = np.zeros((height, width, 1), np.uint8)

    points_mask = np.where(filtered_img == 140, 255, 0)
    points_mask = points_mask.reshape(height, width, 1).astype(np.uint8)

    list_of_coordinates = np.where(points_mask == 255)

    x = np.array(list_of_coordinates[1])
    y = np.array(list_of_coordinates[0])

    path = np.array((x, y)).T*map_data.resolution + map_data.origin
    path = np.around(path, 1)
    path = np.unique(path, axis=0)

    return path


def get_pose(point) -> Pose:
    goal_pose = Pose()
    goal_pose.position.x = point[0]
    goal_pose.position.y = point[1]
    goal_pose.orientation.w = 1.0

    return goal_pose


def save_image():
    skeleton = get_skeleton()
    cv2.imwrite(PATH + 'skeleton.png', skeleton)


def main():
    global start_voronoi

    # Node
    rospy.init_node('voronoi')
    rospy.on_shutdown(save_image)
    log.info('node initialized')

    # Services and Topics
    rospy.Service('start_voronoi', MyBoolSrv, handle_start_voronoi)
    rospy.Subscriber("map_data", MapDataMsg, get_map_data)

    # Variables
    rate = rospy.Rate(10)

    # Main loop
    while not rospy.is_shutdown():

        skeleton = get_skeleton()

        if start_voronoi:

            path = get_path(skeleton)

            for index, point in enumerate(path):

                if index:
                    x_diff = abs(point[0] - path[index-1][0])
                    y_diff = abs(point[1] - path[index-1][1])

                    if x_diff > 0.3 and y_diff > 0.3:

                        log.info(f'{point=}')

                        goal_pose = get_pose(point)

                        # Move to point
                        rospy.wait_for_service('move_to_point')
                        try:
                            service = rospy.ServiceProxy(
                                'move_to_point',  MyPoseSrv)
                            goal_achieved = service(goal_pose)
                            log.info(f'{goal_achieved=}')

                        except rospy.ServiceException as e:
                            rospy.logfatal(f'Service failed as {e}')

            # Exploration over
            rospy.wait_for_service('exploration_over')
            try:
                service = rospy.ServiceProxy(
                    'exploration_over',  MyBoolSrv)
                exploration_over = service(True)
                start_voronoi = not exploration_over

            except rospy.ServiceException as e:
                rospy.logfatal(f'Service failed as {e}')

        rate.sleep()


if __name__ == '__main__':
    main()
