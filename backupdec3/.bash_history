sudo raspi-config
date
sudo raspi-config
apt-get update
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install samba samba-common-bin
sudo nano /etc/samba/smb.conf
smbpasswd -a pi
sudo smbpasswd -a pi
sudo /etc/init.d/samba restart
sudo nano /etc/samba/smb.conf
sudo /etc/init.d/samba restart
sudo nano /etc/samba/smb.conf
sudo /etc/init.d/samba restart
sudo nano /etc/samba/smb.conf
sudo /etc/init.d/samba restart
sudo nano /etc/modules
ls
./shutdown.sh 
ls
sudo apt-get install python-smbus
sudo apt-get install i2c-tools
sudo i2cdetect -y 1
sudo i2cdetect -y 0
sudo i2cdetect -y 1
git
sudo apt-get install build-essential python-dev python-smbus python-pip git
sudo pip install RPi.GPIO
git clone https://github.com/adafruit/Adafruit_Python_CharLCD.git
cd Adafruit_Python_CharLCD/
sudo python setup.py install
cd examples/
sudo python char_lcd_plate.py 
ls
sudo python char_lcd_mcp.py 
sudo python char_lcd.py
sudo python char_lcd_rgb_pwm.py
man copy
man cp
cp char_lcd_plate.py turn_off.py
ls
nano turn_off.py 
sudo python turn_off.py
nano lcdtest.py
sudo python lcd_test.py
sudo python lcdtest.py
sudo python turn_off.py
sudo python lcdtest.py
sudo python turn_off.py

i2c
i2cdetect
i2cdetect -F
i2cdetect -F 0x20
i2cdetect -y
i2cdetect -y 0x20
i2cdetect -y 1
sudo i2cdetect -y 1
sudo i2cdetect -y 20
sudo i2cdetect -y 0x20
sudo i2cdetect 1
sudo i2cdetect 20
cd /dev
ls
cd i2c-1
ll 
ls -a
nano i2c-1
i2cdetect -F 1
sudo i2cdetect -F 1
sudo i2cdetect -I
sudo i2cdetect -l
cd
i2cset -y 1 0x20 0x00 0x1f
sudo i2cset -y 1 0x20 0x00 0x1f
sudo python turn_off.py
sudo python Adafruit_Python_CharLCD/examples/turn_off.py 
sudo i2cset -y 1 0x20 0x00 0x3f
sudo python Adafruit_Python_CharLCD/examples/turn_off.py 
sudo i2cset -y 1 0x20 0x00 0x3f
sudo i2cset -y 1 0x20 0x00 0x1f
sudo python Adafruit_Python_CharLCD/examples/turn_off.py 
sudo python  Adafruit_Python_CharLCD/setup.py install
sudo python Adafruit_Python_CharLCD/examples/turn_off.py 
./shutdown.sh 
sudo python Adafruit_Python_CharLCD/examples/turn_off.py 
cd Adafruit_Python_CharLCD
git pull
git status
git reset hard --head
git reset --hard head
git reset --hard 
git status
sudo python setup.py install
cd examples/
sudo python char_lcd_plate.py 
sudo python turn_off.py 
cd ..
sudo python setup.py install
sudo python examples/char_lcd_plate.py 
sudo python examples/turn_off.py
sudo nano build/lib.linux-armv6l-2.7/
sudo nano build/lib.linux-armv6l-2.7/Adafruit_CharLCD/Adafruit_CharLCD.py 
sudo python examples/turn_off.py
sudo nano build/lib.linux-armv6l-2.7/Adafruit_CharLCD/Adafruit_CharLCD.py 
date
sudo python setup.py install
sudo python examples/turn_off.py
sudo python setup.py install
sudo python examples/turn_off.py
sudo python setup.py install
sudo python examples/turn_off.py
sudo python setup.py install
sudo python examples/turn_off.py
sudo python setup.py install
sudo python examples/turn_off.py
sudo python setup.py install
sudo python examples/turn_off.py
sudo python setup.py install
sudo python examples/turn_off.py
sudo python setup.py install
sudo python examples/turn_off.py
sudo python setup.py install
sudo python examples/turn_off.py
sudo python setup.py install
sudo python examples/turn_off.py
git reset --hard
sudo python setup.py install
sudo python examples/turn_off.py
cd ..
./shutdown.sh 
cd xloborg/
chmod +x install.sh
./install.sh
./shutdown.sh 
cd ..
./shutdown.sh 
sudo i2cdetect -y 1
cd xloborg/
ls
./XLoBorg.py 
./ReadAccelerometer.py 
~./shutdown.sh 
~/./shutdown.sh 
sudo sed -i 's/blacklist i2c-bcm2708/#blacklist i2c-bcm2708/' /etc/modprobe.d/raspi-blacklist.conf
sudo modprobe i2c-bcm2708
echo ds3231 0x68 | sudo tee /sys/class/i2c-adapter/i2c-1/new_device
sudo hwclock
sudo dpkg-reconfigure tzdata
sudo date -s "Sep 27 2014 12:46:00"
sudo date -s "Nov 19 2014 12:12:00"
sudo hwclock -w
sudo hwclock 
date
sudo hwclock 
sudo i2cdetect -y 1
sudo nano /etc/rc.local 
sudo update-rc.d ntp disable
sudo update-rc.d fake-hwclock disable
~./shutdown.sh 
~/./shutdown.sh 
date
sudo hwclock 
sudo ntpd -gq
date
sudo nano /etc/rc.local 
~/./shutdown.sh 
date
sudo update-rc.d ntp enable
sudo update-rc.d fake-hwclock enable
sudo nano /etc/rc.local 
~/./shutdown.sh 
date
sudo date -s "Nov 19 2014 02:18:30"
sudo hwclock -w
echo ds3231 0x68 | sudo tee /sys/class/i2c-adapter/i2c-1/new_device
sudo hwclock -w
sudo hwclock
sudo nano /etc/rc.local 
~/./shutdown.sh 
date
sudo i2cdetect -y 1
sudo apt-get install ppp
wget "http://raspberry-at-home.com/files/sakis3g.tar.gz"
sudo mkdir /usr/bin/modem3g
sudo chmod 777 /usr/bin/modem3g
sudo cp sakis3g.tar.gz /usr/bin/modem3g
cd /usr/bin/modem3g
sudo tar -zxvf sakis3g.tar.gz
sudo chmod +x sakis3g
2
3
4
5
6
7
8
9
10
sudo ./sakis3g connect
./sakis3g recompile
sudo apt-get install libusb
sudo apt-get search libusb
sudo apt-get 
apt-cache search libusb
sudo apt-get install libusb-dev
./sakis3g recompile
sudo ./sakis3g connect
sudo ./sakis3g connect info
sudo ./sakis3g connect
lsusb
sudo ./sakis3g connect --debug
sudo apt-get install usb_modeswitch
sudo apt-get install usb-modeswitch
sudo ./sakis3g connect --debug
lsusb
sudo ./sakis3g connect --debug
sudo ./sakis3g connect
ls
nano /etc/sakis3g.conf
sudo nano /etc/sakis3g.conf
sudo ./sakis3g connect
sudo ./sakis3g --interactive "menu" "console"
sudo nano /etc/sakis3g.conf
sudo ./sakis3g connect
sudo nano /etc/sakis3g.conf
sudo ./sakis3g connect
sudo nano /etc/sakis3g.conf
sudo ./sakis3g connect
sudo nano /etc/sakis3g.conf
sudo ./sakis3g connect
sudo nano /etc/sakis3g.conf
sudo ./sakis3g connect
ifconfig
curl --interface ppp0 http://pikchat.me
ifconfig
sudo ./sakis3g disconnect
lsusb
sudo ./sakis3g connect
ifconfig

