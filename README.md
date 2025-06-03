# Neifua's niri Dotfiles

This repo is my personal [niri](https://github.com/YaLTeR/niri) dotfiles. I use niri because of the scrollable-tiling feature and I love the hell outta it, Wayland kinda sucks but who cares 🤷.

## Notes

- This setup is designed for my personal use, but feel free to clone and use, explore or fork.
- You might need to tweak some paths or programs depending on your system.

## Installation
- Dependencies:

```
sudo pacman -S wlroots xwayland-satellite xdg-desktop-portal-gtk xdg-desktop-portal-gnome gnome-keyring polkit-gnome brightnessctl pipewire pavucontrol
```
```
yay -S kitty swww swayidle swayosd dunst waybar swaylock-effects rofi-wayland nushell emote nemo yazi vivid
```

- Cloning:

```
git clone https://github.com/neifua/niri-dotfiles.git
cd niri-dotfiles
cp -r .config/* ~/.config/
cp -r Wallpapers/ ~/Pictures/
```

## Simple keybinds
|**Keybinds**|**Action**|
|:-|:-|
|**`Mod + C`**|**`Close Window`**|
|**`Mod + Q`**|**`Spawn Kitty`**|
|**`Mod + E`**|**`Spawn Yazi`**|
|**`Mod + Period`**|**`Spawn Emote`**|
|**`Mod + L`**|**`Spawn Swaylock`**|
|**`Mod + Enter`**|**`Spawn Apps Launcher`**|
|**`Mod + Shift + E`**|**`Spawn Powermenu`**|

## Screenshots
![Screenshot from 2025-05-31 21-46-22](https://github.com/user-attachments/assets/ead7414f-f0dc-41be-9d74-6bec00542df5)
![Screenshot from 2025-05-31 21-49-24](https://github.com/user-attachments/assets/2c32fc66-61f1-4eb1-b02f-302df17f53f8)
![Screenshot from 2025-05-31 21-54-10](https://github.com/user-attachments/assets/f5a844fa-a6b4-420d-8ed2-38701ca29778)
