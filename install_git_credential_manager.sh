# https://github.com/GitCredentialManager/git-credential-manager

# misc deps
sudo apt-get install wget ca-certificates

# get the right release
# https://github.com/GitCredentialManager/git-credential-manager/releases/latest
wget https://github.com/GitCredentialManager/git-credential-manager/releases/download/v2.0.696/gcmcore-linux_amd64.2.0.696.deb
sudo dpkg -i gcmcore-linux_amd64.2.0.696.deb 

# configure will place things in ~/dotfiles/git/gitconfig.symlink
# you might want to place them in ~/.gitconfig.local
git-credential-manager-core configure

# if you are on WSL with no GUI, it will complain
# use GPG pass
# https://github.com/GitCredentialManager/git-credential-manager/blob/main/docs/credstores.md
sudo apt install gnupg2 pass
gpg --gen-key
pass init 'name <email>'
export GPG_TTY=$(tty)
git push
# now you need the PAT for this account