ifconfig
curl --interface ppp0 http://pikchat.me
ifconfig
sudo ./sakis3g disconnect
date
~/./shutdown.sh 
date
~/./shutdown.sh 
date
cd Adafruit_Python_CharLCD/
cd examples/
sudo python char_lcd_plate.py
sudo i2cdetect -y 1
~/./shutdown.sh 
sudo i2cdetect -y 1
ls
cd xloborg/
ls
sudo python XLoBorg.py
~/./shutdown.sh 
sudo i2cdetect -y 1
date
sudo i2cdetect -y 1
cd xloborg/
ls
sudo python XLoBorg.py
sudo nano /etc/modules
sudo /etc/modprobe.d/raspi-blacklist.conf
sudo nano /etc/modprobe.d/raspi-blacklist.conf
sudo i2cdetect -y 1
sudo reboot
sudo i2cdetect -y 1
sudo nano /etc/modprobe.d/raspi-blacklist.conf
sudo i2cdetect -y 1
gpio load i2c
gpio
ls /dev
~/./shutdown.sh 
ls /dev
sudo i2cdetect -y 1
history
sudo i2cset -y 1 0x20 0x00 0x3f
sudo i2cset -y 1 0x20 0x00 0x1f
sudo nano /etc/modprobe.d/raspi-blacklist.conf
~/./shutdown.sh 
sudo i2cset -y 1 0x20 0x00 0x1f
sudo i2cdetect -y 1
~/./shutdown.sh 
sudo i2cdetect -y 1
cd Adafruit_Python_CharLCD/
cd examples/
sudo python char_lcd_plate
sudo python char_lcd_plate.py 
~/./shutdown.sh 
date
cd Adafruit_Python_CharLCD/examples/
sudo python turn_off.py 
sudo python char_lcd_plate.py 
sudo python turn_off.py 
sudo i2cdetect -y 1
sudo python turn_off.py 
ls
~/./shutdown.sh 
date
sudo lsusb
ls /var/log/syslog
sudo apt-get install gpsd gpsd-clients python-gps
sudo lsusb
cd /var/log/syslog
ls /dev
sudo gpsd /dev/ttyUSB0 -F /var/run/gpsd.sock
cgps -s
./setGpsTime.sh 
date
hwclock
sudo hwclock
sudo hwclock -s
sudo hwclock
date
cgps -s
python gpsdData.py 
sudo apt-get install sqlite3
sqlite3 MyFirstDatabase.db
ls
sqlite3 MyFirstDatabase.db
sqlite3 CarTrackingData.db
ls
python gpsdData.py 
sqlite3 CarTrackingData.db
python gpsdData.py 
sqlite3 CarTrackingData.db
python gpsdData.py 
sqlite3 CarTrackingData.db
python gpsdData.py 
sqlite3 CarTrackingData.db
python gpsdData.py 
ls -l
~/./shutdown.sh 
date
sudo hwclock
~/./shutdown.sh 
date
sudo hwclock
ls
./setGpsTime.sh 
sudo date -s "Nov 23 2014 21:39:45"
sudo hwclock -s

