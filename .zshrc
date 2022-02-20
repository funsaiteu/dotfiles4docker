# zcompile
if [ ! -f ~/.zshrc.zwc -o ~/.zshrc -nt ~/.zshrc.zwc ]; then
   zcompile ~/.zshrc
fi

# lang
export LC_MESSAGES=C
export LC_TIME=C

# colors
autoload -U colors
colors

# ls color
export LS_COLORS="di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30"

# rm
alias rm="poi"
poi(){
mv $* ~/.Trash
}
alias brm="/bin/rm -i"

# less
alias -g L="| less"

# less color
#export LESSOPEN='|lessfilter.sh %s'
export LESS='--RAW-CONTROL-CHARS'

# bat
alias bat="batcat"
alias -g B="| batcat"

# myPS1
PS1="%U%B%{${fg[black]}%}hoge%u%{$reset_color%}%#%b "
RPS1="[%{${fg[yellow]}%}%/%{${fg[default]}%}]"

# show right prompt only at last command line
unsetopt transient_rprompt

# history
SAVEHIST=100000
HISTSIZE=100000
HISTFILE=~/.zhistory
# use data of hist at completion
setopt HIST_EXPAND
# permit edition for calling
#setopt HIST_VERIFY
# share among executing all zsh, don't need INC_APPEND_HISTORY
setopt SHARE_HISTORY
# record start & end
setopt EXTENDED_HISTORY
# don't record if accoring to last command
setopt HIST_IGNORE_DUPS
# don't record if accoring to command in all history
#setopt HIST_IGNORE_ALL_DUPS
# recording over histsize, delete first record
setopt HIST_EXPIRE_DUPS_FIRST
# finding history, don't show duplicate history
setopt HIST_FIND_NO_DUPS
# don't record if there is spsce before command
setopt HIST_IGNORE_SPACE
# don't record history command
setopt HIST_NO_STORE
# ignore different num of space
setopt HIST_REDUCE_BLANKS

# relogin
alias relogin="exec $SHELL -l"

# ^D
setopt IGNORE_EOF

# nobeep
setopt nobeep

# beep when there are files at completion
unsetopt LIST_BEEP

# nobeep, there is no history
unsetopt HIST_BEEP

# vim
alias v="vim"

# ls
alias l="ls -F --color"
alias ll="l -l"
alias llt="ll -t"
alias la="l -A"

# grep
alias -g G="| grep -i --color=always"

# compile
alias go="gcc -Wall -O0"

# no cd
setopt AUTO_CD

# chpwd
function chpwd(){
  ls -F --color
}

# cd option
alias ...='cd ../../'

# cd is pushd
setopt AUTO_PUSHD

# don't stack same dir
setopt PUSHD_IGNORE_DUPS

# don't display stack every pushd and popd
unsetopt PUSHD_SILENT

# no caveat for rm
setopt RM_STAR_SILENT
setopt RM_STAR_WAIT

# C-w
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# zsh-completions
#mkdir -p ~/.zsh
#git clone git://github.com/zsh-users/zsh-completions.git ~/.zsh/zsh-completions
#rm -f ~/.zcompdump
if [[ -d ~/.zsh/zsh-completions/src ]] then
    fpath=(~/.zsh/zsh-completions/src $fpath)
fi

# complement
#autoload -U compinit
#compinit

# Aa
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# cursor always goes to end
setopt always_to_end

# don't make new command lines
setopt always_last_prompt

# insert first completion
setopt MENU_COMPLETE

# dir/ in complement
setopt auto_param_slash

# show complement lists
setopt auto_list

# category of file in complement lists(ls -F)
setopt list_types

# show 8bit words
setopt print_eight_bit

# extended glob
setopt extended_glob

# don,t expand at glob completion
unsetopt glob_complete

# show complement lists including .*
unsetopt globdots

# tab -> completion
setopt auto_menu

# complement after =
setopt magic_equal_subst

# complement in a word
setopt complete_in_word

# chose complement with arrows
zstyle ':completion:*:default' menu select=2

# chose complement likes vim
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

# remove / when completion file is dir
setopt AUTO_REMOVE_SLASH

# remove trailing marks after completion if needed
setopt auto_param_keys

# option complement -- changes to -->
zstyle ':completion:*' list-separator '---> '

# correction
# for only command
unsetopt correct
# for all word of commandline
unsetopt correct_all
SPROMPT="zsh: correct '%R' to '%r' [nyae]?"

# don't show middle files
#zstyle ':completion:*:*files' ignored-patterns '*?.o' '*?~' '*\#'

# complementwww
# %F{}=color, %B=bold, %d=description, %e=error, %b=end color before first completing
zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _complete _approximate _match _prefix _ignored _list # _expand
zstyle ':completion:*:messages' format '%F{green}%d%b'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:warnings' format '%F{red}No matches for: %b''%F{green}%d%b'
zstyle ':completion:*:descriptions' format '%F{green}completing %B%d%b' #completing on command line too
zstyle ':completion:*:corrections' format '%F{green}%B%d%b ''%F{red}(errors: %e)%b' #completing error on command line too
zstyle ':completion:*:options' description 'yes'
#

# show complement lists with colors
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# cd ../<TAB> -> ignore current directory
zstyle ':completion:*:cd:*' ignore-parents parent pwd

# comment
setopt interactive_comments

# <C-p>, <C-n>
autoload history-search-end
zle -N history-beginning-search-forward-end history-search-end
zle -N history-beginning-search-backward-end history-search-end
bindkey "^N" history-beginning-search-forward-end
bindkey "^P" history-beginning-search-backward-end

# call a job with initial character
setopt AUTO_RESUME

