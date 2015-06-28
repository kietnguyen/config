# Workaround to suppress warnings
#   https://github.com/mitchellh/vagrant/issues/1673
#   http://raphaelhertzog.com/2010/09/21/debian-conffile-configuration-file-managed-by-dpkg/
sudo sed -i 's/^mesg n$/tty -s \&\& mesg n/g' /root/.profile
