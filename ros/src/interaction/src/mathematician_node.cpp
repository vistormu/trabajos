#include "ros/ros.h"
#include "interaction/product_srv.h"

using namespace ros;
using namespace interaction;

/*
This node:
- Recieves the age from the dialog_node.
- Sends back the age multiplied by 2.

Publisher to:
None

Subscriber to:
None

Messages in use:
None

Services in use:
- product_srv
*/

/*
** DECLARATIONS
*/

bool handleClient(product_srv::Request &request, product_srv::Response &response);

/*
** MAIN
*/

int main(int argc, char **argv)
{
    //Initialize node
    init(argc, argv, "mathematician_node");

    //Variables
    NodeHandle node;
    ServiceServer service = node.advertiseService("product_service", handleClient);

    ROS_INFO("mathematician_node has been created successfully");

    spin();

    return 0;
}

/*
** FUNCTIONS
*/

bool handleClient(product_srv::Request &request, product_srv::Response &response)
{
    ROS_INFO("data recieved successfully");

    response.result = request.age * 2;

    return true;
}