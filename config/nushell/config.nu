# config.nu
#
# Installed by:
# version = "0.104.0"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# This file is loaded after env.nu and before login.nu
#
# You can open this file in your default editor using:
# config nu
#
# See `help config nu` for more options
#
# You can remove these comments if you want or leave
# them for future reference.

# fetch
let term_program = (try { $env.TERM_PROGRAM } catch { "" })
if ($term_program != "vscode") {
    catnap
}

# env
$env.path ++= ["~/.local/bin"]
# $env.PATH = ($env.PATH | prepend '/home/neifua/.local/bin')
$env.config.show_banner = false
$env.config.buffer_editor = 'nvim'
$env.config.history = {
  file_format: sqlite
  max_size: 1_000_000
  sync_on_enter: true
  isolation: true
}
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
