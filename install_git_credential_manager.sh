# https://github.com/GitCredentialManager/git-credential-manager

mkdir ~/setup_bootstrap
cd ~/setup_bootstrap

# misc deps
sudo apt-get install wget ca-certificates

# get the right release
# https://github.com/GitCredentialManager/git-credential-manager/releases/latest
GCM_V="2.0.935"
wget https://github.com/git-ecosystem/git-credential-manager/releases/download/v${GCM_V}/gcm-linux_amd64.${GCM_V}.deb
sudo dpkg -i gcm-linux_amd64.${GCM_V}.deb 

# configure will place things in ~/dotfiles/git/gitconfig.symlink
# you might want to place them in ~/.gitconfig.local
git-credential-manager configure

# # if you are on WSL with no GUI, it will complain
# # use GPG pass
# # https://github.com/GitCredentialManager/git-credential-manager/blob/main/docs/credstores.md
# sudo apt install gnupg2 pass
# gpg --gen-key
# pass init 'name <email>'
# export GPG_TTY=$(tty)
# git push
# # now you need the PAT for this account
