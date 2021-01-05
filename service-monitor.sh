#!/bin/bash

server_monitor() { 
  status=$(pidof $service | wc -l )                      # counts service process names into variable
  if [ $status -gt 0 ]                                   # if variable greater than 0
  then
      echo                                               
      echo -e " >> $service is \033[1;32mup!\e[0m"       # escape codes for color
  else
      echo
      echo -e " >> $service is \033[1;31mdown!\e[0m"     # escape codes for color
      echo " >> restarting via systemctl..."
      systemctl restart $service                         # restarts service via systemctl
      echo
  fi; }
 
service=apache2                                          # passes apache2 to function
server_monitor

service=mysqld                                           # passes mysql to function
server_monitor

service=sshd                                             # passes sshd to function
server_monitor
