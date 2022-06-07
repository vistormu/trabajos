import cv2 as cv
import numpy as np
import os

from collections import deque
from keras.models import load_model

from core.logger import Logger
from src import color_interval, centroid, draw, utils

# Global variables
os.environ['TF_CPP_MIN_LOG_LEVEL'] = '3'


def main():

    # Import model
    model = load_model('assets/mnist.h5')

    # Create logger
    logger = Logger('main')
    # logger.muteDebug = True

    # Define variables
    camera = cv.VideoCapture(0)
    points = deque(maxlen=64)
    drawing = False
    drawn = False

    crop = 0.5
    width = int(camera.get(3)*crop)
    height = int(camera.get(4)*crop)

    logger.debug('width and height: ' + str(width) + ', ' + str(height))

    # Select color interval
    lowHSV, highHSV = color_interval.get()
    logger.info('color interval has been selected successfully')
    logger.debug('Color interval (H,S,V): ' +
                 str(lowHSV) + ', ' + str(highHSV))

    logger.info(
        'Press \'d\' to draw, \'esp\' to see the results and \'q\' to quit')

    while True:

        # Read image from camera
        _, frame = camera.read()
        frame = cv.resize(frame, None, fx=crop, fy=crop,
                          interpolation=cv.INTER_AREA)
        frame = cv.flip(frame, 1)

        # Get centroid
        point = centroid.get(frame, lowHSV, highHSV)

        key = cv.waitKey(1)
        if key == 100:  # d
            points.clear()
            drawing = True
            drawn = False
        elif key == 32:  # esp
            drawing = False
            drawn = True

        if point is not None:
            frame = draw.centroid(frame, point)

            if drawing:
                points.appendleft(point)
                frame = draw.trail(frame, points)

        if drawn and points:

            # Get image of the drawn points
            image = utils.toImage(list(points), [width, height])
            imageResized = cv.resize(image, (28, 28))
            imageResized = imageResized.reshape(1, 28, 28, 1)/255.0

            # Predict value with cnn model
            prediction = model.predict(imageResized)[0]

            drawn = False
            logger.info('image created successfully')
            logger.debug('Result: ' + str(prediction.argmax()) +
                         ', ' + str(int(max(prediction)*100))+'%')

        elif drawn and not points:
            drawn = False
            logger.warning('no points have been saved')

        # Result
        cv.imshow("Camera", frame)

        try:
            cv.imshow('Generated drawing', image)
        except:
            pass

        # Exit condition
        if cv.waitKey(1) & 0xFF == ord('q'):
            logger.info('program terminated by user')
            cv.destroyAllWindows()
            break


if __name__ == '__main__':
    main()
