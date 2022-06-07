import cv2 as cv
import numpy as np
from core.logger import Logger


def _createTrackbars():
    cv.namedWindow("HUE")
    cv.createTrackbar("Low H", "HUE", 62, 179, lambda _: None)
    cv.createTrackbar("High H", "HUE", 79, 179, lambda _: None)
    cv.namedWindow("SATURATION")
    cv.createTrackbar("Low S", "SATURATION", 34, 255, lambda _: None)
    cv.createTrackbar("High S", "SATURATION", 255, 255, lambda _: None)
    cv.namedWindow("VALUE")
    cv.createTrackbar("Low V", "VALUE", 0, 255, lambda _: None)
    cv.createTrackbar("High V", "VALUE", 255, 255, lambda _: None)


def _getTrackbarValues():
    lowH = cv.getTrackbarPos("Low H", "HUE")
    highH = cv.getTrackbarPos("High H", "HUE")
    lowS = cv.getTrackbarPos("Low S", "SATURATION")
    highS = cv.getTrackbarPos("High S", "SATURATION")
    lowV = cv.getTrackbarPos("Low V", "VALUE")
    highV = cv.getTrackbarPos("High V", "VALUE")

    return np.array([lowH, lowS, lowV]), np.array([highH, highS, highV])


def _getMask(image, low, high):
    hsv = cv.cvtColor(image, cv.COLOR_BGR2HSV)

    mask = cv.inRange(hsv, low, high)
    mask = cv.morphologyEx(mask, cv.MORPH_OPEN,
                           np.ones((5, 5), np.uint8))
    mask = cv.medianBlur(mask, ksize=5)

    result = cv.bitwise_and(image, image, mask=mask)

    return result


def get():

    logger = Logger('Color Interval')
    logger.info('press \'q\' when finished')

    camera = cv.VideoCapture(0)
    crop = 0.5
    height = int(camera.get(4)*crop)

    _createTrackbars()

    while True:

        # Read image
        hsvWheel = cv.imread("assets/hsv_wheel.png")

        if (hsvWheel is None):
            logger.error('image could not be read')
            return

        hsvWheel = cv.resize(hsvWheel, (height, height))

        # Read frame captured by camera and get the hsv vector
        _, frame = camera.read()
        frame = cv.resize(frame, None, fx=crop, fy=crop,
                          interpolation=cv.INTER_AREA)
        frame = cv.flip(frame, 1)

        # Get trackbar values
        lowHSV, highHSV = _getTrackbarValues()

        # Apply mask with the selected interval
        frameMask = _getMask(frame, lowHSV, highHSV)
        hsvWheelMask = _getMask(hsvWheel, lowHSV, highHSV)

        # Display results
        cv.imshow("Camera Mask", frameMask)
        cv.imshow('HSV Wheel', hsvWheelMask)

        # Exit condition
        if cv.waitKey(1) & 0xFF == ord('q'):
            break

    cv.destroyAllWindows()

    return lowHSV, highHSV
