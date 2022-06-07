import src.constants as c
from src.entities import Node


def iterate(nodes, map):

    def __addPoint(node, x, y):
        nonlocal nodes, map

        if (map.charMap[x][y] == c.FREE):
            map.charMap[x][y] = c.VISITED
            newNode = Node(x, y, len(nodes), node.id)
            nodes.append(newNode)
            return True
        else:
            return False

    def __moveUp(node):
        tmpX = node.x + c.DIRECTIONS[0][0]
        tmpY = node.y + c.DIRECTIONS[0][1]

        return __addPoint(node, tmpX, tmpY)

    def __moveRight(node):
        tmpX = node.x + c.DIRECTIONS[1][0]
        tmpY = node.y + c.DIRECTIONS[1][1]

        return __addPoint(node, tmpX, tmpY)

    def __moveDown(node):
        tmpX = node.x + c.DIRECTIONS[2][0]
        tmpY = node.y + c.DIRECTIONS[2][1]

        return __addPoint(node, tmpX, tmpY)

    def __moveLeft(node):
        tmpX = node.x + c.DIRECTIONS[3][0]
        tmpY = node.y + c.DIRECTIONS[3][1]

        return __addPoint(node, tmpX, tmpY)

    def __move(node):

        diffX = map.goal[0] - node.x
        diffY = map.goal[1] - node.y

        didMove = False

        if (diffX < 0 and diffY == 0):
            didMove = __moveUp(node)
        elif (diffX == 0 and diffY > 0):
            didMove = __moveRight(node)
        elif (diffX > 0 and diffY == 0):
            didMove = __moveDown(node)
        elif (diffX == 0 and diffY < 0):
            didMove = __moveLeft(node)

        elif (diffX < 0 and diffY > 0):
            if (abs(diffX) > abs(diffY)):
                if not __moveUp(node):
                    didMove = __moveRight(node)
                else:
                    didMove = True
            else:
                if not __moveRight(node):
                    didMove = __moveUp(node)
                else:
                    didMove = True

        elif (diffX > 0 and diffY > 0):
            if (abs(diffX) > abs(diffY)):
                if not __moveDown(node):
                    didMove = __moveRight(node)
                else:
                    didMove = True
            else:
                if not __moveRight(node):
                    didMove = __moveDown(node)
                else:
                    didMove = True

        elif (diffX > 0 and diffY < 0):
            if (abs(diffX) > abs(diffY)):
                if not __moveDown(node):
                    didMove = __moveLeft(node)
                else:
                    didMove = True
            else:
                if not __moveLeft(node):
                    didMove = __moveDown(node)
                else:
                    didMove = True

        elif (diffX < 0 and diffY < 0):
            if (abs(diffX) > abs(diffY)):
                if not __moveUp(node):
                    didMove = __moveLeft(node)
                else:
                    didMove = True
            else:
                if not __moveLeft(node):
                    didMove = __moveUp(node)
                else:
                    didMove = True

        return didMove

    def __expand():
        nonlocal nodes, map

        goalParentId = -1

        tmpNodes = []

        for node in nodes:

            for d in c.DIRECTIONS:

                tmpX = node.x + d[0]
                tmpY = node.y + d[1]

                if(map.charMap[tmpX][tmpY] == c.FREE):

                    map.charMap[tmpX][tmpY] = c.VISITED

                    newNode = Node(tmpX, tmpY, len(
                        nodes)+len(tmpNodes), node.id)
                    tmpNodes.append(newNode)

                elif(map.charMap[tmpX][tmpY] == c.GOAL):
                    goalParentId = node.id

        nodes += tmpNodes

        return goalParentId

    # %%

    goalParentId = -1

    if not __move(nodes[-1]):
        goalParentId = __expand()

        for node in reversed(nodes):
            if __move(node):
                break

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
    print("GREEDY BFS ALGORITHM SUMMARY")
    print("- Number of nodes: " + str(len(nodes)))
    print("- Number of nodes in the path: " + str(len(path)))
    print("- Total nodes/Nodes in path: " + str(len(nodes)/len(path)))
    print("\n%%%%%%\n")
