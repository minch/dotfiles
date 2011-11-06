# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="minch-eastwood"

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
export PATH=/Users/minch/.rvm/bin:/Users/minch/.rvm/bin:/opt/local/bin:/opt/local/sbin:/Users/minch/.rvm/gems/ree-1.8.7-2010.02/bin:/Users/minch/.rvm/gems/ree-1.8.7-2010.02@global/bin:/Users/minch/.rvm/rubies/ree-1.8.7-2010.02/bin:/opt/local/mysql/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/Users/minch/bin:/opt/bin:/usr/local/sphinx/bin:/opt/amazon/ec2/tools/bin:/Users/minch/scripts:/Users/minch/.gem/ruby/1.8/bin:/opt/local/libexec/git-core:/usr/local/share/git-core

if [[ -s ~/.rvm/scripts/rvm ]] ; then source ~/.rvm/scripts/rvm ; fi

alias lp3='cd ~/code/rails/lp3'
alias deathstar='cd ~/code/rails/deathstar'
