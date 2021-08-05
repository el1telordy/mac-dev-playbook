#!/bin/bash

if [ "$2" == "-i" ] || [ "$2" == "--icloud" ]
then
  savePath="~/Library/Mobile\ Documents/com~apple~CloudDocs/Fontups"
else
  savePath=~/Fontups
fi

function backup () {
  eval mkdir $savePath 2> /dev/null
  cd ~/Library/Fonts/
  eval tar -cvzf $savePath/fontups.tar.gz "*" 2> /dev/null
}

function restore () {
  eval tar -xvf $savePath/fontups.tar.gz -C ~/Library/Fonts/ 2> /dev/null
}

if [ "$1" == "--backup" ] || [ "$1" == "-b" ]
then
  backup && echo "Backuped!"
elif [ "$1" == "--restore" ] || [ "$1" == "-r" ]
then
  restore && echo "Restored!"
elif [ "$1" == "--help" ] || [ "$1" == "-h" ]
then
  echo "Usage:
  (-b | --backup) backup fonts from system folder to home directory
  (-r | --restore) to restore fonts from home directory to system folder
  (-i | --icloud) use as second arg to backup to icloud
  "
else
  echo "Wrong argument! Use (-h | --help) to get manual"
  exit
fi