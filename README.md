# raspberry


#Add last line to the following file to autostart the app
cat  /etc/xdg/lxsession/LXDE-pi/autostart


@lxpanel --profile LXDE-pi
@pcmanfm --desktop --profile LXDE-pi
@xscreensaver -no-splash
@/bin/bash /home/pi/FCM_raspberry/disp.sh 
