#/bin/bash

#A script to build to development enviroment for RasberryPi yocto development

HARDWARE_NAME='raspberrypi2'

GIT_CLONE_URL_POKY='git://git.yoctoproject.org/poky'
HTTP_CLONE_URL_POKY='http://git.yoctoproject.org/git/poky'

GIT_CLONE_URL_OPENEMBEDDED='git://git.openembedded.org/meta-openembedded'
HTTP_CLONE_URL_OPENEMBEDDED='http://git.openembedded.org/meta-openembedded'

GIT_CLONE_URL_META_PI='git://git.yoctoproject.org/meta-raspberrypi'
HTTP_CLONE_URL_META_PI='http://git.yoctoproject.org/git/meta-raspberrypi'

#Clone poky
echo Cloning poky from $GIT_CLONE_URL_POKY
git clone $GIT_CLONE_URL_POKY
cd poky

#Add the openembedded layer
echo Cloning meta-openembedded from $GIT_CLONE_URL_OPENEMBEDDED
git clone $GIT_CLONE_URL_OPENEMBEDDED

#Add the meta-raspberrypi layer
echo Cloning meta-raspberrypi from $GIT_CLONE_URL_META_PI
git clone $GIT_CLONE_URL_META_PI

#Setup the enviroment
source oe-init-build-env rpi-build
mv conf ../..

#comment out the default machine and add in the machine varible
cd ../../conf
sed -i 's/^MACHINE ??=/#MACHINE ??=/' local.conf
sed -i '/^# This sets the default machine/iMACHINE ?= "'$HARDWARE_NAME'"' local.conf
