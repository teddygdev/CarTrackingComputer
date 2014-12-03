CarTrackingComputer
===================

A car tracking computer using a raspberry pi

Installation Documentation
==========================

1. Download Raspbian Version:September 2014 from http://www.raspberrypi.org/downloads/
	* The operating system
2. Download SDFormatterv4 from https://www.sdcard.org/downloads/formatter_4/
	* The tool format a current installation of Raspbian due to hidden partitions
3. Download Win32 DiskImage from http://www.raspberrypi.org/documentation/installation/installing-images/windows.md
	* Used to install a new Raspbian on the SD card
4. Format the current SD card to a clean slate. Use FAT32
	* Chose the name RASBPI for the SD card
	* Screenshots
5. Install Raspbian Sept 2014 Version
	* Use Win32 DiskImage
	* Screenshots
6. SSH for the first time
	* Through Putty
	* default user/pass is pi/raspberry
	* screenshots
7. Follow this tutorial for basic setup: http://elinux.org/RPi_Beginners
	* sudo raspi-config
	  * Expand filesystem to fit all 16gb SD card
	  * Change user password
	  * Setup timezone
	  * Enable SSH
	  * Update raspi-config
	  * Screenshots
8. Update repo and software based on this guide: http://elinux.org/index.php?title=Add_software_to_Raspberry_Pi&redirect=no
	* sudo apt-get update
	* sudo apt-get upgrade
9. Install SAMBA for easy sharing of files over network based on this guide: http://raspberrywebserver.com/serveradmin/share-your-raspberry-pis-files-and-folders-across-a-network.html
	* sudo apt-get install samba samba-common-bin
	* sudo nano /etc/samba/smb.conf
	  * Added the following configuration: `[pihome]
   comment= Pi Home
   path=/home/pi
   browseable=Yes
   writeable=Yes
   only guest=no
   create mask=0777
   directory mask=0777
   public=no`
   	  * Un-comment `wins support = yes`
   	* sudo smbpasswd -a pi
   	  * Set the password to the SAMBA login
   	* sudo /etc/init.d/samba restart
   	  * restarts SAMBA and allows us to use the drive
   	* screenshot
10. Add shutdown script to home folder for easier shutting down
11. Setup the display according to this guide from producer: https://learn.adafruit.com/adafruit-16x2-character-lcd-plus-keypad-for-raspberry-pi/usage
	* sudo nano /etc/modules
	  * add `i2c-bcm2708 
i2c-dev`
	* sudo apt-get install python-smbus
	* sudo apt-get install i2c-tools
	* sudo i2cdetect -y 1
	  * screenshot, everything is as expected
	* sudo apt-get install build-essential python-dev python-smbus python-pip git
	* sudo pip install RPi.GPIO
	* git clone https://github.com/adafruit/Adafruit_Python_CharLCD.git
	* cd Adafruit_Python_CharLCD
	* sudo python setup.py install
	* create turn_off.py script
12. Install the gyroscope and accelorometer https://www.piborg.org/xloborg/install
	* download the examples from their site and put in on rasp bi
	* bash xloborg/install.sh
	* python xloborg/XloBorg.py
	* Screenshot
13. Install RTC (real time clock) based on http://drewkeller.com/blog/adding-hardware-clock-raspberry-pi-ds3231
	* sudo sed -i 's/blacklist i2c-bcm2708/#blacklist i2c-bcm2708/' /etc/modprobe.d/raspi-blacklist.conf
	* sudo modprobe i2c-bcm2708
	* echo ds3231 0x68 | sudo tee /sys/class/i2c-adapter/i2c-1/new_device
	* sudo hwclock
	* sudo date -s "Nov 19 2014 12:46:00"
	* sudo hwclock -w
	* add to /etc/rc.local so it works everytime at boot
	  * `echo ds3231 0x68 > /sys/class/i2c-adapter/i2c-1/new_device
hwclock -s`
	* sudo update-rc.d ntp disable //notsure
	* sudo update-rc.d fake-hwclock disable //notsure
