#!/usr/bin/env python

import rospy
from interaction.msg import position_msg as Position

# This node:
# - Asks continuously for the position of the user.
# - The input is recieved via the terminal as an integer.

# Publisher to:
# - position_topic

# Subscriber to:
# None

# Messages in use:
# - position.msg

# Services in use:
# None

def run():
    
    # Initialize node
    rospy.init_node('position_node', anonymous=True)
    publisher = rospy.Publisher('position_topic', Position, queue_size=0)
    
    rospy.loginfo('position_node has been created successfully')
    
    while not rospy.is_shutdown():
        
        positionMessage = Position()
        
        try:
            positionInput = input('Introduce position (x,y,z): ').strip().split(',')
            positionMessage.x = int(positionInput[0])
            positionMessage.y = int(positionInput[1])
            positionMessage.z = int(positionInput[2])
        except:
            rospy.logfatal('wrong input')
        else:
            publisher.publish(positionMessage)
            rospy.loginfo('The message has been sent successfully')
        

if __name__ == '__main__':
    try:
        run()
    except rospy.ROSInterruptException:
        pass