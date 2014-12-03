#! /usr/bin/python
 
import os
from gps import *
from time import *
from datetime import datetime
import time
import threading
import math
import sys

import Adafruit_CharLCD as LCD

# Import the required Python module
import sqlite3

# Load the XLoBorg library
import XLoBorg

# Tell the library to disable diagnostic printouts
XLoBorg.printFunction = XLoBorg.NoPrint

# Start the XLoBorg module (sets up devices)
XLoBorg.Init()

 



# Initialize the LCD using the pins 
lcd = LCD.Adafruit_CharLCDPlate()

# Make list of button value, text, and backlight color.
buttons = ( (LCD.SELECT, 'Select', (1,1,1)),
            (LCD.LEFT,   'Left'  , (1,0,0)),
            (LCD.UP,     'Up'    , (0,0,1)),
            (LCD.DOWN,   'Down'  , (0,1,0)),
            (LCD.RIGHT,  'Right' , (1,0,1)) )


gpsd = None #seting the global variable

exitFlag = 0
stopLights = 0
writeFreq = 1
gpsLock=False


 
#os.system('clear') #clear the terminal (optional)
 
class GpsPoller(threading.Thread):
  def __init__(self):
    threading.Thread.__init__(self)
    global gpsd #bring it in scope
    gpsd = gps(mode=WATCH_ENABLE) #starting the stream of info
    self.current_value = None
    self.running = True #setting the thread running to true
 
  def run(self):
    global gpsd
    while gpsp.running:
      gpsd.next() #this will continue to loop and grab EACH set of gpsd info to clear the buffer

class myThread (threading.Thread):
    def __init__(self, threadID, name, counter):
        threading.Thread.__init__(self)
        self.threadID = threadID
        self.name = name
        self.counter = counter
    def run(self):
        print "Starting " + self.name
        print_time(self.name, self.counter, 5)
        print "Exiting " + self.name

class displayController (threading.Thread):
    def __init__(self):
        threading.Thread.__init__(self)
        self.running = True
        #self.threadID = threadID
        #self.name = name
        #self.counter = counter
    def run(self):
        print time.ctime(time.time()) + ': Starting Display'
        while True:
          if gpsLock == False:
            blink_red(0.5, 5)
          else:
            blink_green(0.1, 3, 1)

class buttonController (threading.Thread):
    def __init__(self):
        threading.Thread.__init__(self)
        self.running = True
        self.shutdownFlag=0
        #self.threadID = threadID
        #self.name = name
        #self.counter = counter
    def run(self):
        print time.ctime(time.time()) + ': Starting Button Controller'
        
        while True:
          # Loop through each button and check if it is pressed.
          for button in buttons:
            if lcd.is_pressed(button[0]):
              # Button is pressed, change the message and backlight.
              lcd.clear()
              #lcd.message(button[1])
              if button[0]==4:
                print '-'
                global writeFreq
                if writeFreq<=1:
                  if writeFreq>0.2:
                    writeFreq -=0.1
                    lcd.clear()
                    lcd.message("Write Frequency\n" + str(writeFreq))
                  else:
                    lcd.message("Write Frequency\n" + str(writeFreq))
                else:
                  if writeFreq>=2:  
                    writeFreq-=1
                    lcd.clear()
                    lcd.message("Write Frequency\n" + str(writeFreq))
              if button[0]==1:
                print '+'
                global writeFreq
                if writeFreq<1:
                  writeFreq +=0.1
                  lcd.clear()
                  lcd.message("Write Frequency\n" + str(writeFreq))
                else:  
                  writeFreq+=1
                  lcd.clear()
                  lcd.message("Write Frequency\n" + str(writeFreq))
              if self.shutdownFlag:
                if button[0]==1:
                  print "\nKilling Application"
                  lcd.clear()
                  lcd.message("Shutting Down")
                  #sys.exit()
                  global exitFlag
                  exitFlag=1
                  os.system("sudo shutdown -h now")
                else:
                  self.shutdownFlag=0
              if button[0] == 0:
                lcd.message("Really Shutdown?\nNo       Yes")
                self.shutdownFlag=1
            time.sleep(0.05)    
              #lcd.set_color(button[2][0], button[2][1], button[2][2])
        #print_time('test', 0.1, 5000)
        #print_time(self.name, self.counter, 5)
        #print "Exiting " + self.name                    

def blink_red(delay, counter):
    while counter:
      if exitFlag:
            thread.exit()
      lcd.set_color(1.0, 0.0, 0.0)
      time.sleep(delay)        
      lcd.set_color(0.0, 0.0, 0.0)
      time.sleep(delay)
      counter -= 1

def blink_green(on, off, counter):
    while counter:
      if exitFlag:
            thread.exit()
      lcd.set_color(0.0, 1.0, 0.0)
      time.sleep(on)        
      lcd.set_color(0.0, 0.0, 0.0)
      time.sleep(off)   
      counter -= 1  



def print_time(threadName, delay, counter):
    while counter:
        if exitFlag:
            thread.exit()
        time.sleep(delay)
        print "%s: %s" % (threadName, time.ctime(time.time()))
        counter -= 1      



if __name__ == '__main__':
  gpsp = GpsPoller() # create the thread
  display = displayController()
  button = buttonController()
  #thread1 = myThread(1, "Thread-1", 1)
  #thread2 = myThread(2, "Thread-2", 2)
  try:
    gpsp.start() # start it up
    button.start()
    display.start()
    
    #thread1.start()
    #thread2.start()
    connection = sqlite3.connect('/home/pi/CarTrackingData.db') 
    cursor = connection.cursor()
    while True:
      if gpsd.fix.latitude != 0:
        gpsLock = True
        params=(str(datetime.now()), gpsd.fix.latitude, gpsd.fix.longitude, gpsd.fix.altitude, gpsd.fix.speed, gpsd.fix.climb, gpsd.fix.mode, gpsd.fix.track)
        cursor.execute("INSERT INTO gps VALUES (null, ?,?,?,?,?,?,?,?)", params) 
        connection.commit()
        print str(datetime.now()) +' :wrote gps to db'
      else:
        gpsLock = False
      x, y, z = XLoBorg.ReadAccelerometer()
      params2=(str(datetime.now()), x, y, z)
      mx, my, mz = XLoBorg.ReadCompassRaw()
      params3=(str(datetime.now()), mx, my, mz)
      cursor.execute("INSERT INTO gforces VALUES (null, ?,?,?,?)", params2) 
      cursor.execute("INSERT INTO compass VALUES (null, ?,?,?,?)", params3) 
      connection.commit()
      if exitFlag:
        print 'exit'
        raise SystemExit
      time.sleep(writeFreq) #set to whatever

 
  except (KeyboardInterrupt, SystemExit): #when you press ctrl+c
    print "\nKilling Thread..."
    cursor.close()
    connection.close() 
    gpsp.running = False
    button.running = False
    display.running = False
    exitFlag=1
    gpsp.join() # wait for the thread to finish what it's doing
    time.sleep(5)
    os._exit(0)
  print "Done.\nExiting."