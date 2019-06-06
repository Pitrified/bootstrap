pip3 install virtualenv
pip3 install virtualenvwrapper
mkdir ~/.virtualenvs
source ~/.bashrc 

pip3 install numpy

echo "" >> ~/.bash_aliases.local
echo "# Virtualenvs" >> ~/.bash_aliases.local
echo "export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3" >> ~/.bash_aliases.local
echo "export WORKON_HOME=~/.virtualenvs" >> ~/.bash_aliases.local
# echo "source /usr/local/bin/virtualenvwrapper.sh" >> ~/.bash_aliases.local
echo "source ~/.local/bin/virtualenvwrapper.sh" >> ~/.bash_aliases.local
source ~/.bashrc 

