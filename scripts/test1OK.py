#!/usr/bin/python

import RPi.GPIO as GPIO
import time
from sys import argv 
#We are at or below 9.0 degrees, turn off

GPIO.setmode(GPIO.BOARD)
GPIO.setup(11, GPIO.OUT)
GPIO.setup(12, GPIO.OUT)
GPIO.setup(13, GPIO.OUT)
GPIO.output(11,GPIO.LOW)
GPIO.output(12,GPIO.LOW)
GPIO.output(13, GPIO.LOW)

#GPIO.cleanup()

