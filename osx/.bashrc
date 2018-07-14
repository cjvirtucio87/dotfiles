source ~/.shell/git
source ~/.shell/go

export PATH=/usr/local/bin:$PATH

#### GNU ####
# coreutils
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# findutils
export PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/findutils/libexec/gnuman:$MANPATH"

# gnu-tar
export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/gnu-tar/libexec/gnuman:$MANPATH"

# gnu-sed
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/gnu-sed/libexec/gnuman:$MANPATH"

# gawk
export PATH="/usr/local/opt/gawk/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/gawk/libexec/gnuman:$MANPATH"

# grep
export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/grep/libexec/gnuman:$MANPATH"

#### CONSOLE COLOR ####
# grep
export GREP_COLOR='1;35;40'
alias grep='grep --color=auto'
