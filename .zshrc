#######################
# ZSH configuration

# Applicatons environment path
export PATH=$HOME/bin:/usr/local/bin:$HOME/.yarn/bin:$HOME/.config/composer/vendor/bin:$PATH

# Oh-my-zsh installation path
export ZSH=/usr/share/oh-my-zsh

ZSH_THEME="powerlevel10k/powerlevel10k"

# Time to update in days (two weeks)
export UPDATE_ZSH_DAYS=14

# My ZSH plugins
plugins=(git)

source $ZSH/oh-my-zsh.sh

#######################
# User configuration

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export TERM="xterm-256color"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
