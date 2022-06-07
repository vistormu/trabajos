#include "ros/ros.h"
#include "std_msgs/String.h"
#include "std_msgs/Bool.h"
#include <ctime>

using namespace ros;

/*
This node:
- Activates when a message is recieved in start_topic.
- Then, shows the current time every 3 seconds.
- And shows the elapsed time since the last start or reset call.
- Every minute publishes a message in still_alive_topic showing the node is still active.

Publisher to:
- still_alive_topic

Subscriber to:
- start_topic
- reset_topic

Messages in use:
None

Services in use:
None
*/

/*
** DECLARATIONS
*/

// Global variables
bool running = false;
time_t timeAtLastPub, startTime;

// Functions
void startCallback(const std_msgs::String::ConstPtr &msg);
void resetCallback(const std_msgs::String::ConstPtr &msg);

/*
** MAIN
*/

int main(int argc, char **argv)
{
    //Initialize node
    init(argc, argv, "clock_node");

    ROS_INFO("clock_node has  been created  successfully");

    //Variables
    NodeHandle node;
    Subscriber startSubscriber = node.subscribe("start_topic", 0, startCallback);
    Subscriber resetSubscriber = node.subscribe("reset_topic", 0, resetCallback);
    Publisher publisher = node.advertise<std_msgs::Bool>("still_alive_topic", 0);

    Rate rate(3);
    time_t currentTime;
    char timeUCT[80];
    char timeLocal[80];

    while (ok())
    {       
        if (running)
        {
            time(&currentTime);

            struct tm* currentTimeUCT = gmtime(&currentTime);
            struct tm* currentTimeLocal = localtime(&currentTime);
            double secondsSinceLastPub = difftime(currentTime, timeAtLastPub);
            double secondsSinceStart = difftime(currentTime, startTime);

            strftime(timeUCT, 80, "%T", currentTimeUCT);
            strftime(timeLocal, 80, "%T", currentTimeLocal);
            ROS_INFO("Local time: %s", timeLocal);
            ROS_INFO("UTC time: %s", timeLocal);
            ROS_INFO("Time elapsed since last message: %f seconds",secondsSinceLastPub);

            if (secondsSinceStart == 60)
            {
                time(&startTime);
                std_msgs::Bool alive;
                alive.data = true;
                publisher.publish(alive);
            }
        }

        spinOnce();
        rate.sleep();
    }

    return 0;
}

/*
** FUNCTIONS
*/

void startCallback(const std_msgs::String::ConstPtr &msg)
{
    time(&timeAtLastPub);
    time(&startTime);

    running = true;
    ROS_INFO("clock is ticking!");
}

void resetCallback(const std_msgs::String::ConstPtr &msg)
{
    time(&timeAtLastPub);
}