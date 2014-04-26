#!/usr/bin/python

import RPi.GPIO as GPIO
import time
from sys import argv 
# blinking function
# DO NOTHING, we are between 9.0-10.0 degress
GPIO.setmode(GPIO.BOARD)
GPIO.setup(11, GPIO.OUT)
#GPIO.setup(13, GPIO.OUT)

GPIO.output(13,GPIO.HIGH)
#GPIO.output(11,GPIO.HIGH)

#GPIO.cleanup()

