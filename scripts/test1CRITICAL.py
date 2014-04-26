#!/usr/bin/python

import RPi.GPIO as GPIO
import time
from sys import argv 
# blinking function
#We are above 10.0 degrees, turn this on
GPIO.setmode(GPIO.BOARD)
GPIO.setup(11, GPIO.OUT)
GPIO.setup(12, GPIO.OUT)
GPIO.setup(13, GPIO.OUT)

GPIO.output(13,GPIO.HIGH)
GPIO.output(12,GPIO.HIGH)
GPIO.output(11,GPIO.HIGH)
#GPIO.cleanup()