# notify jobs status without new prompt
setopt NOTIFY

# you can exit zsh with no jobs
setopt CHECK_JOBS

# don't let down priority bg jobs levels
#unsetopt BG_NICE

# end jobs zsh ending
setopt HUP

# redirect files
setopt MULTIOS

# git
autoload -U vcs_info
# about vcs_info_msg_0_
# you can use %c and %u in formats
zstyle ':vcs_info:git:*' check-for-changes true
# displaying %c no commit but add
#zstyle ':vcs_info:git:*' stagedstr "%F{magenta}[!]"
# displaying %u no add
#zstyle ':vcs_info:git:*' unstagedstr "%F{magenta}[+]"
# %b is current branch name
#zstyle ':vcs_info:*' formats "%F{cyan}%c%u[%b]%f "
# my prompt about git status
function gitprompt(){
git_status=`git status 2>! /dev/null`
if [[ -n `echo $git_status | grep "^Untracked files"` ]]
then
    zstyle ':vcs_info:*' formats "[%F{magenta}%b%f][%F{magenta}!%f] "
elif [[ -n `echo $git_status | grep "^Changes not staged for commit"` ]]
then
    zstyle ':vcs_info:*' formats "[%F{magenta}%b%f][%F{magenta}!%f] "
elif [[ -n `echo $git_status | grep "^Changes to be committed"` ]]
then
    zstyle ':vcs_info:*' formats "[%F{magenta}%b%f][%F{magenta}+%f] "
else
    zstyle ':vcs_info:*' formats "[%F{cyan}%b%f] "
fi
}
# something going wrong, displayed instead of formats
zstyle ':vcs_info:*' actionformats "[%F{cyan}%b%f][%F{magenta}%a%f] "
# call displaying every prompt
precmd(){
    gitprompt
    vcs_info
}
# display at prompt
setopt prompt_subst
PS1=$PS1'${vcs_info_msg_0_}'

# git log
alias glog="git log --oneline --graph --decorate"

# zsh-syntax-highlighting
#mkdir -p ~/.zsh
#git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# each highlight (main brackets pattern cursor root line)
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

# Declare the variable
typeset -A ZSH_HIGHLIGHT_STYLES

# main default(if you changed, let default be remain useing comment out)
ZSH_HIGHLIGHT_STYLES[default]='none'
#ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red,bold'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=magenta'
#ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[reserved-word]=''
#ZSH_HIGHLIGHT_STYLES[alias]=''
ZSH_HIGHLIGHT_STYLES[alias]='fg=cyan,bold,underline'
#ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=green,underline'
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=cyan,bold,underline'
#ZSH_HIGHLIGHT_STYLES[builtin]=''
#ZSH_HIGHLIGHT_STYLES[function]=''
#ZSH_HIGHLIGHT_STYLES[command]=''
#ZSH_HIGHLIGHT_STYLES[precommand]='fg=green,underline'
ZSH_HIGHLIGHT_STYLES[precommand]=''
#ZSH_HIGHLIGHT_STYLES[commandseparator]='none'
#ZSH_HIGHLIGHT_STYLES[path]='underline'
ZSH_HIGHLIGHT_STYLES[path]='fg=yellow'
#ZSH_HIGHLIGHT_STYLES[path_pathseparator]=''
ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=yellow'
#ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]=''
ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]='fg=yellow'
#ZSH_HIGHLIGHT_STYLES[globbing]='fg=blue'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=yellow,bold,underline'
#ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=blue'
ZSH_HIGHLIGHT_STYLES[history-expansion]=''
#ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='none'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=cyan'
#ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='none'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=cyan'
#ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='none'
#ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=''
#ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]=''
#ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=''
#ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]=''
#ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]=''
#ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument-unclosed]=''
#ZSH_HIGHLIGHT_STYLES[rc-quote]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[rc-quote]=''
#ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=''
#ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=''
#ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]=''
#ZSH_HIGHLIGHT_STYLES[assign]='none'
#ZSH_HIGHLIGHT_STYLES[redirection]='none'
#ZSH_HIGHLIGHT_STYLES[comment]='fg=black,bold'
ZSH_HIGHLIGHT_STYLES[comment]='standout'
#ZSH_HIGHLIGHT_STYLES[arg0]='fg=green'
ZSH_HIGHLIGHT_STYLES[arg0]='fg=cyan,bold'

# bracket default
ZSH_HIGHLIGHT_STYLES[bracket-error]='fg=red,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-1]='fg=blue,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-2]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-3]='fg=yellow,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-4]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-5]='fg=cyan,bold'
ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]='standout'

# cursor e.g.
#ZSH_HIGHLIGHT_STYLES[cursor]='bg=blue'

# pattern e.g.
#ZSH_HIGHLIGHT_PATTERNS+=('rm -rf *' 'fg=white,bold,bg=red')
ZSH_HIGHLIGHT_PATTERNS+=('rm *' 'bg=red')

# root e.g.
#ZSH_HIGHLIGHT_STYLES[root]='bg=red'

# line e.g.
#ZSH_HIGHLIGHT_STYLES[line]='bold'

# gitignore.io
function gi() { curl -sLw "\n" https://www.toptal.com/developers/gitignore/api/$@ ;}
#gi vim > .gitignore_global

# path
export LDFLAGS="-L/usr/local/lib/"
export CPPFLAGS="-I/usr/local/include -L/usr/local/lib"
export C_INCLUDE_PATH="/usr/local/include"
export LIBRARY_PATH="/usr/local/lib"

# pip upgrade all
alias pip-upgrade-all="pip list -o | tail -n +3 | awk '{ print \$1 }' | xargs pip install -U"

# zprof
#if (which zprof > /dev/null 2>&1) ;then
#  zprof
#fi
