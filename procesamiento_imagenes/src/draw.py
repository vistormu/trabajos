import cv2 as cv
import numpy as np


def centroid(image, point):

    xLabel = 'X: ' + str(point[0])
    yLabel = 'Y: ' + str(point[1])

    cv.circle(image, point, 5, (0, 0, 255), -1)
    cv.putText(image, yLabel,
               (point[0] + 25, point[1] + 25), cv.FONT_HERSHEY_SIMPLEX, 0.5, (255, 255, 255), 2)
    cv.putText(image, xLabel,
               (point[0] - 25, point[1] - 25), cv.FONT_HERSHEY_SIMPLEX, 0.5, (255, 255, 255), 2)

    return image


def trail(image, points):

    for i in range(1, len(points)):
        thickness = int(np.sqrt(32 / float(i + 1)) * 2.5)
        cv.line(image, points[i - 1], points[i], (0, 0, 255), thickness)

    return image
