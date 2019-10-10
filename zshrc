#
# ~/.zshrc
#

# sources for antigen, powerlevel, and syntax highlighting
source /usr/share/zsh/share/antigen.zsh
source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# gopath
export GOPATH=$HOME/Documents/misc/go/

# jekyll path
export PATH=$PATH:/home/saviour/.gem/ruby/2.6.0/bin/


# antigen theming
antigen use oh-my-zsh
antigen apply


# if not running interactively, don't do anything
[[ $- != *i* ]] && return

# powerlevel9k configuration
POWERLEVEL9K_MODE='awesome-fontconfig'
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_DISABLE_RPROMPT=true
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()

POWERLEVEL9K_DIR_BACKGROUND='255'
POWERLEVEL9K_DIR_FOREGROUND='255'



# simplification aliases
alias ls='ls --color=auto'
alias nya='nohup mpg123 ~/Downloads/nya.mp3 > /dev/null 2>&1 && cd'
alias sudo='sudo -p"password: "'
alias fucking='sudo'
alias subl='subl3'
alias lsa='ls -a'
alias ezrc='subl3 ~/.zshrc'
alias py='python3'
alias dfsize='wmctrl -r :ACTIVE: -e 0,-1,-1,722,434'
alias sysprint='echo "\033[2J\033[1;1H" && neofetch && read'

# custom script aliases
alias addcustomscript="~/Documents/scripts/addcustomscript.py"
alias cb="~/Documents/scripts/cb.sh"
alias wterminal='~/Documents/scripts/wt-terminal.py'
alias ssharmony='~/Documents/scripts/ssharmony.sh'
alias givedec='~/Documents/scripts/givedec.sh'
alias rmdec='~/Documents/scripts/rmdec.sh'
alias gchrome='~/Documents/scripts/gchrome.sh'
alias dlcommand='~/Documents/scripts/dlcommand.py'
alias wt-terminal='/home/saviour/Documents/scripts/wt-terminal.py'
alias wt-terminal='/home/saviour/Documents/scripts/wt-terminal.py'
alias upl='~/Documents/scripts/upl.sh'
alias tosubl='~/Documents/scripts/tosubl.sh'
alias etherkey='~/Documents/scripts/etherkey.sh'
alias settitle='~/Documents/scripts/settitle.sh'
alias scratch='~/Documents/scripts/scratch.sh'
alias tonum='~/Documents/scripts/tonum.py'
alias weather='~/Documents/scripts/weather.sh e58b94f242b7fe6ba757e716b2958f52 4634662'
alias colorbars='~/Documents/scripts/colorbars.sh'
alias qod='~/Documents/scripts/qod.sh'
alias gpustat='~/Documents/scripts/gpustat.sh'
alias vid2gif='~/Documents/scripts/vid2gif.sh'
alias extractgst='~/Documents/scripts/extractgst.sh'
alias vpnconnect='~/Documents/scripts/vpnconnect.sh'
alias vpnconnect='~/Documents/scripts/vpnconnect.sh'
alias vpndisconnect='~/Documents/scripts/vpndisconnect.sh'
alias vpnstatus='~/Documents/scripts/vpnstatus.sh'