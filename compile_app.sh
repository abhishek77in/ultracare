#!/bin/bash

RAILS_ENV=production bundle exec rake assets:precompile
rm -rf ~/Google\ Drive/Carepill/Ultracare/ultracare_installer/ultracare
cp -r ../ultracare ~/Google\ Drive/Carepill/Ultracare/ultracare_installer/
cp -f ../ultracare/config/database.windows.yml ~/Google\ Drive/Carepill/Ultracare/ultracare_installer/ultracare/config/database.yml

rm -rf ~/Google\ Drive/Carepill/Ultracare/ultracare_installer/ultracare/.git
rm -rf ~/Google\ Drive/Carepill/Ultracare/ultracare_installer/ultracare/tmp
rm -rf ~/Google\ Drive/Carepill/Ultracare/ultracare_installer/ultracare/log
rm -rf ~/Google\ Drive/Carepill/Ultracare/ultracare_installer/ultracare/spec

rm -rf ../ultracare/public/assets
