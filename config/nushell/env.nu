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
$env.QT_IM_MODULE  = "fcitx"
$env.XMODIFIERS    = "@im=fcitx"
$env.INPUT_METHOD  = "fcitx"
$env.SDL_IM_MODULE = "fcitx"
