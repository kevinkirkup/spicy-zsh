#!/usr/bin/env zsh
##################################################

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="sporty_256"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
  wd web-search tmux gnu-utils vi-mode colorize extract vagrant encode64
  tmux
  git git-flow github gitignore
  brew osx xcode pod
  bundler gem rake ruby rbenv
  python pyenv pylint pip autopep8
  postgres
  node coffee cake bower docker)

source $ZSH/oh-my-zsh.sh

############################################################
# Function to extract archives
function enable_preview_selection() {
  defaults write com.apple.finder QLEnableTextSelection -bool TRUE
  killall Finder
}

# Kills any process that matches a regexp passed to it
killit() {
    ps aux | grep -v "grep" | grep "$@" | awk '{print $2}' | xargs sudo kill
}
#!/usr/local/env zsh

# OSX alias'

alias fixopenwith='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user'

# Terminal Calendar Alias's
alias calm='/usr/bin/cal $(date "+%m %Y")'

# List the OSX USB Device Tree
alias usbtree='system_profiler SPUSBDataType'

# ----------------------------------------
# OSX Java settings
# ----------------------------------------
export JAVA_HOME=$(/usr/libexec/java_home)

# ----------------------------------------
# Postgres App
# ----------------------------------------
PATH=/Applications/Postgres93.app/Contents/MacOS/bin:$PATH

# ----------------------------------------
# Cowsay
# ----------------------------------------

# Show some cow love
fortune | cowsay -f $(ls /usr/local/share/cows/* | awk 'BEGIN { srand() } rand() >=0.5 { print; exit }')

# ----------------------------------------
# Powerline
# ----------------------------------------
export POWERLINE_DIR=/usr/local/lib/python2.7/site-packages/powerline

# Make sure the powerline daemon is running
#powerline-daemon -q

# Source powerline status bar
#source /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
