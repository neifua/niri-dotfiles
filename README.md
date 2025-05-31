# Neifua's niri Dotfiles

This repo is my personal [niri](https://github.com/YaLTeR/niri) dotfiles. I use niri because of the scrollable-tiling feature and I love the hell outta it, Wayland kinda sucks but who cares 🤷.

## Notes

- This setup is designed for my personal use, but feel free to clone and use, explore or fork.
- You might need to tweak some paths or programs depending on your system.

## Installation
- Dependencies:

```
sudo pacman -S wlroots xwayland-satellite xdg-desktop-portal-gtk xdg-desktop-portal-gnome gnome-keyring polkit-gnome nemo brightnessctl pipewire pavucontrol
```
```
yay -S kitty swww swayidle swayosd dunst waybar swaylock-effects rofi-wayland nushell emote nemo yazi vivid
```

- Cloning:

```
git clone https://github.com/neifua/niri-dotfiles.git
cd niri-dotfiles
cp -r config/* ~/.config/
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

## Screenshot
![image](https://github.com/user-attachments/assets/b5dfe29c-5949-4cc3-b7ab-a054cecaacfb)
