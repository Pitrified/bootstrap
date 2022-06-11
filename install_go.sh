mkdir ~/setup_bootstrap
cd ~/setup_bootstrap
wget https://go.dev/dl/go1.18.3.linux-amd64.tar.gz
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf go1.18.3.linux-amd64.tar.gz

echo "" >> ~/.bash_aliases.local
echo "# Golang" >> ~/.bash_aliases.local
echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.bash_aliases.local

