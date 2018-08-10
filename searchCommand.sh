#!/bin/bash
logfile=/tmp/installed_package.$$

if [ ! -f "/usr/bin/zenity" ]; then
  echo "Zenity package is not installed. !!!"
  exit 0
fi

value=$(zenity --width=500 --height=100 --entry --title "Enter the string for which you want a command." --text "Insert your choice." 2>/dev/null)

if [ $? -eq 0 ];then
    man -k "$value" > $logfile
  zenity --width=800 --height=600 --title "Commands list" --text-info --filename="$logfile" 2>/dev/null
else
  zenity --error 2>/dev/null
fi
rm -f $logfile
