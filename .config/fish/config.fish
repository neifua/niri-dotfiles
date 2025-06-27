if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Envs
set -x PATH $HOME/.local/bin $PATH
set -x PATH $HOME/.cargo/bin $PATH
set -x PATH /usr/local/bin $PATH
set -x PATH $HOME/bin $PATH
set -x PATH $HOME/go/bin $PATH
set -x PATH $PWD/depot_tools $PATH
set -x VISUAL nvim
set -x EDITOR $VISUAL
set -x LS_COLORS (vivid generate rose-pine)
set -x GOPATH $HOME/go
set -x PKG_CONFIG_PATH /usr/local/lib64/pkgconfig:$PKG_CONFIG_PATH
set -x QML_IMPORT_PATH /usr/lib64/qt6/qml
set -x GTKLOCK_MODULE_DIR /usr/lib/gtklock/modules

# fetch
if test "$TERM" = "xterm-kitty" -a -n "$KITTY_WINDOW_ID" -a -z "$VSCODE_PID" -a -z "$NVIM"
    fastfetch
end

# theme
fish_config theme choose "Rosé Pine"

# starship
starship init fish | source
