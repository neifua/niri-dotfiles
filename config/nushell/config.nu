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

# starship
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
