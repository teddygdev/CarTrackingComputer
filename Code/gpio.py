#!/usr/bin/python

#import RPi.GPIO as GPIO

#GPIO.setmode(GPIO.BCM)

#GPIO.setup(25, GPIO.IN, pull_up_down = GPIO.PUD_DOWN)

#while True:

#	if(GPIO.input(25) ==1):

#		print("There is power")

#	if(GPIO.input(25) == 0):

#		print("there is no power")

#GPIO.cleanup()


 
import RPi.GPIO as GPIO
import os, time
 
GPIO.setmode(GPIO.BCM)
#GPIO.setup(24, GPIO.IN)
#GPIO.setup(25, GPIO.OUT)
#GPIO.output(25, GPIO.HIGH)
GPIO.setup(25, GPIO.IN, pull_up_down = GPIO.PUD_DOWN)
#print ("[Info] Telling Sleepy Pi we are running pin 25")
 
while True:
    #print GPIO.input(25)
    if(GPIO.input(25) == False):
    	print("Shutting down Raspberry Pi")
        os.system("sudo shutdown -h now")
        break
    time.sleep(1)