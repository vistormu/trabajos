#include "ros/ros.h"
#include "std_msgs/String.h"
#include <iostream>

using namespace std;
using namespace ros;

/*
This node:
- Asks continuously for the emotion felt by the user.
- The input is recieved via the terminal as a String.

Publisher to:
- emotion_topic

Subscriber to:
None

Messages in use:
None

Services in use:
None
*/

int main(int argc, char **argv)
{
    // Initialize node
    init(argc, argv, "emotion_node");

    // Variables
    NodeHandle node;
    Publisher publisher = node.advertise<std_msgs::String>("emotion_topic", 0);
    std_msgs::String emotionMessage;
    
    ROS_INFO("emotion_node has been created successfully");    

    while (ok())
    {
        // Input the message and publish it
        cout << "Input an emotion: ";
        cin >> emotionMessage.data;

        publisher.publish(emotionMessage);

        ROS_INFO("Message has been published successfully");
    }

    return 0;
}