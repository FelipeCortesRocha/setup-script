sudo apt-get update

echo '>>> Installing curl' 
sudo apt install curl -y

echo '>>> Installing git' 
sudo apt install git -y

echo 'enabling workspaces for both screens' 
gsettings set org.gnome.mutter workspaces-only-on-primary false

echo '>>> Installing zsh'
sudo apt-get install zsh -y
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
chsh -s /bin/zsh

echo '>>> Installing code'
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get install apt-transport-https -y
sudo apt-get update
sudo apt-get install code -y # or code-insiders

echo '>>> Installing extensions'
code --install-extension hookyqr.beautify
code --install-extension michelemelluso.code-beautifier
code --install-extension formulahendry.code-runner
code --install-extension equinusocio.vsc-community-material-theme
code --install-extension dracula-theme.theme-dracula
code --install-extension dsznajder.es7-react-js-snippets
code --install-extension dbaeumer.vscode-eslint
code --install-extension cstrap.flask-snippets
code --install-extension mhutchie.git-graph
code --install-extension eamodio.gitlens
code --install-extension prisma.vscode-graphql
code --install-extension xabikos.javascriptsnippets
code --install-extension ms-vsliveshare.vslivesharec
code --install-extension yzhang.markdown-all-in-one
code --install-extension shd101wyy.markdown-preview-enhanced
code --install-extension pkief.material-icon-theme
code --install-extension ms-python.python
code --install-extension tht13.python
code --install-extension wakatime.vscode-wakatime
code --install-extension gruntfuggly.todo-tree
code --install-extension kruemelkatze.vscode-dashboard
code --install-extension tabnine.tabnine-vscode

echo '>>> Installing spotify' 
snap install spotify

echo '>>> Installing chrome' 
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

echo '>>> Installing nvm' 
sh -c "$(curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash)"

export NVM_DIR="$HOME/.nvm" && (
git clone https://github.com/creationix/nvm.git "$NVM_DIR"
cd "$NVM_DIR"
git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
) && \. "$NVM_DIR/nvm.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

source ~/.zshrc
nvm --version
nvm install 12
nvm alias default 12
node --version
npm --version

echo '>>> Installing autosuggestions' 
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
echo "source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
source ~/.zshrc

echo '>>> Installing dracula'
sudo apt-get install dconf-cli
git clone https://github.com/dracula/gnome-terminal
cd gnome-terminal
./install.sh

echo '>>> Installing slack' 
wget https://downloads.slack-edge.com/linux_releases/slack-desktop-3.3.8-amd64.deb
sudo apt install ./slack-desktop-*.deb -y
