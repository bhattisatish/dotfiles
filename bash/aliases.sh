#Setting to add most used directories to cd path
#export CDPATH='~/development/python'
#export CDPATH='~/sites'

# Tab bash_completion magic for OSX
if [ -f /etc/bash_completion ]; then
  source /etc/bash_completion
fi

unamestr=`uname`
if [ "$unamestr" == "Linux" ]; then
  export LS_OPTIONS='--color=auto'
  eval `dircolors ./dircolors`
fi


# Global
alias ..='cd ..'        # Go up one directory
alias ...='cd ../..'    # Go up two directories
alias ....='cd ../../..'    # Go up three directories
#alias -='cd -'       #go to previous dir
alias c='clear;echo "Currently logged in on $(tty), as $(whoami) in directory $(pwd)."' # shortcut to clear your terminal
alias cdd='cd -'        # Go to last used directory
alias df='df -h'        # Disk free, in gigabytes, not bytes
alias du='du -h -c'     # Calculate total disk usage for a folder
alias grep='grep --color=auto' # Always highlight grep search term
alias h='history'       # shortcut for history
alias hc="history | awk '{a[$2]++}END{for (i in a){print a [i] \" \" i}}' | sort -rn | head" # show most commonly used command
alias l='ls -hali $LS_OPTIONS' # l for list style, a for all including hidden, h for human readable file sizes, i for inode to determine hardlinks
alias la='ls -AF $LS_OPTIONS'       # Compact view, show hidden
alias ll='ls -lFh $LS_OPTIONS'      # Long view, no hidden
alias ls='ls -GFp $LS_OPTIONS'      # Compact view, show colors
alias ping='ping -c 5'  # Pings with 5 packets, not unlimited
function take {
    mkdir $1
    cd $1
}
alias cal='cal -3' #show 3 months by default
alias units='units -t' #terse mode
alias diff='LC_ALL=C TZ=GMT0 diff -Naur' #normalise diffs for distribution
alias lynx='lynx -force_html -width=$COLUMNS' #best settings for viewing HTML

# I hate noise
set bell-style visible

# Tell less not to beep and also display colours
export LESS="-QR"

# Editing
alias ea='mate ~/bin/dotfiles/bash/aliases.sh &' # because i edit my bash_profile a lot with new things
alias reload='source ~/.bash_profile' # same as previous, after editing you have to source it for the new stuff to work

# Processes
alias tm='top -o vsize' #memory
alias tu='top -o cpu' #cpu

# Bash
# GREP_COLOR=bright yellow on black bg.
# use GREP_COLOR=7 to highlight whitespace on black terminals
# LANG=C for speed. See also: http://www.pixelbeat.org/scripts/findrepo
alias grep='GREP_COLOR="1;33;40" LANG=C grep --color=auto'

# Python
alias ip='ipython'
alias lsite='ls -hal $(python -c "from distutils.sysconfig import get_python_lib; print get_python_lib()")'
alias p='python'
alias path='python -c "from distutils.sysconfig import get_python_lib; print get_python_lib()"'
alias servethis="python -c 'import SimpleHTTPServer; SimpleHTTPServer.test()'"
alias site='cd $(python -c "from distutils.sysconfig import get_python_lib; print get_python_lib()")'
alias emailserver='python -m smtpd -n -c DebuggingServer localhost:1025'

# Django
alias rmsyn='rm dev.db; syn'
alias rmsynrun='rm dev.db; syn; run'
alias run='python manage.py runserver_plus 0.0.0.0:8000'
alias syn='python manage.py syncdb --noinput'
alias pmt='python manage.py test'
alias pm='python manage.py'
alias pms='python manage.py shell_plus'
. ~/bin/django_bash_completion

# Screen
alias s='screen'
alias sl='screen -ls'

# MVim
alias mvim='/Applications/MacVim.app/Contents/MacOS/Vim -g'

# Emacs
alias em='/Applications/Emacs.app/Contents/MacOS/bin/emacsclient --no-wait'

# Textmate
alias e='mate . &' # open current dir
alias et='mate README app/ config/ db/ lib/ public/ test/ vendor/plugins &' # open current dir assuming rails
alias gitdiff='git log|grep commit|cut -d " " -f2|head -n 2|xargs -n 2 git diff -R|mate' # open last two diffs in mate
alias m='mate &' # open w/ textmate

# Ruby
# really useful function, use: cdgem , cd's into your gems directory and opens gem that best matches the gem name provided
# function cdgem {
#     cd /opt/local/lib/ruby/gems/1.8/gems/; cd `ls|grep $1|sort|tail -1`
# }
alias gemi='sudo gem install --no-rdoc --no-ri'
alias irb='irb –readline -r irb/completion -rubygems' # use readline, completion and require rubygems by default for irb
alias rii='ri -Tf ansi'

# Rails
alias a='autotest -rails' # makes autotesting even quicker
alias r='rake'
alias rmig='rake db:migrate'
alias sc='script/console' # obvious
alias sg='script/generate'
alias sp='script/plugin install'
alias ss='script/server' # start up the beast

# SVN
alias sup='svn up' # trust me 3 chars makes a different
alias supall='for i in *; do (cd $i; svn up); done' # all recursive folders
alias sst='svn st' # local file changes
alias sstu='svn st -u' # remote repository changes
alias scom='svn commit' # commit
alias svnclear='find . -name .svn -print0 | xargs -0 rm -rf' # removes all .svn folders from directory recursively
alias svnaddall='svn status | grep “^\?” | awk “{print \$2}” | xargs svn add' # adds all unadded files

# Git
alias g='git status'
alias gb='git branch'
alias gba='git branch -a'
# Setup a tracking branch from [remote] [branch_name]
function gbt() {
    git branch --track $2 $1/$2
    git checkout $2
}
alias gc='git commit -v'
alias gca='git commit -v -a'
function gcm() {
    git commit -v -a -M "$*"
}
alias gco='git checkout'
alias gd='git diff | mate'
alias gdm='git diff master n  | mate'
alias gg='git-gui'
alias gl='git pull'
alias glog='git log -p -2 --pretty=format:"%h - %an, %ar : %s" --shortstat'
alias gnp='git-notpush'
alias gp='git push'
function grf() {
    rm $1
    git checkout $1
}
alias gx='gitx'

# Hg
alias hgst='hg status'
alias hgd='hg diff | mate'
alias hgl='hg pull'
alias hgp='hg push'
alias hgv='hg view'

# OSX
alias hidehidden='defaults write com.apple.finder AppleShowAllFiles False; killall Finder'
alias killdash='defaults write com.apple.dashboard mcx-disabled -boolean YES; killall Dock;'
alias showhidden='defaults write com.apple.finder AppleShowAllFiles True; killall Finder'
alias startdash='defaults write com.apple.dashboard mcx-disabled -boolean NO; killall Dock;'
alias o='open ."'
function startup() {
    open -a "Adium.app"
    open -a "Skype.app"
    open -a "Tweetie.app"
    open -a "Linkinus.app"
    open -a "Dropbox.app"
    open -a "iTunes.app"
    open -a "Notify.app"
    open -a "DeskShade.app"
    open -a "pomodoro.app"
    open -a "Isolator.app"
    open -a "SelfControl.app"
    open -a "Transmission.app"
    open -a "Spirited Away.app"
}
# Finder
#alias o='open . &'
