# more python versions
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update

# the current version for this release
sudo apt install python3-venv python3-pip

# another version
sudo apt install python3.10-dev
sudo apt install python3.10-pip
sudo apt install python3.10-venv

# this might kill your pip command, as there is no pip3.8,
# and pip has been overwritten
# so you need to create a symlink pip3.8 -> /usr/bin/pip (that is the pip for 3.8)

# then things should work
# python3.10 -m venv venv
# source venv/bin/activate

# maybe also need this?
# wget https://bootstrap.pypa.io/get-pip.py
# python3.10 get-pip.py 
# sudo apt-get install python3.10-distutils

# virtualenv is still neat because of the wrapper

pip3 install virtualenv
pip3 install virtualenvwrapper
mkdir ~/.virtualenvs

echo "" >> ~/.bash_aliases.local
echo "# Virtualenvs" >> ~/.bash_aliases.local
echo "export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3" >> ~/.bash_aliases.local
echo "export WORKON_HOME=~/.virtualenvs" >> ~/.bash_aliases.local
# echo "source /usr/local/bin/virtualenvwrapper.sh" >> ~/.bash_aliases.local
echo "source ~/.local/bin/virtualenvwrapper.sh" >> ~/.bash_aliases.local

# pip3 install black
# pip3 install pytest

# SCI
# pip3 install numpy

# IMAGE
# sudo apt install python3-tk
# pip3 install Pillow
# pip3 install exifread

# also remember to install tk for the right version of python if you are not using the default
# sudo apt install python3.7-tk
# https://stackoverflow.com/a/25905642/2237151

# this should not be needed anymore
# on Ubuntu, use TkAgg as backend for matplotlib or the plot will not show up
# pyimagesearch.com/2015/08/24/resolved-matplotlib-figures-not-showing-up-or-displaying/

# add in ~/.virtualenvs/postmkvirtualenv
# pip install black

echo ¨Remember to manually do ´source ~/.bashrc´¨