date
sudo date -s "Nov 23 2014 21:39:45"
date
sudo hwclock -w

sudo hwclock
sudo python
sudo python gpio.py 
sudo i2cdetect -y 1
ls
cd Adafruit_Python_CharLCD/
cd examples/
ls
sudo python  char_lcd_plate.py 
sudo python turn_off.py 
cd
cd xloborg/
ls
sudo python XLoBorg.py
sudo hwclock
~/./shutdown.sh 
date
sudo hwclock
pff
~/./shutdown.sh 
date
sudo hwclock
ks
ls
sudo python gpio.py 
date
sudo nano /etc/rc.local
cd /home/pi
sudo nano /etc/rc.local
sudo python gpio.py &
date
sudo nano /etc/rc.local
sudo reboot
date
cgps -s
lsusb
cgps -s
sudo reboot
sudo date -s "Nov 25 2014 23:23:10"
sudo hwclock -w
sudo hwclock -s
sudo hwclock
date
cgps -s
sudo nano /etc/rc.local
sudo killall gpsd
sudo nano /etc/rc.local
cgps -s
sudo gpsd /dev/ttyUSB0 -F -n /var/run/gpsd.sock
cgps -s
python mainScript.py 
sqlite3 CarTrackingData.db
python mainScript.py 
cgps -s
sudo killall gpsd
sudo gpsd /dev/ttyUSB0 -F -n /var/run/gpsd.sock
cgps -s
sudo gpsd /dev/ttyUSB0 -F -n /var/run/gpsd.sock
cgps -s
sudo reboot
cgps -s
sudo killall gpsd
cgps -s
sudo gpsd /dev/ttyUSB0 -n -F /var/run/gpsd.sock
cgps -s
python mainScript.py 
sqlite3 CarTrackingData.db
python mainScript.py 
ls
sqlite3 CarTrackingData.db
python mainScript.py 
cgps -s
sudo nano /etc/rc.local
python mainScript.py 
sudo killall gpsd
sudo gpsd /dev/ttyUSB0 -n -F /var/run/gpsd.sock
python mainScript.py 
sqlite3 CarTrackingData.db
python mainScript.py 
ls
cd xloborg/
ls
./install.sh 
cd .
cd ..
python mainScript.py 
sudo nano /etc/rc.local
sudo nano /etc/modprobe.d/raspi-blacklist.conf
python mainScript.py 
sudo nano /etc/rc.local
python mainScript.py 
ps aux
sudo killall python
ps aux
python mainScript.py 
sudo nano /etc/rc.local
sudo reboot
sudo nano /etc/rc.local
ps aux
sudo reboot
date
ps aux
ps aux |grep python
ps aux |grep main
python mainScript.py 
sudo nano /etc/rc.local
sudo reboot
date
ps aux
sudo nano /etc/rc.local
~/./shutdown.sh 
ps aux
ls
./startScript.sh 
nano startScript.sh 
./startScript.sh 
nano startScript.sh 
./startScript.sh 
bash startScript.sh 
nano startScript.sh 
./startScript.sh 
bash startScript.sh 
nano startScript.sh 
bash startScript.sh 
sudo crontab -e
sudo nano /etc/rc.local
sudo reboot
jobs
fg
jobs
python &
jobs
fg %1
jobs
mainScript &
sudo killall python
python mainScript.py 
sudo crontab -e
sudo reboot
sudo crontab -e
sudo reboot
ls
man debug.txt
less debug.txt 
cgps -s
less debug.txt 
sudo python mainScript.py 
ps aux
jobs
main &
fg
jobs
mainScript &
sudo crontab -e
sudo reboot
date
ls
less debug.txt 
sudo crontab -e
sudo reboot
which python
sudo crontab -e
sudo reboot
ls
cd /
ls
cd tmp
ls
less main.err
sqlite3 CarTrackingData.db
cd
sqlite3 CarTrackingData.db
sudo crontab -e
sudo reboot
cd /
ls
cd tmp
ls
less main.out
less main.err
sudo crontab -e
sudo reboot
ps aux
~/./shutdown.sh 
