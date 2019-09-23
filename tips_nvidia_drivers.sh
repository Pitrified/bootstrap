# https://linuxconfig.org/how-to-install-the-nvidia-drivers-on-ubuntu-18-04-bionic-beaver-linux
echo https://linuxconfig.org/how-to-install-the-nvidia-drivers-on-ubuntu-18-04-bionic-beaver-linux
# https://www.linuxbabe.com/ubuntu/install-nvidia-driver-ubuntu-18-04
echo https://www.linuxbabe.com/ubuntu/install-nvidia-driver-ubuntu-18-04

# https://askubuntu.com/questions/28033/how-to-check-the-information-of-current-installed-video-drivers
echo https://askubuntu.com/questions/28033/how-to-check-the-information-of-current-installed-video-drivers

echo

echo sudo lshw -c display
echo

echo sudo add-apt-repository ppa:graphics-drivers/ppa
echo sudo apt update
echo ubuntu-drivers devices
echo sudo ubuntu-drivers autoinstall
echo

echo prime-select query
echo sudo prime-select intel
echo sudo prime-select nvidia
