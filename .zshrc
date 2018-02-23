# カラーリング
autoload colors
colors

export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

local DEFAULT=$'%{\e[0m%}'
local RED=$'%F{red}'
local GREEN=$'%F{green}'
local YELLOW=$'%{\e[33m%}'
local BLUE=$'%{\e[34m%}'
local PURPLE=$'%{\e[35m%}'
local CYAN=$'%{\e[36m%}'
local WHITE=$'%{\e[37m%}'

# prompt
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '[%b] '
zstyle ':vcs_info:*' actionformats '[%b|%a] '
precmd () {
    psvar=()
        LANG=en_US.UTF-8 vcs_info
            [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
            }
            PROMPT="$GREEN%n@%m:$GREEN%~$DEFAULT "
            PROMPT2="\ "
            SPROMPT="$GREEN%r is correct? [n,y,a,e]:$DEFAULT"
            RPROMPT="$YELLOW%1(v|%1v|)$DEFAULT"
            setopt transient_rprompt

# 補完
autoload -U compinit
compinit

# 補完候補に色を付ける
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:messages' format $YELLOW'%d'$DEFAULT
zstyle ':completion:*:warnings' format $RED'No matches for:'$YELLOW' %d'$DEFAULT
zstyle ':completion:*:descriptions' format $YELLOW'%B%d...%b'$DEFAULT
zstyle ':completion:*:corrections' format $YELLOW'%B%d '$RED'(errors: %e)%b'$DEFAULT
zstyle ':completion:*:options' description 'yes'

# 補完方法毎にグループ化する
zstyle ':completion:*' group-name ''

## 補完候補がなければより曖昧に候補を探す
### m:{a-z}={A-Z}: 小文字を大文字に変えたものでも補完する
### r:|[._-]=*: 「.」「_」「-」の前にワイルドカード「*」があるものとして補完する
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z} r:|[._-]=*'

## カーソル位置で補完する
setopt complete_in_word

# ヒストリ
## ヒストリを保存するファイル
HISTFILE=$HOME/.zsh-history
## メモリ上のヒストリ数
HISTSIZE=50000
## 保存するヒストリ数
SAVEHIST=$HISTSIZE
## ヒストリファイルにコマンドラインだけではなく実行時刻と実行時間も保存する。
setopt extended_history
## zshプロセス間でヒストリを共有する。
setopt share_history

# ディレクトリ移動
## ディレクトリ名だけでcdする。
setopt auto_cd
## cdで移動してもpushdと同じようにディレクトリスタックに追加する。
setopt auto_pushd
## カレントディレクトリ中に指定されたディレクトリが見つからなかった場合に
## 移動先を検索するリスト。
cdpath=(~)
## ディレクトリが変わったらディレクトリスタックを表示。
chpwd_functions=($chpwd_functions dirs)

### プロンプトバーの左側
prompt_bar_left_self="(%{%B%}%n%{%b%}%{%F{cyan}%}@%{%f%}%{%B%}%m%{%b%})"
prompt_bar_left_status="(%{%B%F{white}%(?.%K{green}.%K{red})%}%?%{%k%f%b%})"
prompt_bar_left_date="<%{%B%}%D{%Y/%m/%d %H:%M}%{%b%}>"
prompt_bar_left="-${prompt_bar_left_self}-${prompt_bar_left_status}-${prompt_bar_left_date}-"
### プロンプトバーの右側
prompt_bar_right="-[%{%B%K{magenta}%F{white}%}%d%{%f%k%b%}]-"


# lang
export LANG=ja_JP.UTF-8

# /usr/local/bin
export PATH=/usr/local/bin:$PATH

# alias
alias ls='ls -GF'
alias ll='ls -la'
alias lv="lv -c -E'vim -c %d'"
alias vi="vim"
alias g="git"

# PAGER
if type lv > /dev/null 2>&1; then
export PAGER='lv'
else
export PAGER='less'
fi

# rbenv
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Java
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

# direnv
eval "$(direnv hook zsh)"

# for rails command short-hand
export PATH=./bin:$PATH

# git diff-highlight
export PATH=$PATH:/usr/local/share/git-core/contrib/diff-highlight

# icdiff
alias icdiff='icdiff --no-bold -H -N'

# homebrew
source ~/.homebrew

# mecab
export MECAB_PATH=/usr/local/Cellar/mecab/0.996/lib/libmecab.dylib

# peco
function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N peco-history-selection
bindkey '^R' peco-history-selection

function grep-peco-atom() {
    out=`pt --nogroup $1 | peco | awk -F : '{print $1":"$2}'`
    if [ $out ]; then
        atom $out
    fi
}
