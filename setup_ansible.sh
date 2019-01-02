#!/bin/sh

if [ $(type pip >/dev/null 2>&1; echo $?) -ne 0 ]; then
  sudo easy_install pip
else
  if [ $(type ansible >/dev/null 2>&1; echo $?) -ne 0 ]; then
    if [ $(type gcc >/dev/null 2>&1; echo $?) -ne 0 ]; then
      sudo xcodebuild -license accept 
    fi
    sudo pip install ansible
  else
    sudo pip install --upgrade pip --user python >/dev/null 2>&1
    if [ $? -eq 0 ]; then
      echo 'pip updated.'
      sudo pip install --upgrade setuptools --user python >/dev/null 2>&1
      if [ $? -eq 0 ]; then
        echo 'setuptools updated.'
        sudo pip install --upgrade ansible --user python >/dev/null 2>&1
        if [ $? -eq 0 ]; then
          echo 'ansible updated.'
        fi
      fi
    fi
  fi
fi
