# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
unsetopt appendhistory beep extendedglob
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/saviour/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

#
# ~/.zshrc
#

# sources for antigen, powerlevel, and syntax highlighting
source /usr/share/zsh/share/antigen.zsh
source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

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



