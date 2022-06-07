from src.entities import Node
from src import constants as c


def iterate(nodes, map):
    goalParentId = -1

    tmpNodes = []

    for node in nodes:

        for d in c.DIRECTIONS:

            tmpX = node.x + d[0]
            tmpY = node.y + d[1]

            if(map.charMap[tmpX][tmpY] == c.FREE):

                map.charMap[tmpX][tmpY] = c.VISITED

                newNode = Node(tmpX, tmpY, len(nodes)+len(tmpNodes), node.id)
                tmpNodes.append(newNode)

            elif(map.charMap[tmpX][tmpY] == c.GOAL):
                goalParentId = node.id

    nodes += tmpNodes

    return goalParentId


def path(nodes, goalParentId):
    path = []
    finished = False
    while not finished:
        for node in nodes:
            if(node.id == goalParentId):
                goalParentId = node.parentId
                path.append([node.x, node.y])
                if(goalParentId == c.FIRST_PARENT_ID):
                    finished = True
    return path


def log(nodes, path):
    print("\n%%%%%%\n")
    print("BFS ALGORITHM SUMMARY")
    print("- Number of nodes: " + str(len(nodes)))
    print("- Number of nodes in the path: " + str(len(path)))
    print("- Total nodes/Nodes in path: " + str(len(nodes)/len(path)))
    print("\n%%%%%%\n")
