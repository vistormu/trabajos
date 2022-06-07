from time import sleep
from src import draw
from src import constants as c
from src.algorithms import bfs, dfs, greedy_bfs
from src.entities import Node, Maps
import pygame as pg


def __selectMap(number):
    if number == '1':
        return Maps.map1
    elif number == '2':
        return Maps.map2
    elif number == '3':
        return Maps.map3
    elif number == '4':
        return Maps.map4
    elif number == '5':
        return Maps.map5
    elif number == '6':
        return Maps.map6
    elif number == '7':
        return Maps.map7
    elif number == '8':
        return Maps.map8
    elif number == '9':
        return Maps.map9
    elif number == '10':
        return Maps.map10
    elif number == '11':
        return Maps.map11


def main():

    # Introduce algorithm
    ok = False
    print("\nSELECT ALGORITHM")
    print("1. bfs\n2. greedy_bfs\n3. dfs")
    while not ok:
        try:
            algorithm = input()
            int(algorithm)
        except:
            print("\n!!!!")
            print("Error: input is not a number")
            print("!!!!\n")
        else:
            if (int(algorithm) in range(1, 4)):
                ok = True
            else:
                print("\n!!!!")
                print("Error: input out of range")
                print("!!!!\n")

    # Introduce a map
    ok = False
    while not ok:
        try:
            mapNumber = input("\nSELECT MAP (1-11)\n")
            int(mapNumber)
        except:
            print("\n!!!!")
            print("Error: input is not a number")
            print("!!!!\n")
        else:
            if (int(mapNumber) in range(1, 12)):
                ok = True
            else:
                print("\n!!!!")
                print("Error: input out of range")
                print("!!!!\n")

    # Create map
    map = __selectMap(mapNumber)

    # Create first node
    nodes = []
    init = Node(map.start[0], map.start[1], c.FIRST_ID, c.FIRST_PARENT_ID)
    nodes.append(init)

    # Create screen
    pg.init()
    screen = pg.display.set_mode(
        (map.width*c.BLOCK_SIZE, map.height*c.BLOCK_SIZE))
    screen.fill(c.WHITE)

    # Loop
    finished = False

    while not finished:

        for event in pg.event.get():
            if event.type == pg.QUIT:
                finished = True

        # Draw coloured squares and the grid
        for x in range(map.height):
            for y in range(map.width):
                if (map.charMap[x][y] == c.VISITED):
                    draw.square(screen, x, y, c.BLOCK_SIZE, c.RED)
                elif (map.charMap[x][y] == c.START):
                    draw.square(screen, x, y, c.BLOCK_SIZE, c.GRAY)
                elif (map.charMap[x][y] == c.OBSTACLE):
                    draw.square(screen, x, y, c.BLOCK_SIZE, c.BLACK)
                elif (map.charMap[x][y] == c.GOAL):
                    draw.square(screen, x, y, c.BLOCK_SIZE, c.GREEN)

        draw.grid(screen, map.height*c.BLOCK_SIZE, map.width *
                  c.BLOCK_SIZE, c.BLOCK_SIZE, c.BLACK)

        # Refresh screen
        sleep(0.05)
        pg.display.update()

        # Algorithms
        # bfs
        if (algorithm == "1"):
            # Iterate
            goalParentId = bfs.iterate(nodes, map)

            # Draw path when found
            if (goalParentId != -1):
                finished = True
                path = bfs.path(nodes, goalParentId)
                for node in path:
                    draw.square(screen, node[0],
                                node[1], c.BLOCK_SIZE, c.GREEN)
                    sleep(0.05)
                    draw.grid(screen, map.height*c.BLOCK_SIZE, map.width *
                              c.BLOCK_SIZE, c.BLOCK_SIZE, c.BLACK)
                    pg.display.update()

        # greedy bfs
        if (algorithm == "2"):
            # Iterate
            goalParentId = greedy_bfs.iterate(nodes, map)

            # Draw path when found
            if (goalParentId != -1):
                finished = True
                path = greedy_bfs.path(nodes, goalParentId)
                for node in path:
                    draw.square(screen, node[0],
                                node[1], c.BLOCK_SIZE, c.GREEN)
                    sleep(0.01)
                    draw.grid(screen, map.height*c.BLOCK_SIZE, map.width *
                              c.BLOCK_SIZE, c.BLOCK_SIZE, c.BLACK)
                    pg.display.update()

        # dfs
        elif (algorithm == "3"):
            # Iterate
            goalParentId = dfs.iterate(nodes, map)

            # Backtracking
            if (goalParentId == -2):
                dfs.backtrack(nodes, map)

            # Goal found
            elif (goalParentId != -1):
                finished = True

    # Summary
    if (algorithm == "1"):
        bfs.log(nodes, path)
    elif (algorithm == '2'):
        greedy_bfs.log(nodes, path)


if __name__ == '__main__':
    repeat = True

    while repeat:
        main()

        answer = input("\nRepeat? (y/n):\n")
        if (answer != 'y'):
            repeat = False
