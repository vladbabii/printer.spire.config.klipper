#!/bin/bash

find /home/pi/sdcard/ -mtime +7 | xargs rm -f
