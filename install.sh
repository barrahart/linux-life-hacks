#!/bin/bash

#########################################################################
# Name:         install.sh                                              #
#                                                                       #
# Author:       Barra Hart                                              #
#                                                                       #
# Repo:         https://github.com/barrahart/linux-life-hacks           #
#                                                                       #
# Description:  Installs linux life hack(s) in /usr/bin folder with     #
#               appropriate permissions.                                #
#########################################################################


install_folder=/usr/bin # hacks are here
# install_folder=./bins # hacks are here (test)

# fancy
clear

# fancy
echo "---------------------------------------------------------------------"
echo ":::::::::::::::: Linux Life Hacks Installer 1.0.0 :::::::::::::::::::"
echo "---------------------------------------------------------------------"
echo ""

#fancy
read -p ":::::::::: Press ENTER to continue, or CTRL-C to exit ::::::::::::"
echo ""


echo "---------------------------------------------------------------------"
read -p "Install all hacks? (y/n) " all_hacks
echo "---------------------------------------------------------------------"

if [[ "$all_hacks" = "y" ]]
then
  # install every hack in install_folder
  sudo chown root:root ./hacks/* # make root owned
  sudo chmod 777 ./hacks/* # make executable
  sudo cp ./hacks/* $install_folder # move to install_folder

  echo "---------------------------------------------------------------------"
  echo "Your hacks have been installed!"
  echo "---------------------------------------------------------------------"
  exit 0
elif [[ "$all_hacks" = "n" ]]
then
  echo "---------------------------------------------------------------------"
  read -p "Enter hack to install: " hack_to_install
  echo "---------------------------------------------------------------------"

  # check that hack is in hacks folder
  hack=$(find ./hacks -name "$hack_to_install")

  if [[ "$hack" != "" ]] # hack found
  then
    # install hack in install_folder
    find ./hacks -name "$hack_to_install" -exec sudo chown root:root {} \;
    find ./hacks -name "$hack_to_install" -exec sudo chmod 777 {} \;
    find ./hacks -name "$hack_to_install" -exec sudo cp {} $install_folder \;

    echo "---------------------------------------------------------------------"
    echo "Your hack has been installed!"
    echo "---------------------------------------------------------------------"
    exit 0
  else
    echo "---------------------------------------------------------------------"
    echo "Sorry. I couldn't find that hack."
    echo "---------------------------------------------------------------------"
    exit 0
  fi
else
  echo "---------------------------------------------------------------------"
  echo "Try 'y' or 'n' next time :)"
  echo "---------------------------------------------------------------------"
  exit 0
fi
