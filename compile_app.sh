#!/bin/bash
# RAILS_ENV=production bundle exec rake assets:precompile

rm -rf ~/Google\ Drive/Carepill/Ultracare/ultracare_installer/ultrasound
cp -r ../ultrasound ~/Google\ Drive/Carepill/Ultracare/ultracare_installer/
cp -f ../ultrasound/config/database.windows.yml ~/Google\ Drive/Carepill/Ultracare/ultracare_installer/ultrasound/config/database.yml

rm -rf ~/Google\ Drive/Carepill/Ultracare/ultracare_installer/ultrasound/.git
rm -rf ~/Google\ Drive/Carepill/Ultracare/ultracare_installer/ultrasound/tmp
rm -rf ~/Google\ Drive/Carepill/Ultracare/ultracare_installer/ultrasound/log
rm -rf ~/Google\ Drive/Carepill/Ultracare/ultracare_installer/ultrasound/spec

rm -rf ../ultrasound/public/assets
