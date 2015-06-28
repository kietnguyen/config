# unattended install (apt-get, dpkg) config
export DEBIAN_FRONTEND=noninteractive
export DEBIAN_PRIORITY=critical
alias apt-get='apt-get -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold"'

PROVISION_DIR=/vagrant/scripts

# suppress warning
$PROVISION_DIR/01_suppress-warning.sh

# upgrade all packages
sudo apt-get -q update && sudo apt-get -qy upgrade

# add swapfile (if not yet)
#sudo $PROVISION_DIR/05_increase-swap.sh

# share shared folder
sudo $PROVISION_DIR/10_shared-dir.sh

# install required packages
sudo apt-get install -qy build-essential libssl-dev git

# install node and npm
$PROVISION_DIR/20_node.sh

# install npm packages
$PROVISION_DIR/25_npm-pkgs.sh

# install mongodb
#$PROVISION_DIR/30_mongodb.sh

# install heroku toolbelt
#wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | bash

# clean up
sudo $PROVISION_DIR/99_clean-up.sh
