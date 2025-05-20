#!/bin/bash

# Lock screen after 2 minutes of idle, and also before suspend
swayidle -w \
  timeout 120 '$HOME/.config/swaylock/lockscreen.sh' \
  before-sleep '$HOME/.config/swaylock/lockscreen.sh'
