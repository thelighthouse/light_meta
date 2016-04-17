#!/bin/bash -x

#compile to hex file
mkdir -p /tmp/build$1
/Applications/Arduino.app/Contents/MacOS/Arduino --verify $1 --board arduino:avr:mega --pref build.path=/tmp/build$1 &&

#scp hex file to pi
scp /tmp/build$1/$(basename "$1").hex 192.168.1.5:/tmp/toupload.hex &&

#ssh -x upload script on pi
ssh 192.168.1.5 "avrdude -p atmega2560 -P /dev/ttyACM0 -c wiring -b 115200 -D -U flash:w:/tmp/toupload.hex:i"
