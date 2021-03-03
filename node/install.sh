# simple file server

if test ! $(which serve)
then
  sudo npm install serve -g
fi

# install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
