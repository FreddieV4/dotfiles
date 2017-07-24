[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile
[[ -r ~/.bashrc ]] && . ~/.bashrc
ulimit -n 1024

if [ -f $(brew --prefix)/etc/bash_completion ]; then
	. $(brew --prefix)/etc/bash_completion
fi

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export GOPATH=$HOME/Go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

export HISTCONTROL=ignoreboth:erasedups
alias git="hub"
# MacPorts Installer addition on 2017-01-24_at_18:23:09: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.


alias emacs="/usr/local/Cellar/emacs/25.1/Emacs.app/Contents/MacOS/Emacs -nw"

alias chrome="open /Applications/Google\ Chrome.app/ --args --disable-web-security"

alias build_ext="python ./setup.py build_ext --inplace"

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
