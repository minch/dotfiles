# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
#export ZSH_THEME="minch-eastwood"
#export ZSH_THEME="aussiegeek"
#export ZSH_THEME="bira"
export ZSH_THEME="crunch"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git ruby rails)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/Users/minch/.rvm/bin:/Users/minch/.rvm/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:n:/Users/minch/scripts

export GIT_EDITOR="vim -f"
export EDITOR="vim -f"
export VISUAL="mvim -f"

# history
alias h='fc -l 1 | ack -i'

alias lp3='cd ~/code/rails/lp3'
alias deathstar='cd ~/code/rails/deathstar'
alias ryojin='cd ~/code/rails/ryojin'
alias dropbox='cd /Volumes/Data/Users/minch/Dropbox/'

# rspec and zsh playing nice
alias rspec='nocorrect rspec'
alias mvim='nocorrect mvim'

# rvm
# if [[ -s ~/.rvm/scripts/rvm ]] ; then source ~/.rvm/scripts/rvm ; fi
rvm use 1.9.3 --default

# For Homebrew
export PATH=/usr/local/bin:$PATH

# PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
