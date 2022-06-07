import rospy
import numpy as np
import json

from core import logger

from nav_msgs.msg import Odometry
from autonomous_slam.srv import *
from autonomous_slam.msg import MapDataMsg

log = logger.Logger('statistics')

prev_position = np.array((0.0, 0.0))
distance = np.array((0.0, 0.0))
total_distance = 0

explored_ratio = 0.0
compute_statistics = False

PATH = '/home/parallels/Programs/ros/src/autonomous_slam/maps/'


def get_distance(data: Odometry):
    global prev_position, distance, total_distance

    position = np.array((data.pose.pose.position.x,
                         data.pose.pose.position.y))

    distance += np.abs(position - prev_position)

    prev_position = position

    total_distance = np.linalg.norm(distance)


def get_explored_ratio(data: MapDataMsg) -> None:
    global explored_ratio

    if data.explored_ratio:
        explored_ratio = data.explored_ratio


def handle_save_data(data: MyBoolSrvRequest) -> bool:
    global compute_statistics

    compute_statistics = data.input

    return True


def main():
    global compute_statistics, distance, explored_ratio, total_distance

    # Node
    rospy.init_node('statistics')
    log.info('node initialized')

    # Services and Topics
    rospy.Subscriber('odom', Odometry, get_distance)
    rospy.Subscriber('map_data', MapDataMsg, get_explored_ratio)
    rospy.Service('save_data', MyBoolSrv, handle_save_data)

    # Variables
    start_time = rospy.Time.now()
    rate = rospy.Rate(10)

    # Main loop
    while not rospy.is_shutdown():

        if compute_statistics:

            # Total time
            end_time = rospy.Time.now()
            total_time = end_time - start_time

            statistics = {'total_time': total_time.secs,
                          'distance': total_distance,
                          'explored_ratio': explored_ratio,
                          }

            with open(PATH + "statistics.json", "w") as outfile:
                json.dump(statistics, outfile)

        rate.sleep()


if __name__ == '__main__':
    main()
