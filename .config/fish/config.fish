#
# ~/.config/fish/config.fish
#

# Interactive shell setup
if status is-interactive
    # fetch
  if test "$TERM" = "xterm-kitty" -a -n "$KITTY_WINDOW_ID" -a -z "$VSCODE_PID" -a -z "$NVIM"
    fastfetch
  end

  # starship
  starship init fish | source

  # yazi
  function y
	  set tmp (mktemp -t "yazi-cwd.XXXXXX")
	  yazi $argv --cwd-file="$tmp"
	  if read -z cwd < "$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		  builtin cd -- "$cwd"
	  end
	  rm -f -- "$tmp"
  end
end

##############################################################################

# Envs
set -gx PATH $HOME/.local/bin $PATH
set -gx PATH $HOME/.cargo/bin $PATH
set -gx PATH /usr/local/bin $PATH
set -gx PATH $HOME/bin $PATH
set -gx PATH $HOME/go/bin $PATH
set -gx PATH $PWD/depot_tools $PATH
set -gx PATH /home/neifua/.lmstudio/bin $PATH
set -gx EDITOR nvim
set -gx LS_COLORS (vivid generate rose-pine)
set -gx GOPATH $HOME/go
set -gx PKG_CONFIG_PATH /usr/local/lib64/pkgconfig:$PKG_CONFIG_PATH
set -gx QML_IMPORT_PATH /usr/lib64/qt6/qml
set -gx GTKLOCK_MODULE_DIR /usr/lib/gtklock/modules
