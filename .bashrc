#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

##############################################################################

# Envs
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$PATH:/home/neifua/.lmstudio/bin"
export VISUAL=nvim
export EDITOR={$VISUAL}
export LS_COLORS="$(vivid generate rose-pine)"
export GOPATH="$HOME/go"
export PKG_CONFIG_PATH="/usr/local/lib64/pkgconfig:$PKG_CONFIG_PATH"
# export QML_IMPORT_PATH="/usr/lib64/qt6/qml"
export PATH="\$PATH:/usr/lib64/qt6/bin"
export PATH="$PWD/depot_tools:$PATH"
export GTKLOCK_MODULE_DIR="/usr/lib/gtklock/modules"

##############################################################################

# fetch
if [[ "$TERM" == "xterm-kitty" && -n "$KITTY_WINDOW_ID" && -z "$VSCODE_PID" && -z "$NVIM" ]]; then
    fastfetch
fi

# starship
eval "$(starship init bash)"

# yazi
function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    IFS= read -r -d '' cwd < "$tmp"
    [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
    rm -f -- "$tmp"
}
