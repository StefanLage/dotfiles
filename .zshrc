# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="nebirhos"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
PATH=$PATH:~/bin/
PATH=$PATH:/usr/local/bin/
PATH=/usr/local/share/python:$PATH
PATH=~/.apportable/SDK/bin:$PATH

# ALIAS - Objective-C development
xcode-debug() {
	  lldb -p `ps aux | grep Xcode | grep -v grep | awk '{print $2}'`
}

alias xcd='xcode-debug'
alias preprocessorUse="find . \( \( -name \"*.[chm]\" -o -name \"*.mm\" \) -o -name \"*.cpp\" \) -print0 | xargs -0 egrep -n '^\w*\#' | egrep -v '(import|pragma|else|endif|HC_SHORTHAND|MOCKITO_SHORTHAND)'"
# Display XCode log -> plugin
alias xcodeLog='tail -b 5 -f /var/log/system.log'
# Get XCODE DTVPlugInCompatibilityUUID
alias xcodeDTV_UUID='defaults read /Applications/Xcode.app/Contents/Info DVTPlugInCompatibilityUUID'
#Compile objective-c's file -> output as the same name as the file itself
cObjc(){
	clang $1 -framework Foundation -lobjc -o ${${1%?}%?}
}

#
# ALIAS
#
alias reloadProfile='source ~/.zshrc'
alias cl='clear'
alias xcode='open -a Xcode'

# Grep alias
grepf(){
	grep -r "$*" *
}
# find a file with name containing String
findFileContaining(){
	find . -name "*$**" -print
}
# Get infos about ports opened
alias listened="lsof -i -n | egrep 'COMMAND|LISTEN'"

# Get device UDID List
# Per iPhone
alias iphone_list="system_profiler SPUSBDataType | sed -n '/iPhone/,/Serial/p' | grep \"Serial Number:\" | awk -F \": \" '{print $2}'"
# Per iPad
alias ipad_list="system_profiler SPUSBDataType | sed -n -e '/iPad/,/Serial/p' | grep \"Serial Number:\" | awk -F \": \" '{print $2}'"

# Alias Git commands
alias gdc='git duet-commit'
alias gst='git status'
alias glog='git log'
alias rebase_last='git rebase -i HEAD~1'
alias rebase_con='git rebase --continue'
alias stash='git stash'
alias stash_app='git stash apply'
alias pullFork='git fetch upstream'
alias mergeFork='git merge upstream/master'
alias lg1='git log --graph --abbrev-commit --decorate --date=relative --format=format:"%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)" --all'
rebase(){
	print $4
	command git rebase -i HEAD~$4;
}
alias rebase="git rebase -i HEAD~$4"
alias gitBranches="git log --graph --oneline --decorate"
alias reset_soft="git reset --soft HEAD~1"
alias wip="git add . && git commit -M 'WIP' && git push"
# Allow to recover a dropped stash
alias gitRepoBrowser="git log --graph --oneline --decorate --all $( git fsck --no-reflog | awk '/dangling commit/ {print $3}' )"

# SD Card Reader
alias unloadSD='sudo kextunload -b com.apple.driver.AppleSDXC'
alias loadSD='sudo kextload -b com.apple.driver.AppleSDXC'
# Unrar
alias unrarFile='unrar e'
# Enable/Disable iTunes HotKeys
alias disableItunesHotKeys='launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist'
alias enableItunesHotKeys='launchctl load -w /System/Library/LaunchAgents/com.apple.rcd.plist'
# MAC OS X
alias disDashboard='defaults write com.apple.dashboard mcx-disabled -boolean YES; killall Dock'
alias addSpaceDock="defaults write com.apple.dock persistent-apps -array-add '{\"tile-type\"=\"spacer-tile\";}'; killall Dock"

#Git config
alias gitAddUserEmail='git config --global user.email "lagestfan@gmail.com"'
alias gitAddUserName='git config user.name "Stefan Lage"'

# Android Prompt
# Simulate Android FingerPrint
function adbFingerPrint(){
	command ~/Library/Developer/Xamarin/android-sdk-macosx/platform-tools/adb -e emu finger touch $1;
}

# FUNCTIONS
# 
# return my IP address
function myip() {
	ifconfig lo0 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "lo0       : " $2}'
	ifconfig en0 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en0 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
  	ifconfig en0 | grep 'inet6 ' | sed -e 's/ / /' | awk '{print "en0 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'  
   	ifconfig en1 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en1 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
	ifconfig en1 | grep 'inet6 ' | sed -e 's/ / /' | awk '{print "en1 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
}

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### YAGARTO
export PATH="$PATH:$HOME/dev/assembly/yagarto/yagarto-4.7.2/bin"
export PATH="$PATH:$HOME/dev/assembly/yagarto/yagarto-4.7.2/tools"

# Loads rbenv environment
eval "$(rbenv init -)"
