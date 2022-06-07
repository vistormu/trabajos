from src import constants as c
from src.entities import Node


def iterate(nodes, map):
    goalParentId = -1

    searching = True

    lastNode = nodes[-1]

    direction = 0

    while searching:
        tmpX = lastNode.x + c.DIRECTIONS[direction][0]
        tmpY = lastNode.y + c.DIRECTIONS[direction][1]

        if (map.charMap[tmpX][tmpY] == c.FREE):
            map.charMap[tmpX][tmpY] = c.VISITED
            newNode = Node(tmpX, tmpY, len(nodes), lastNode.id)
            nodes.append(newNode)
            searching = False

        elif(map.charMap[tmpX][tmpY] == c.GOAL):
            goalParentId = lastNode.id
            searching = False

        else:
            direction = (direction+1) % len(c.DIRECTIONS)

            if (direction == 0):
                goalParentId = -2
                searching = False

    return goalParentId


def backtrack(nodes, map):

    tmpNodes = reversed(nodes)

    for node in tmpNodes:

        for d in c.DIRECTIONS:

            tmpX = node.x + d[0]
            tmpY = node.y + d[1]

            if (map.charMap[tmpX][tmpY] == c.FREE):
                nodes.append(node)
                break
        else:
            continue
        break
