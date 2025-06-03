# Remove welcome message
$env.config.show_banner = false

# Envs
$env.path ++= ["/sbin"]
$env.path ++= ["/bin"]
$env.path ++= ["/usr/local/sbin"]
$env.path ++= ["/usr/local/bin"]
$env.path ++= ["/usr/sbin"]
$env.path ++= ["/usr/bin"]
$env.path ++= ["$HOME/.local/bin"]
$env.path ++= ["$HOME/.cargo/bin/"]

# Default editor
$env.config.buffer_editor = 'nvim'

# History lines
$env.config.history = {
  file_format: sqlite
  max_size: 1_000_000
  sync_on_enter: true
  isolation: true
}

# Vivid ls colors generate
$env.LS_COLORS = (vivid generate rose-pine)
