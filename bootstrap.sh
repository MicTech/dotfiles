# Load configuration
. my.sh

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
brew update

# Install GNU core utilities (those that come with OS X are outdated)
brew install coreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils

# Install Bash 4
brew install bash

# Install more recent versions of some OS X tools
brew tap homebrew/dupes
brew install homebrew/dupes/grep

binaries=(
  rename
  python
  node
  git
  wget
  docker
  boot2docker
  fish
  offline-imap
  jmeter
)

echo "installing binaries..."
brew install ${binaries[@]}

brew cleanup

brew install caskroom/cask/brew-cask
brew tap caskroom/versions

# Apps
apps=(
  alfred
  dropbox
  google-chrome
  iterm2
  sublime-text3
  atom
  flux
  sketch
  skype
  intellij-idea
  clipmenu
  evernote
  skitch
  onepassword
  viscosity
  bartender
  totalfinder
  p4merge
  gopro-studio
  java7
  sequel-pro
  asepsis
  mplayerx
  igetter
  istat-menus
  eye-fi
  android-file-transfer
  microsoft-office
  yed
)

# Link apps to Alfred
brew cask alfred link

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps..."
brew cask install --appdir="/Applications" ${apps[@]}

# oh-my-fish
curl -L https://github.com/bpinto/oh-my-fish/raw/master/tools/install.fish | fish

# Setup GitHub
GITHUB_KEY=~/.ssh/github_rsa
SSH_CONFIG=~/.ssh/config

if [ ! -f $GITHUB_KEY ]; then
  ssh-keygen -t rsa -C "$EMAIL" -N '' -f $GITHUB_KEY
  echo "Host GitHub github.com" >> $SSH_CONFIG
  echo "Hostname github.com" >> $SSH_CONFIG
  echo "IdentityFile $GITHUB_KEY" >> $SSH_CONFIG 
  echo "\n" >> $SSH_CONFIG
fi

# dotfiles
git clone https://github.com/MicTech/dotfiles.git $DOTFILES_DIR

# dotfiles - Git
ln -s $DOTFILES_DIR/.gitconfig ~/.gitconfig

# fish
## add fish to list of shells
sudo bash -c "echo \"/usr/local/bin/fish\" >> /etc/shells"

## change default shell
chsh -s /usr/local/bin/fish

# iTerm2
wget http://www.iterm2.com/hostedcolors/Solarized%20Dark.itermcolors -P ~/dotfiles/.local/iterm2

# Mac OS X

## show hidden files in Finder
defaults write com.apple.finder AppleShowAllFiles YES
