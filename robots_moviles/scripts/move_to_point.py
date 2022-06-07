import rospy
import actionlib

from core import logger

from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal
from autonomous_slam.srv import *

log = logger.Logger('move')


def handle_move_to_point(req: MyPoseSrvRequest) -> bool:

    # Navigation server
    client = actionlib.SimpleActionClient('move_base', MoveBaseAction)
    if not client.wait_for_server(rospy.Duration(5.0)):
        rospy.logerr('Timeout error: could not reach server')
        return

    # Goal
    goal = MoveBaseGoal()

    goal.target_pose.header.frame_id = "map"
    goal.target_pose.header.stamp = rospy.Time.now()

    goal.target_pose.pose.position.x = req.pose.position.x
    goal.target_pose.pose.position.y = req.pose.position.y
    goal.target_pose.pose.orientation.w = req.pose.orientation.w

    client.send_goal(goal)

    # Result
    if req.pose.position.x == 2.0 and req.pose.position.x == 2.0:
        timeout = 60
    else:
        timeout = 30

    goal_achieved = client.wait_for_result(
        timeout=rospy.Duration(secs=timeout))

    if not goal_achieved:
        rospy.logerr('Goal could not be reached')

    return goal_achieved


def main():

    # Node
    rospy.init_node('move_to_point')
    log.info('node initialized')

    # Services
    rospy.Service('move_to_point', MyPoseSrv, handle_move_to_point)

    # Main loop
    rospy.spin()


if __name__ == '__main__':
    main()
