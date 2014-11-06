#!/usr/bin/env zsh

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

