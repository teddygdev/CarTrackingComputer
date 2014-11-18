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
	** Expand filesystem to fit all 16gb SD card
	** Change user password
	** Setup timezone
	** Enable SSH
	** Update raspi-config
	** Screenshots
8. Update repo and software based on this guide: http://elinux.org/index.php?title=Add_software_to_Raspberry_Pi&redirect=no
	* sudo apt-get update
	* sudo apt-get upgrade
9. Install SAMBA for easy sharing of files over network based on this guide: http://raspberrywebserver.com/serveradmin/share-your-raspberry-pis-files-and-folders-across-a-network.html
	* sudo apt-get install samba samba-common-bin
	* sudo nano /etc/samba/smb.conf
		** Added the following configuration: `[pihome]
   comment= Pi Home
   path=/home/pi
   browseable=Yes
   writeable=Yes
   only guest=no
   create mask=0777
   directory mask=0777
   public=no`
   		** Un-comment wins `support = yes`
   * sudo smbpasswd -a pi
   		** Set the password to the SAMBA login
   * sudo /etc/init.d/samba restart
   		** restarts SAMBA and allows us to use the drive
