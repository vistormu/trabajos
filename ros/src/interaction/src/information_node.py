#!/usr/bin/env python

import rospy
from interaction.msg import information_msg as Information

# This node:
# - Asks continuously for the name, age and languages of the user.
# - The input is recieved via the terminal.

# Publisher to:
# - information_topic

# Subscriber to:
# None

# Messages in use:
# - information.msg

# Services in use:
# None


def run():
    
    # Initialize node
    rospy.init_node('information_node', anonymous=True)
    publisher = rospy.Publisher('information_topic', Information, queue_size=0)
    
    rospy.loginfo('information_node has been created successfully')
    
    while not rospy.is_shutdown():
        
        informationMessage = Information()
        
        try:
            informationMessage.name = input('Enter the name: ')
            informationMessage.age = int(input('Enter the age: '))
            languages = input('Enter languages: ').replace(' ','').split(',')
            informationMessage.languages = languages
        except:
            rospy.logfatal('wrong input')
        else:
            publisher.publish(informationMessage)
            rospy.loginfo('The message has been sent successfully')
        

if __name__ == '__main__':
    try:
        run()
    except rospy.ROSInterruptException:
        pass