#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

##################################################

# Envs
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export VISUAL=nvim
export EDITOR={$VISUAL}
export LS_COLORS="$(vivid generate rose-pine)"
export GOPATH="$HOME/go"
export PKG_CONFIG_PATH="/usr/local/lib64/pkgconfig:$PKG_CONFIG_PATH"

##################################################

# fetch
if [[ "$TERM" == "xterm-kitty" && -n "$KITTY_WINDOW_ID" && -z "$VSCODE_PID" && -z "$NVIM" ]]; then
    fastfetch
fi

# programs
eval "$(starship init bash)"

# yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}
