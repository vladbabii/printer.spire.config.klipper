  
#!/bin/bash

mkdir -p /home/pi/klipper_config/docs

cd /home/pi/klipper/
git describe --tags | tee /home/pi/klipper_config/docs/version_klipper.md

cd /home/pi/mainsail/
git describe --tags | tee /home/pi/klipper_config/docs/version_mainsail.md

cd /home/pi/moonraker/
git describe --tags | tee /home/pi/klipper_config/docs/version_moonraker.md


cd /home/pi/klipper_config
git pull
git add *
git commit -m "auto"
git push
git pull