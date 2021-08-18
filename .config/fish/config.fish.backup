set -x NODE_GLOBALS $NODE_GLOBALS node
set -x NODE_GLOBALS $NODE_GLOBALS nvm

#load_nvm () {
#    set -x NVM_DIR ~/.nvm
#    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
#}
#
#for cmd in $NODE_GLOBALS
#    eval "$cmd(){ unset -f $NODE_GLOBALS; load_nvm; $cmd \$@ }"
#end

source ~/.aliases

set SPACEFISH_PROMPT_ORDER time user dir host git exec_time line_sep battery jobs exit_code char
#set SPACEFISH_PROMPT_DEFAULT_SUFFIX "\uf197"
set SPACEFISH_TIME_SHOW true

set SPACEFISH_CHAR_SYMBOL " "
set SPACEFISH_CHAR_SUFFIX "➜ "
set SPACEFISH_CHAR_COLOR_SUCCESS "blue"

alias exa="exa -l"
alias exat="exa -T"
set fish_greeting

bind \eOH beginning-of-line
bind \eOF end-of-line

function readenv --on-variable PWD
    if test -r .env
        cat .env | while read -la line
            set -l kv (string split -m 1 = -- $line)
            set -gx $kv # this will set the variable named by $kv[1] to the rest of $kv
        end
   end
end
