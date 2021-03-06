# .bash_profile

if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# aliases
alias ls='/usr/local/bin/exa'
#alias ls='ls --color=auto'
alias la='ls -a'
alias la='ls -la'
alias ll='ls -l'
alias ..='cd ..'
alias vi='/usr/bin/vim'
alias yum='dnf'
alias dmesg='dmesg -H -L=always'

# prompt
PS1='@\[\e[1;49;38;5;2m\]\h\[\e[0;49;39m\] \[\e[1;49;38;5;4m\]\w ∴ \[\e[0;49;39m\] \[\e[1;49;38;5;6m\]\$\[\e[0;49;39m\] \[\e[0m\]'

# User specific environment and startup programs
PATH=$PATH:$HOME/.local/bin:$HOME/bin
PATH=/opt/komodo/bin:$PATH
PATH=$HOME/.xmonad/bin:$PATH
PATH=/opt/nodejs/bin:$PATH
export PATH

export EDITOR=vim

# add some color to ls
if [ -f ~/.dircolors.ansi-dark.mod ]; then
    eval `dircolors ~/.dircolors.ansi-dark.mod`
fi

# beautify terminal's fonts
if [ -f /etc/profile.d/infinality-settings.sh ]; then
    . /etc/profile.d/infinality-settings.sh
fi

# others
if [ -f /etc/bash_completion.d/git ]; then
    . /etc/bash_completion.d/git
fi

if [ -f ~/.fzf_key-bindings.bash ]; then
    . ~/.fzf_key-bindings.bash
fi

# Setting ag as the default source for fzf
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow -g "!{.git,node_modules,cache,.mozilla,vendor}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"


