import rospy
import rosnode
import os
import time

from core import logger

from autonomous_slam.srv import *
from autonomous_slam.msg import MapDataMsg
from geometry_msgs.msg import Pose

log = logger.Logger('handler')

PATH = '/home/parallels/Programs/ros/src/autonomous_slam/maps/'

ALWAYS_DO = False

INITIAL_POSE = Pose()
INITIAL_POSE.position.x = 2.0
INITIAL_POSE.position.y = 2.0
INITIAL_POSE.orientation.w = 1.0

map_closed = False
exploration_over = False
explored_ratio = 0.0


def get_map_data(data: MapDataMsg) -> None:
    global explored_ratio

    if data.explored_ratio:
        explored_ratio = data.explored_ratio


def handle_map_closed(req: MyBoolSrvRequest) -> bool:
    global map_closed

    map_closed = req.input
    log.info(f'{map_closed=}')

    return True


def handle_exploration_over(req: MyBoolSrvRequest) -> bool:
    global exploration_over

    exploration_over = req.input
    log.info(f'{exploration_over=}')

    return True


def main():
    global map_closed, exploration_over, explored_ratio

    # Node
    rospy.init_node('node_handler')
    log.info('node initialized')

    # Services and Topics
    rospy.Service('map_closed', MyBoolSrv, handle_map_closed)
    rospy.Service('exploration_over', MyBoolSrv, handle_exploration_over)
    rospy.Subscriber('map_data', MapDataMsg, get_map_data)

    # Variables
    handled_map_closed = False
    wall_follower_enabled = False
    rate = rospy.Rate(10)

    # Main loop
    while not rospy.is_shutdown():

        if not map_closed and not wall_follower_enabled:

            # Enable wall follower
            rospy.wait_for_service('enable_wall_follower')
            try:
                service = rospy.ServiceProxy(
                    'enable_wall_follower',  MyBoolSrv)
                wall_follower_enabled = service(True)
                log.info(f'{wall_follower_enabled=}')

            except rospy.ServiceException as e:
                rospy.logfatal(f'Service failed as {e}')

            exploration_over = False
            handled_map_closed = False

        elif map_closed and not handled_map_closed:

            # Disable wall follower
            rospy.wait_for_service('enable_wall_follower')
            try:
                service = rospy.ServiceProxy(
                    'enable_wall_follower',  MyBoolSrv)
                wall_follower_disabled = service(False)
                wall_follower_enabled = not wall_follower_disabled
                log.info(f'{wall_follower_disabled=}')

            except rospy.ServiceException as e:
                rospy.logfatal(f'Service failed as {e}')

            # Move to initial point
            rospy.wait_for_service('move_to_point')
            try:
                service = rospy.ServiceProxy(
                    'move_to_point',  MyPoseSrv)
                initial_point_reached = service(INITIAL_POSE)
                log.info(f'Initial point reached={initial_point_reached}')

            except rospy.ServiceException as e:
                rospy.logfatal(f'Service failed as {e}')

            if explored_ratio < 0.95 or ALWAYS_DO:

                # Start voronoi
                rospy.wait_for_service('start_voronoi')
                try:
                    service = rospy.ServiceProxy('start_voronoi',  MyBoolSrv)
                    voronoi_started = service(True)
                    log.info(f'{voronoi_started=}')

                except rospy.ServiceException as e:
                    rospy.logfatal(f'Service failed as {e}')

            else:
                voronoi_started = True
                exploration_over = True
                log.info(f'{exploration_over=}')

            handled_map_closed = wall_follower_disabled and initial_point_reached and voronoi_started

        if exploration_over and map_closed:

            # Move to initial point
            rospy.wait_for_service('move_to_point')
            try:
                service = rospy.ServiceProxy(
                    'move_to_point',  MyPoseSrv)
                initial_point_reached = service(INITIAL_POSE)
                log.info(f'Initial point reached={initial_point_reached}')

            except rospy.ServiceException as e:
                rospy.logfatal(f'Service failed as {e}')

            # Save map
            os.system(f'rosrun map_server map_saver -f {PATH}my_map')

            log.info('map saved successfully')

            # Get statistics
            rospy.wait_for_service('save_data')
            try:
                service = rospy.ServiceProxy('save_data',  MyBoolSrv)
                data_saved = service(True)
                log.info('statistics saved successfully')

            except rospy.ServiceException as e:
                rospy.logfatal(f'Service failed as {e}')

            # Kill all proccesses
            rosnode.kill_nodes(['wall_follower'])
            rosnode.kill_nodes(['statistics'])
            rosnode.kill_nodes(['map_analyzer'])
            rosnode.kill_nodes(['move_to_point'])
            rosnode.kill_nodes(['voronoi'])
            rosnode.kill_nodes(['node_handler'])

        rate.sleep()


if __name__ == '__main__':
    main()
