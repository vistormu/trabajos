#include <iostream>
#include "ros/ros.h"
#include "interaction/user_msg.h"
#include "interaction/product_srv.h"
#include "std_msgs/String.h"
#include "std_msgs/Bool.h"

using namespace std;
using namespace ros;
using namespace interaction;

/*
This node:
- Recieves the user information from the assembler_node.
- Displays all the information.

Publisher to:
- start_topic
- reset_topic

Subscriber to:
- user_topic

Messages in use:
- user_msg

Services in use:
- product_srv
*/

/*
** DECLARATIONS
*/

// Global variables
int age;
bool userRecieved = false;

// Functions
void handleUser(const user_msg::ConstPtr &msg);
void handleClock(const std_msgs::Bool::ConstPtr &msg);

/*
** MAIN
*/

int main(int argc, char **argv)
{
    //Initialize node
    init(argc, argv, "dialog_node");

    ROS_INFO("dialog_node has been created successfully");

    //Variables
    NodeHandle node;
    Subscriber subscriber = node.subscribe("user_topic", 0, handleUser);
    ServiceClient client = node.serviceClient<product_srv>("product_service");
    Publisher startPublisher = node.advertise<std_msgs::String>("start_topic", 0);
    Publisher resetPublisher = node.advertise<std_msgs::String>("reset_topic", 0);
    Subscriber subscriber2 = node.subscribe("still_alive_topic", 0, handleClock);

    Rate rate(3);
    bool started = false;

    while(ok())
    {
        if (userRecieved)
        {
            product_srv service;
            service.request.age = age;

            std_msgs::String resetMessage;
            std_msgs::String startMessage;

            resetMessage.data = "reset";
            resetMessage.data = "start";

            if (client.call(service))
            {
                ROS_INFO("response of the server: %d", service.response.result);

                if (!started)
                {
                    startPublisher.publish(startMessage);
                    started = true;
                }
                resetPublisher.publish(resetMessage);
            }
            else 
                ROS_ERROR("could not reach server");
            
            userRecieved = false;
        }

        spinOnce();
        rate.sleep();
    }

    return 0;
}

/*
** FUNCTIONS
*/


void handleUser(const user_msg::ConstPtr &msg)
{
    ROS_INFO("user information recieved successfully");

    age = msg->information.age;
    userRecieved = true;

    cout << endl;
    cout << "Name: " << msg->information.name << endl;
    cout << "Age: " << msg->information.age << endl;
    cout << "Languages: ";
    for (int i=0 ; i<msg->information.languages.size() ; i++)
    {
        cout << msg->information.languages[i];
        if (i == msg->information.languages.size()-1) cout << endl;
        else cout << ", ";
    }
    cout << "Emotion: " << msg->emotion << endl;
    cout << "Position (x,y,z): (" << msg->position.x << 
                    "," << msg->position.y << 
                    "," << msg->position.z << ")" << endl;
}

void handleClock(const std_msgs::Bool::ConstPtr &msg)
{
    if (msg->data)
    {
        ROS_INFO("clock is still running");
    }
}