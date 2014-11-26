#! /usr/bin/python
# Written by Dan Mandle http://dan.mandle.me September 2012
# License: GPL 2.0
 
import os
from gps import *
from time import *
import time
import threading

# Import the required Python module
import sqlite3

# Create the database, a connection to it and a cursor 


#cursor.execute("INSERT INTO gps VALUES (null, 'Electric Ladyland', 'Jimi Hendrix', null, null, null, null, null)") 
#cursor.execute("INSERT INTO gps VALUES (null, 'Collection', 'Tracy Chapman', null, null, null, null, null)") 
#cursor.execute("INSERT INTO gps VALUES (null, 'Are You Experienced', 'Jimi Hendrix', null, null, null, null, null)") 
#cursor.execute("INSERT INTO gps VALUES (null, 'Goats Head Soup', 'Rolling Stones', null, null, null, null, null)") 



#end of db stuff 
 
gpsd = None #seting the global variable
 
os.system('clear') #clear the terminal (optional)
 
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
 
if __name__ == '__main__':
  gpsp = GpsPoller() # create the thread
  try:
    gpsp.start() # start it up
    connection = sqlite3.connect('CarTrackingData.db') 
    cursor = connection.cursor()
    while True:
      #It may take a second or two to get good data
      #print gpsd.fix.latitude,', ',gpsd.fix.longitude,'  Time: ',gpsd.utc
 
      os.system('clear')
 
      print
      print ' GPS reading'
      print '----------------------------------------'
      print 'latitude    ' , gpsd.fix.latitude
      print 'longitude   ' , gpsd.fix.longitude
      print 'time utc    ' , gpsd.utc,' + ', gpsd.fix.time
      print 'altitude (m)' , gpsd.fix.altitude
      print 'eps         ' , gpsd.fix.eps
      print 'epx         ' , gpsd.fix.epx
      print 'epv         ' , gpsd.fix.epv
      print 'ept         ' , gpsd.fix.ept
      print 'speed (m/s) ' , gpsd.fix.speed
      print 'climb       ' , gpsd.fix.climb
      print 'track       ' , gpsd.fix.track
      print 'mode        ' , gpsd.fix.mode
      print
      print 'sats        ' , gpsd.satellites

      params=(gpsd.utc, gpsd.fix.latitude, gpsd.fix.longitude, gpsd.fix.altitude, gpsd.fix.speed, gpsd.fix.climb, gpsd.fix.mode)
      cursor.execute("INSERT INTO gps VALUES (null, ?,?,?,?,?,?,?)", params) 
      connection.commit()

      time.sleep(1) #set to whatever
 
  except (KeyboardInterrupt, SystemExit): #when you press ctrl+c
    print "\nKilling Thread..."
    cursor.close()
    connection.close() 
    gpsp.running = False
    gpsp.join() # wait for the thread to finish what it's doing
  print "Done.\nExiting."