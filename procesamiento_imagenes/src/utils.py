import numpy as np
import cv2 as cv


def toImage(points, size):

    width = size[0]
    height = size[1]

    thickness = 5

    image = np.zeros((height, width, 1), np.uint8)

    for i in range(1, len(points)):
        cv.line(image, points[i - 1], points[i],
                (255, 255, 255), thickness=thickness)

    minCol = min(points)[0] - thickness
    maxCol = max(points)[0] + thickness
    minRow = min(points, key=lambda item: item[1])[1] - thickness
    maxRow = max(points, key=lambda item: item[1])[1] + thickness

    imageCropped = image[minRow:maxRow, minCol:maxCol]

    return imageCropped
