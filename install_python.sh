pip3 install virtualenv
pip3 install virtualenvwrapper
mkdir ~/.virtualenvs

echo "" >> ~/.bash_aliases.local
echo "# Virtualenvs" >> ~/.bash_aliases.local
echo "export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3" >> ~/.bash_aliases.local
echo "export WORKON_HOME=~/.virtualenvs" >> ~/.bash_aliases.local
# echo "source /usr/local/bin/virtualenvwrapper.sh" >> ~/.bash_aliases.local
echo "source ~/.local/bin/virtualenvwrapper.sh" >> ~/.bash_aliases.local

pip3 install black

# SCI
# pip3 install numpy

# IMAGE
# sudo apt install python3-tk
# pip3 install Pillow
# pip3 install exifread

# on Ubuntu, use TkAgg as backend for matplotlib or the plot will not show up
# pyimagesearch.com/2015/08/24/resolved-matplotlib-figures-not-showing-up-or-displaying/

# add in ~/.virtualenvs/postmkvirtualenv
# pip install black

echo ¨Remember to manually do ´source ~/.bashrc´¨
