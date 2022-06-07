#!/usr/bin/env python3

import rospy
import numpy as np
import cv2

from core import logger

from nav_msgs.msg import OccupancyGrid
from autonomous_slam.srv import *
from autonomous_slam.msg import MapDataMsg

log = logger.Logger('map')

PATH = '/home/parallels/Programs/ros/src/autonomous_slam/maps/'

map_data = MapDataMsg()


class Images():
    mask: np.ndarray = None
    contour: np.ndarray = None
    map_img: np.ndarray = None
    map_rgb: np.ndarray = None


images = Images()


def get_map(data: OccupancyGrid) -> None:
    global images, map_data

    map_data_array = np.array(data.data)

    map_data_array[np.array(data.data) == 0] = 255
    map_data_array[np.array(data.data) == -1] = 127
    map_data_array[np.array(data.data) == 100] = 0

    images.map_img = np.reshape(
        map_data_array, (data.info.height, data.info.width, 1)).astype(np.uint8)

    map_data.height = data.info.height
    map_data.width = data.info.width
    map_data.resolution = data.info.resolution
    map_data.origin_x = data.info.origin.position.x
    map_data.origin_y = data.info.origin.position.y


def get_closed_map() -> bool:
    global images

    if images.map_img is None:
        return

    mask = np.zeros_like(images.map_img)
    map_rgb = cv2.cvtColor(images.map_img, cv2.CV_32S)
    _, contour_img = cv2.threshold(
        images.map_img, 100, 255, cv2.THRESH_BINARY_INV)

    contour_img = cv2.morphologyEx(contour_img, cv2.MORPH_CLOSE, kernel=(9, 9))
    contour_img = cv2.dilate(contour_img, kernel=(3, 3))

    contours, hierarchy = cv2.findContours(
        contour_img, cv2.RETR_CCOMP, cv2.CHAIN_APPROX_SIMPLE)

    contours_valid = []
    for i, contour in enumerate(contours):
        if not (hierarchy[0][i][2] > 0 and hierarchy[0][i][3] > 0) and (cv2.contourArea(contour) > contour_img.shape[0]*10):
            contours_valid.append(contour)

    cv2.drawContours(image=map_rgb,
                     contours=contours_valid,
                     contourIdx=-1,
                     color=(0, 255, 0),
                     thickness=1)

    cv2.drawContours(image=mask,
                     contours=contours_valid,
                     contourIdx=0,
                     color=255,
                     thickness=-1)

    if contours_valid:
        map_closed = True
    else:
        map_closed = False

    images.map_rgb = map_rgb
    images.contour = contour_img
    images.mask = mask

    cv2.imshow("contour", contour_img)
    cv2.imshow("map", map_rgb)
    cv2.imshow('mask', mask)
    cv2.waitKey(1)

    return map_closed


def get_explored_ratio() -> float:
    global images

    if images.map_img is None:
        return

    if images.mask is None:
        return

    if images.mask.shape != images.map_img.shape:
        return

    unexplored_img = cv2.bitwise_and(images.map_img, images.mask)

    unexplored_tiles = np.count_nonzero(unexplored_img == 127)
    explored_tiles = np.count_nonzero(unexplored_img == 255)

    if unexplored_tiles and explored_tiles:
        explored_ratio = explored_tiles / \
            (unexplored_tiles + explored_tiles)
    else:
        explored_ratio = 0.0

    return explored_ratio


def collect_map_data():
    global images, map_data

    map_data.explored_ratio = np.float32(get_explored_ratio())
    if images.mask is not None:
        map_data.mask = list(images.mask.flatten().astype(np.uint8))

    return map_data


def save_images():
    global images

    cv2.imwrite(PATH + 'map_rgb.png', images.map_rgb)
    cv2.imwrite(PATH + 'map.png', images.map_img)
    cv2.imwrite(PATH + 'contour.png', images.contour)
    cv2.imwrite(PATH + 'mask.png', images.mask)


def main():

    # Node
    rospy.init_node('map_analyzer')
    rospy.on_shutdown(save_images)
    log.info('node initialized')

    # Services and Topics
    rospy.Subscriber("map", OccupancyGrid, get_map)
    publisher = rospy.Publisher('map_data', MapDataMsg)

    # Variables
    map_closed_prev = False
    rate = rospy.Rate(10)

    # Main loop
    while not rospy.is_shutdown():

        map_closed = get_closed_map()

        if map_closed is not map_closed_prev:

            rospy.wait_for_service('map_closed')
            try:
                service = rospy.ServiceProxy(
                    'map_closed',  MyBoolSrv)
                service_called = service(map_closed)

            except rospy.ServiceException as e:
                rospy.logfatal(f'Service failed as {e}')

        map_closed_prev = map_closed

        map_data = collect_map_data()
        publisher.publish(map_data)

        rate.sleep()


if __name__ == '__main__':
    main()
