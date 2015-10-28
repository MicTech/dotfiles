# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Theme
set fish_theme robbyrussell

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-fish/plugins/*)
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Example format: set fish_plugins autojump bundler

# Path to your custom folder (default path is $FISH/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

# JAVA_HOME
set -x JAVA_HOME (/usr/libexec/java_home)

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

source /Users/MicTech/.iterm2_shell_integration.fish

alias ls "ls -ls"
