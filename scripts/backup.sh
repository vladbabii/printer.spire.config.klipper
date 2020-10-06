  
#!/bin/bash

mkdir -p /home/pi/klipper_config/docs

cd /home/pi/kiauh/
git config --get remote.origin.url > /home/pi/klipper_config/docs/version_kiauh.md
git describe --tags >> /home/pi/klipper_config/docs/version_kiauh.md
git remote show origin >> /home/pi/klipper_config/docs/version_kiauh.md


cd /home/pi/klipper/
git config --get remote.origin.url > /home/pi/klipper_config/docs/version_klipper.md
git describe --tags >> /home/pi/klipper_config/docs/version_klipper.md
git remote show origin >> /home/pi/klipper_config/docs/version_klipper.md

#cd /home/pi/mainsail/
# ??
#git describe --tags | tee /home/pi/klipper_config/docs/version_mainsail.md

cd /home/pi/moonraker/
git config --get remote.origin.url > /home/pi/klipper_config/docs/version_moonraker.md
git describe --tags >> /home/pi/klipper_config/docs/version_moonraker.md
git remote show origin >> /home/pi/klipper_config/docs/version_moonraker.md


cd /home/pi/klipper_config
git pull
git add *
git commit -m "auto"
git push
git pull