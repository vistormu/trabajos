import cv2 as cv
import numpy as np


def _getMask(image, low, high):
    hsv = cv.cvtColor(image, cv.COLOR_BGR2HSV)

    mask = cv.inRange(hsv, low, high)
    mask = cv.morphologyEx(mask, cv.MORPH_OPEN,
                           np.ones((5, 5), np.uint8))
    mask = cv.medianBlur(mask, ksize=5)

    return mask


def get(image, low, high):

    # Get mask of the image given a value
    mask = _getMask(image, low, high)

    # Detect contours
    contours, _ = cv.findContours(
        mask, mode=cv.RETR_EXTERNAL, method=cv.CHAIN_APPROX_SIMPLE)

    # Only proceed if a contour is found
    if len(contours) == 0:
        return

    # Get the only the biggest contour
    biggestContour = max(contours, key=cv.contourArea)
    ((x, y), radius) = cv.minEnclosingCircle(biggestContour)

    # Only proceed if the radius is big enough
    if radius < 10:
        return

    # Moment of the biggest contour
    moment = cv.moments(biggestContour)

    # Position of the biggest contour
    center = (int(moment["m10"] / moment["m00"]),
              int(moment["m01"] / moment["m00"]))

    return center
