# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
#export ZSH_THEME="minch-eastwood"
#export ZSH_THEME="aussiegeek"
#export ZSH_THEME="bira"
export ZSH_THEME="agnoster"

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
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:n:/Users/minch/scripts

export GIT_EDITOR="vim -f"
export EDITOR="vim -f"
export VISUAL="vim -f"

# history
alias h='fc -l 1 | ack -i'

alias lp3='cd ~/code/rails/lp3'
alias aa='cd ~/code/rails/assistly/desk'
alias ma='cd ~/code/mobile/desk/mobile-android'
alias mi='cd ~/code/ios/assistly/mobile-ios'
alias ryojin='cd ~/code/rails/ryojin'
alias dropbox='cd /Volumes/Data/Users/minch/Dropbox/'
alias kanaloa='cd ~/code/mobile/kanaloa'

# rspec and zsh playing nice
alias rspec='nocorrect rspec'
alias mvim='nocorrect mvim'
# alias bundle='nocorrect bundle'
alias l='ls -altr'
alias be='nocorrect bundle exec'
alias ag='nocorrect ag'

alias dfs='nocorrect bundle exec desk-flow ticket start'
alias dfsu='nocorrect bundle exec desk-flow ticket submit'
alias dfc='nocorrect bundle exec desk-flow ticket complete'
alias dfr='nocorrect bundle exec desk-flow ticket review'

# For Homebrew
export PATH=/usr/local/bin:$PATH

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# possibly for preventing window renames in tmux
export DISABLE_AUTO_TITLE=true

source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
chruby 2.1.5
