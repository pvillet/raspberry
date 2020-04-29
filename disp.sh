#!/bin/bash

echo "C'est parti "
while true
do
   feh -Y -F -Z -D 1 /home/pi/Diffusion&
   feh_pid=$!
   echo "feh PID"
   echo $feh_pid
   change=0
   while [ $change -eq 0 ] 
   do
      echo "Checking"
      rclone check remote:01_Commission_Communication/Diffusion_Photos /home/pi/Diffusion
      res=$?
      echo $res
      if [ $res -gt 0 ]
      then
         echo "KILL"
         echo $feh_pid
         kill $feh_pid
         rclone sync remote:01_Commission_Communication/Diffusion_Photos /home/pi/Diffusion
         change=1
         sync
      else
         echo "Sleep"
         sleep 30 
      fi
   done

done