14. Setup 3g router //explain further pls
	* http://raspberry-at-home.com/installing-3g-modem/#more-138
	* https://github.com/Trixarian/sakis3g-source
	* http://www.androidbg.com/forum/topic55016-wifirkovodstvo-3g-vrzka-za-nexus-7-wifi-chrez-usb-modem.html
	* https://www.thefanclub.co.za/how-to/how-setup-usb-3g-modem-raspberry-pi-using-usbmodeswitch-and-wvdial
	* had to recompile, need to install usb mode switch
15. Replace component headers with extra long ones
	* describe here <<<<<<<
	* pictures
16. Install USB GPS following this guide http://blog.retep.org/2012/06/18/getting-gps-to-work-on-a-raspberry-pi/
	* sudo apt-get install gpsd gpsd-clients python-gps
	* sudo gpsd /dev/ttyUSB0 -F /var/run/gpsd.sock.
	* cgps -s and wait for lock-on
17. Set time to GPS time from guide http://blog.petrilopia.net/linux/raspberry-pi-set-time-gps-dongle/
	* Use stGpsTime.sh script
	* ./setGpsTime.sh
	* sudo hwclock -s
	* Now we are adjusted to GPS time on the hwclock as well
18. Try logging data following this guide http://www.danmandle.com/blog/getting-gpsd-to-work-with-python/
	* Use gpsdData.py script to use it
19. Get SQLite running following this guide http://www.raspberrypiblog.com/2012/11/getting-started-with-databases-on-pi.html and this one as well http://www.python-sqlite-database.com/Python_SQLite_Databases.pdf
	* sudo apt-get install sqlite3
	* sqlite3 MyFirstDatabase.db
20. Modify the gpsdData.py script to log the data in its own database
	* 
21. Create Car Friendly power supply as well as shutdown controller
	* http://electronics.stackexchange.com/questions/61877/shutdown-controller-for-raspberry-pi-in-a-car
22. Test out the gpio pins for the shutdown controller
23. Create a shutdown script for pin 25
	* gpio.py
24. Setup GPS for production
	* sudo killall gpsd
	* sudo gpsd /dev/ttyUSB0 -n -F /var/run/gpsd.sock
25. Create mainScript.py that will run everytime on the Pi
	* add gps column heading to db
	* write gps heading
	* shutting down
	* status led
	* saving gps and compass and gforces
	* editable frequency of save
26. Setup a cron job for mainScript http://unix.stackexchange.com/questions/57852/crontab-job-start-1-min-after-reboot
27. Test out the gathered data with excel
28. Work on 3g again to fix it, this time wvdial https://www.thefanclub.co.za/how-to/how-setup-usb-3g-modem-raspberry-pi-using-usbmodeswitch-and-wvdial
	* ID 19d2:0031 ZTE WCDMA Technologies MSM MF110/MF627/MF636
	* this is what we need to initiat a modeswitch without soft reset
	* 0031
	  * # ZTE MF637
	  * TargetVendor=  0x19d2
	  * TargetProduct= 0x0094
	  * MessageContent="5553424312345678000000000000061b000000020000000000000000000000"
	  * NeedResponse=1
	* 2000
	  * # ZTE devices

	  * TargetVendor=   0x19d2
	  * TargetProductList="0001,0002,0015,0016,0017,0031,0037,0052,0055,0061,0063,0064,$

	  * MessageContent="5553424312345678000000000000061e000000000000000000000000000000"
	  * MessageContent2="5553424312345679000000000000061b000000020000000000000000000000"
	  * MessageContent3="55534243123456702000000080000c85010101180101010101000000000000"

	  * NeedResponse=1
	* end up using modeswitch for switching modes and back to sakis, because wvdial doesn't assign dns if connected to eth0, so no ssh 
29. Implement backend restful API using nodejs



https://www.google.com/maps/d/viewer?mid=z0t5BDVNdbNs.klKsSK28GlPs