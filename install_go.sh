mkdir ~/setup_bootstrap
cd ~/setup_bootstrap

GO_VERSION="1.20.3"

wget https://go.dev/dl/go$GO_VERSION.linux-amd64.tar.gz
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf go$GO_VERSION.linux-amd64.tar.gz

# for fyne
sudo apt install -y libgl1-mesa-dev xorg-dev

echo "" >> ~/.bash_aliases.local
echo "# Golang" >> ~/.bash_aliases.local
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bash_aliases.local

