import os
from enum import Enum, auto
from src import constants as c

CWD = os.getcwd()


class Node:
    def __init__(self, x, y, id, parentId):
        self.x = x
        self.y = y
        self.id = id
        self.parentId = parentId

    def dump(self):
        print("---------- x "+str(self.x) +
              " | y "+str(self.y) +
              " | id "+str(self.id) +
              " | parentId "+str(self.parentId))


class Map:
    def __init__(self, path, start, goal):
        self.charMap = self.__loadMap(path)
        self.width = len(self.charMap[0])
        self.height = len(self.charMap)
        self.start = start
        self.goal = goal
        self.charMap[start[0]][start[1]] = c.START
        self.charMap[goal[0]][goal[1]] = c.GOAL

    def __loadMap(self, path):
        charMap = []
        with open(path) as f:
            lines = f.readlines()
            for line in lines:
                charLine = line.strip().split(',')
                charMap.append(charLine)
        return charMap

    def dump(self):
        for line in self.charMap:
            print(line)


class Maps(Map):
    map1 = Map(CWD+"/assets/maps/map1.csv", [2, 2], [7, 2])
    map2 = Map(CWD+"/assets/maps/map2.csv", [2, 2], [10, 7])
    map3 = Map(CWD+"/assets/maps/map3.csv", [4, 10], [4, 14])
    map4 = Map(CWD+"/assets/maps/map4.csv", [4, 14], [4, 10])
    map5 = Map(CWD+"/assets/maps/map5.csv", [3, 15], [3, 9])
    map6 = Map(CWD+"/assets/maps/map6.csv", [2, 2], [10, 17])
    map7 = Map(CWD+"/assets/maps/map7.csv", [3, 9], [3, 15])
    map8 = Map(CWD+"/assets/maps/map8.csv", [2, 2], [10, 17])
    map9 = Map(CWD+"/assets/maps/map9.csv", [3, 9], [3, 15])
    map10 = Map(CWD+"/assets/maps/map10.csv", [3, 9], [3, 15])
    map11 = Map(CWD+"/assets/maps/map11.csv", [3, 15], [3, 9])
