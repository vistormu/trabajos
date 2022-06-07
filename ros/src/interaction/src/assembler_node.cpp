#include <iostream>
#include "ros/ros.h"
#include "interaction/position_msg.h"
#include "std_msgs/String.h"
#include "interaction/information_msg.h"
#include "interaction/user_msg.h"

using namespace std;
using namespace ros;
using namespace interaction;

/*
This node:
- Recieves all the information through the topics.
- Assembles the information into one message.

Publisher to:
- user_topic

Subscriber to:
- emotion_topic
- information_topic
- position_topic

Messages in use:
- std_msgs/String
- position_msg
- emotion_msg
- information_msg
- user_msg

Services in use:
None
*/

/*
** CLASSES
*/

class User
{
    public:
        struct Information{
            string name;
            int age;
            vector<string> languages;
            bool recieved = false;
        } information;

        struct Emotion{
            string name;
            bool recieved = false;
        } emotion;

        struct Position{
            int x;
            int y;
            int z;
            bool recieved = false;
        } position;

        bool checkReception()
        {
            return information.recieved && emotion.recieved && position.recieved;
        }

        void resetReception()
        {
            information.recieved = emotion.recieved = position.recieved = false;
        }
};

/*
** DECLARATIONS
*/

// Global variables
User user;

// Functions
void handleEmotion(const std_msgs::String::ConstPtr &msg);
void handlePosition(const position_msg::ConstPtr &msg);
void handleInformation(const information_msg::ConstPtr &msg);
user_msg fillInformation(User user);

/*
** MAIN
*/

int main(int argc, char **argv)
{
    //Initialize node
    init(argc, argv, "assembler_node");

    //Variables
    NodeHandle node;
    Subscriber sub1 = node.subscribe("emotion_topic", 0, handleEmotion);
    Subscriber sub2 = node.subscribe("position_topic",0, handlePosition);
    Subscriber sub3 = node.subscribe("information_topic", 0, handleInformation);
    Publisher publisher = node.advertise<user_msg>("user_topic", 0);

    ROS_INFO("assembler_node has been created successfully");

    Rate rate(3);

    while(ok())
    {
        if (user.checkReception())
        {
            ROS_INFO("all information has been recieved");

            user_msg userMessage = fillInformation(user);

            publisher.publish(userMessage);

            ROS_INFO("message sent successfully");

            user.resetReception();
        }

        spinOnce();
        rate.sleep();
    }

    return 0;
}

/*
** FUNCTIONS
*/

void handleEmotion(const std_msgs::String::ConstPtr &msg)
{    
    user.emotion.name = msg-> data;

    user.emotion.recieved = true;
    ROS_INFO("user emotion recieved successfully");
}

void handlePosition(const position_msg::ConstPtr &msg)
{
    user.position.x = msg->x;
    user.position.y = msg->y;
    user.position.z = msg->z;

    user.position.recieved = true;
    ROS_INFO("user position recieved successfully");
}

void handleInformation(const information_msg::ConstPtr &msg)
{
    user.information.age = msg->age;
    user.information.name = msg->name;
    user.information.languages.clear();
    for (int i=0; i<int(msg->languages.size()); i++)
    {  
        user.information.languages.push_back(msg->languages[i]);
    }

    user.information.recieved = true;
    ROS_INFO("user information recieved successfully");
}

user_msg fillInformation(User user)
{
    user_msg userMessage;

    userMessage.information.name = user.information.name;
    userMessage.information.age = user.information.age;
    userMessage.information.languages = user.information.languages;
    userMessage.emotion = user.emotion.name;
    userMessage.position.x = user.position.x;
    userMessage.position.y = user.position.y;
    userMessage.position.z = user.position.z;

    return userMessage;
}