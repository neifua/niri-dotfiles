if (and (eq $E:TERM "xterm-kitty") (not (has-key E "VSCODE_PID")) (not (has-key E "NVIM"))) {
  fastfetch
}

use re
use readline-binding
use path
use str
use math
use epm
use github.com/zzamboni/elvish-completions/ssh
use github.com/zzamboni/elvish-modules/dir
use github.com/zzamboni/elvish-modules/terminal-title
use github.com/zzamboni/elvish-modules/atlas
use github.com/zzamboni/elvish-modules/opsgenie
use github.com/zzamboni/elvish-modules/leanpub
use github.com/zzamboni/elvish-modules/tinytex
use github.com/zzamboni/elvish-modules/git-summary gs
use github.com/zzamboni/elvish-modules/util
use github.com/muesli/elvish-libs/git
use github.com/zzamboni/elvish-modules/util-edit
use github.com/zzamboni/elvish-modules/spinners
use github.com/zzamboni/elvish-modules/tty

epm:install &silent-if-installed         ^
github.com/zzamboni/elvish-modules     ^
github.com/zzamboni/elvish-completions ^
github.com/xiaq/edit.elv               ^
github.com/muesli/elvish-libs          ^
github.com/iwoloschin/elvish-packages

util-edit:electric-delimiters

var private-loaded = ?(use private)

fn ls {|@a| e:ls --color $@a }

set edit:insert:binding[Alt-Backspace] = $edit:kill-small-word-left~
set edit:insert:binding[Alt-d] = $edit:kill-small-word-right~
set edit:insert:binding[Alt-i] = $dir:history-chooser~
set leanpub:api-key-fn = { 1pass:get-item leanpub &fields=["API key"] }
set E:EDITOR = "nvim"
set paths = [
  ~/bin
  /usr/local/bin
  ~/.cargo/bin
  ~/.local/bin
  /sbin
  /bin
  /usr/local/sbin
  /usr/sbin
  /usr/bin
]

eval (starship init elvish)
