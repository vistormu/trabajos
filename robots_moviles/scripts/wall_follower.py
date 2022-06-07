#!/usr/bin/env python3

import rospy
import numpy as np

from core import logger

from geometry_msgs.msg import Twist, Vector3
from sensor_msgs.msg import LaserScan
from autonomous_slam.srv import *
from autonomous_slam.srv import *

log = logger.Logger('follower')

SIDE_START_ANGLE = 20
SIDE_RANGE = 60
FRONT_RANGE = 16
DISTANCE_FROM_WALL = 1
MAX_VELOCITY = 0.2

RIGHTY = False


class Distances:
    front: np.ndarray = 0
    left: np.ndarray = 0
    right: np.ndarray = 0


distances = Distances()
enabled = False


def handle_enable_wall_follower(req: MyBoolSrvRequest) -> bool:
    global enabled

    enabled = req.input

    if not enabled:
        publisher = rospy.Publisher('cmd_vel', Twist, queue_size=10)
        vel_msg = Twist(Vector3(0, 0, 0), Vector3(0, 0, 0))
        publisher.publish(vel_msg)

    return True


def get_distances(data: LaserScan) -> None:
    global distances

    distances_array = np.array(data.ranges)
    distances_array[distances_array == np.inf] = 7
    distances_array[distances_array == 0] = 6

    distances.left = distances_array[SIDE_START_ANGLE:(
        SIDE_START_ANGLE+SIDE_RANGE)]

    distances.right = distances_array[(
        360-SIDE_START_ANGLE-SIDE_RANGE):(360-SIDE_START_ANGLE)]

    distances.front = np.concatenate(
        (distances_array[0:FRONT_RANGE//2],
         distances_array[(360-FRONT_RANGE//2):360]))


def main():
    global distances, enabled

    # Node
    rospy.init_node('wall_follower')
    log.info('node initialized')

    # Services and Topics
    publisher = rospy.Publisher('cmd_vel', Twist, queue_size=10)
    rospy.Subscriber('scan', LaserScan, get_distances)
    rospy.Service('enable_wall_follower', MyBoolSrv,
                  handle_enable_wall_follower)

    # Variables
    kp = 2
    ki = 0.3
    kd = 0.2

    prev_error = 0
    integral = 0

    rate = rospy.Rate(10)

    # Main loop
    while not rospy.is_shutdown():

        if enabled:

            if RIGHTY:
                min_right_distance = np.min(distances.right)
            else:
                min_right_distance = np.min(distances.left)
            min_front_distance = np.min(distances.front)*0.8
            min_distance = np.minimum(min_right_distance, min_front_distance)

            error = DISTANCE_FROM_WALL - min_distance

            proportional = error
            # integral += error
            integral = np.clip(integral, 0, 2)
            derivative = error - prev_error

            output = kp*proportional + ki*integral + kd*derivative
            if not RIGHTY:
                output = -output

            prev_error = error

            angular_zvel = np.clip(output, -1.2, 1.2)

            linear_vel = MAX_VELOCITY * \
                np.clip(
                    np.min(distances.front),
                    0,
                    DISTANCE_FROM_WALL) \
                / DISTANCE_FROM_WALL

            vel_msg = Twist(Vector3(linear_vel, 0, 0),
                            Vector3(0, 0, angular_zvel))
            publisher.publish(vel_msg)

    rate.sleep()


if __name__ == '__main__':
    main()
