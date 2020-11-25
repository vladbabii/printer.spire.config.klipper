#!/bin/bash

## put this in cron with
## */30 * * * * /bin/bash /home/pi/klipper_config/scripts/delete_sd_card_files_older_than_a_week.sh 

find /home/pi/sdcard/ -mtime +7 | xargs rm -f
