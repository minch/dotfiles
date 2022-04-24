#git commit -m "Updates for template edit with proper REST semantics." Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="/Users/minch/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export EDITOR=/usr/bin/vim

eval "$(direnv hook zsh)"

eval "$(rbenv init -)"
eval export PATH="/Users/minch/.jenv/shims:${PATH}"
export JENV_SHELL=zsh
export JENV_LOADED=1
unset JAVA_HOME
source '/usr/local/Cellar/jenv/0.5.3/libexec/libexec/../completions/jenv.zsh'
jenv rehash 2>/dev/null
jenv() {
  typeset command
  command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  enable-plugin|rehash|shell|shell-options)
    eval `jenv "sh-$command" "$@"`;;
  *)
    command jenv "$command" "$@";;
  esac
}

alias gcb='git rev-parse --abbrev-ref HEAD'
alias gbbd='git checkout -b "$(gcb)-pre-rebase-$(date +%Y-%m-%d-%H-%M-%S)"'

# Music
alias m="cd ~/Dropbox/Music/Sheet\ Music\ and\ Tabs"

alias hm='cd /Users/minch/code/heymarket/'
alias hmd='cd /Users/minch/code/heymarket/dev'
alias hmw='cd /Users/minch/code/heymarket/hm-web/'
alias hmo="cd ~/code/heymarket/go/src/github.com/CommonSun/heymono"
alias hmi='cd /Users/minch/code/heymarket/go/src/github.com/CommonSun/integrations/'
alias hmg='cd /Users/minch/code/heymarket/go/src/github.com/CommonSun/go-ec2/'
alias hmm="cd ~/code/heymarket/go/src/github.com/CommonSun/hm-management"
alias aw="cd ~/code/heymarket/go/src/github.com/CommonSun/admin-web"
alias umd='usql "postgres://heydev:heydev@localhost/main_development?sslmode=disable"'
alias umt='usql "postgres://heydev:heydev@localhost/main_test?sslmode=disable"'
alias pmt='psql -h localhost -Uheydev main_test'
alias pmd='psql -h localhost -Uheydev main_development'
alias pmdi='psql -h localhost -Uheydev service_development'
alias pmdit='psql -h localhost -Uheydev service_test'
alias pms='psql -h stag-enc.cfd7wruunyzh.us-west-1.rds.amazonaws.com -Uadam hm_staging'
alias pmsi='psql -h stag-enc.cfd7wruunyzh.us-west-1.rds.amazonaws.com -Uadam integrations_staging'
alias pmp='psql -h production-enc.cfd7wruunyzh.us-west-1.rds.amazonaws.com -Uadam -d maindb'
alias pmi='psql -h integrations-production.cluster-cfd7wruunyzh.us-west-1.rds.amazonaws.com -Uhm_integrations -d integrations_production'
alias pmpr='psql -h production-enc-read3.cfd7wruunyzh.us-west-1.rds.amazonaws.com -Uadam maindb'
alias pmpri='psql -h production-enc-read3.cfd7wruunyzh.us-west-1.rds.amazonaws.com -Uadam integrations_production'
alias tl='tmux list 2>&1 > /dev/null'
alias tn='tmux new -s $1'
alias ta='tmux attach -t $1'
alias shd='ssh -i ~/.ssh/id_rsa-hm adam@172.31.6.133'
alias l='lsd -altrh'

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

export GOPATH=$HOME/code/heymarket/go
export PATH="$GOPATH/src/github.com/CommonSun/heymono/bin:$PATH"
export PATH=$PATH:$GOPATH/bin

export HM_ENV=local
export HM_FRONTEND_PATH="~/code/heymarket/hm-web"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

eval "$(mcfly init zsh)"

export PATH=$HOME/code/heymarket/heymono/bin:$PATH

source /Users/minch/.config/broot/launcher/bash/br

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
