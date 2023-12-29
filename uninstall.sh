#!/bin/bash

#########################################################################
# Name:         uninstall.sh                                            #
#                                                                       #
# Author:       Barra Hart                                              #
#                                                                       #
# Repo:         https://github.com/barrahart/linux-life-hacks           #
#                                                                       #
# Description:  Uninstalls linux life hack(s)                           #
#########################################################################


uninstall_folder=/usr/bin # hacks are here
# uninstall_folder=./bins # hacks are here (test)

# fancy
clear

# fancy
echo "---------------------------------------------------------------------"
echo "::::::::::::::: Linux Life Hacks Uninstaller 1.0.0 ::::::::::::::::::"
echo "---------------------------------------------------------------------"
echo ""

#fancy
read -p "::::::::::: Press ENTER to continue, or CTRL-C to exit ::::::::::::::"
echo ""


echo "---------------------------------------------------------------------"
read -p "Uninstall all hacks? (y/n) " all_hacks
echo "---------------------------------------------------------------------"

if [[ "$all_hacks" = "y" ]]
then
  # get names of hacks by putting split ls result into an array
  hacks=($(echo $(ls ./hacks) | tr ' ' '\n'))

  # uninstall every hack
  for hack in ${hacks[@]}; do
		sudo rm $uninstall_folder/"$hack"
	done

  echo "---------------------------------------------------------------------"
  echo "Your hacks have been uninstalled!"
  echo "---------------------------------------------------------------------"
  exit 0
elif [[ "$all_hacks" = "n" ]]
then
  echo "---------------------------------------------------------------------"
  read -p "Enter hack to uninstall: " hack_to_uninstall
  echo "---------------------------------------------------------------------"

  # check that hack is in hacks folder
  hack=$(find $uninstall_folder -name "$hack_to_uninstall")

  if [[ "$hack" != "" ]] # hack found
  then
    # uninstall hack
    find $uninstall_folder -name "$hack_to_uninstall" -exec sudo rm {} \;

    echo "---------------------------------------------------------------------"
    echo "Your hack has been uninstalled!"
    echo "---------------------------------------------------------------------"
    exit 0
  else
    echo "---------------------------------------------------------------------"
    echo "This hack isn't on your system."
    echo "---------------------------------------------------------------------"
    exit 0
  fi
else
  echo "---------------------------------------------------------------------"
  echo "Try 'y' or 'n' next time :)"
  echo "---------------------------------------------------------------------"
  exit 0
fi
