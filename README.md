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
![Screenshot from 2025-06-04 00-29-32](https://github.com/user-attachments/assets/7339b10d-9def-4d8a-8208-6f0132b7ae6c)

![Screenshot from 2025-06-04 00-31-43](https://github.com/user-attachments/assets/8ea0d065-6d1a-43b5-bced-14bb278b0c5a)

