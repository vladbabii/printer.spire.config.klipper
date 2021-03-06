#!/bin/bash


mkdir -p /home/pi/klipper_config/docs

cd /home/pi/kiauh/
echo "\`\`\`" > /home/pi/klipper_config/docs/version_kiauh.md
git config --get remote.origin.url >> /home/pi/klipper_config/docs/version_kiauh.md
git describe --tags >> /home/pi/klipper_config/docs/version_kiauh.md
git rev-parse --short HEAD >> /home/pi/klipper_config/docs/version_kiauh.md
git remote show origin >> /home/pi/klipper_config/docs/version_kiauh.md
echo "\`\`\`" >> /home/pi/klipper_config/docs/version_kiauh.md

cd /home/pi/klipper/
echo "\`\`\`" > /home/pi/klipper_config/docs/version_klipper.md
git config --get remote.origin.url >> /home/pi/klipper_config/docs/version_klipper.md
git describe --tags >> /home/pi/klipper_config/docs/version_klipper.md
git rev-parse --short HEAD >> /home/pi/klipper_config/docs/version_klipper.md
git remote show origin >> /home/pi/klipper_config/docs/version_klipper.md
echo "\`\`\`" >> /home/pi/klipper_config/docs/version_klipper.md

#cd /home/pi/mainsail/
# ??
#git describe --tags | tee /home/pi/klipper_config/docs/version_mainsail.md

cd /home/pi/moonraker/
echo "\`\`\`" > /home/pi/klipper_config/docs/version_moonraker.md
git config --get remote.origin.url >> /home/pi/klipper_config/docs/version_moonraker.md
git describe --tags >> /home/pi/klipper_config/docs/version_moonraker.md
git rev-parse --short HEAD >> /home/pi/klipper_config/docs/version_moonraker.md
git remote show origin >> /home/pi/klipper_config/docs/version_moonraker.md
echo "\`\`\`" >> /home/pi/klipper_config/docs/version_moonraker.md

cd /home/pi/klipper_config

if [[ $(git diff | wc -l)  == "0" ]] ; then
  echo "no changes found!"
else
  echo "changes found!"

  echo "\`\`\`" > /home/pi/klipper_config/docs/kiauh_status.md
  echo "" > /tmp/kiauh.status.txt
  ./home/pi/klipper_config/scripts/expect_kiauh | tee /tmp/kiauh.status.txt
  cat /tmp/kiauh.status.txt | sed 's/\x1B\[[0-9;]\{1,\}[A-Za-z]//g' >> /home/pi/klipper_config/docs/kiauh_status.md
  echo "\`\`\`" >> /home/pi/klipper_config/docs/kiauh_status.md

  git pull
  git add *
  git add ".ignore"
  git add ".fluidd.json"
  git commit -m "auto"
  git push
  git pull
fi
