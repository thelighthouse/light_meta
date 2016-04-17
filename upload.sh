#!/bin/bash

#scp hex file to pi
scp $1 192.168.1.5:/tmp/toupload.hex &&

#ssh -x upload script on pi
ssh 192.168.1.5 "avrdude -p atmega2560 -P /dev/ttyACM0 -c wiring -b 115200 -D -U flash:w:/tmp/toupload.hex:i"
