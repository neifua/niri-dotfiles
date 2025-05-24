# fetch
let term = (try { $env.TERM } catch { "" })
echo $"TERM is ($term)"
if ($term == "xterm-kitty") {
    catnap
} else {
    echo "Not Kitty terminal, skipping catnap"
}

# plugins
const NU_PLUGIN_DIRS = [
  ($nu.current-exe | path dirname)
  ...$NU_PLUGIN_DIRS
]

# env
$env.path ++= ["~/.local/bin"]
$env.path ++= ["~/.cargo/bin"]
$env.PATH = [($env.HOME + "/bin")] ++ $env.PATH
$env.config.show_banner = false
$env.config.buffer_editor = 'nano'
$env.config.history = {
  file_format: sqlite
  max_size: 1_000_000
  sync_on_enter: true
  isolation: true
}

# starship
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
