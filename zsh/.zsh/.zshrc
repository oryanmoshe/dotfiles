function keychain-environment-variable () {
    security find-generic-password -w -a ${USER} -D "environment variable" -s "${1}"
}

function set-keychain-environment-variable () {
    [ -n "$1" ] || print "Missing environment variable name"

    # Note: if using bash, use `-p` to indicate a prompt string, rather than the leading `?`
    read -s "?Enter Value for ${1}: " secret

    ( [ -n "$1" ] && [ -n "$secret" ] ) || return 1
    security add-generic-password -U -a ${USER} -D "environment variable" -s "${1}" -w "${secret}"
}

# Path to your oh-my-zsh installation.
export ZSH="/Users/oryan/.oh-my-zsh"

DISABLE_UNTRACKED_FILES_DIRTY="true"
ZSH_THEME="spaceship"
ZSH_THEME="avit"
DISABLE_MAGIC_FUNCTIONS=true
PURE_PROMPT_SYMBOL=""
SPACESHIP_CHAR_SYMBOL="\ue626 "
SPACESHIP_CHAR_SUFFIX="\uf197 "
SPACESHIP_CHAR_PREFIX=""
SPACESHIP_CHAR_COLOR_SUCCESS="blue"
SPACESHIP_PROMPT_DEFAULT_PREFIX="$USER"
SPACESHIP_PROMPT_FIRST_PREFIX_SHOW="true"
SPACESHIP_USER_SHOW="true"
SPACESHIP_TIME_SHOW="true"

SPACESHIP_PROMPT_ORDER=(
  time        # Time stamps section (Disabled)
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  #hg            # Mercurial section (hg_branch  + hg_status)
  # package     # Package version (Disabled)
  #node          # Node.js section
  #ruby          # Ruby section
  #elixir        # Elixir section
  # xcode       # Xcode section (Disabled)
  #swift         # Swift section
  #golang        # Go section
  #php           # PHP section
  #rust          # Rust section
  #haskell       # Haskell Stack section
  # julia       # Julia section (Disabled)
  # docker      # Docker section (Disabled)
  #aws           # Amazon Web Services section
  #venv          # virtualenv section
  #conda         # conda virtualenv section
  #pyenv         # Pyenv section
  #dotnet        # .NET section
  # ember       # Ember.js section (Disabled)
  #kubecontext   # Kubectl context section
  exec_time     # Execution time
  line_sep      # Line break
  battery       # Battery level and status
  # vi_mode     # Vi-mode indicator (Disabled)
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

plugins=(git zsh-syntax-highlighting zsh-autosuggestions web-search)

source $ZSH/oh-my-zsh.sh

source ~/.awscreds
source /Users/oryan/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export PATH="/usr/local/aws/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:/usr/local/go/bin"
export GOPATH="$HOME/Development/golang/"
export PATH="$PATH:$GOPATH/bin:/Users/oryan/bin"
export PATH="~/.nvm/versions/node/v8.11.3/bin:$PATH"
export PATH="$PATH:/usr/local/share"
export PATH="$PATH:/Users/oryan/Development/flutter/bin"
export PATH="$PATH:~/development/flutter/bin"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

ssh-add .ssh/RiveryEC2KeyPair.pem 2>/dev/null
ssh-add .ssh/RiveryKeyPairDev.pem 2>/dev/null

export GO111MODULE="on"
export GITHUB_TOKEN=$(keychain-environment-variable GITHUB_TOKEN);
export GITHUB_USERNAME="oryanmoshe"


declare -a NODE_GLOBALS=(`find ~/.nvm/versions/node -maxdepth 3 -type l -wholename '*/bin/*' | xargs -n1 basename | sort | uniq`)

NODE_GLOBALS+=("node")
NODE_GLOBALS+=("nvm")

load_nvm () {
    export NVM_DIR=~/.nvm
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
}

for cmd in "${NODE_GLOBALS[@]}"; do
    eval "${cmd}(){ unset -f ${NODE_GLOBALS}; load_nvm; ${cmd} \$@ }"
done


source "/Users/oryan/.oh-my-zsh/custom/themes/spaceship.zsh-theme"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform

source "$HOME/.zsh/.aliases"

#fpath+=$HOME/.zsh/pure
#autoload -U promptinit; promptinit
#prompt pure











