[![Made with Doom Emacs](https://img.shields.io/badge/Made_with-Doom_Emacs-blueviolet.svg?style=flat-square&logo=GNU%20Emacs&logoColor=white)](https://github.com/hlissner/doom-emacs)
[![NixOS Unstable](https://img.shields.io/badge/NixOS-unstable-blue.svg?style=flat-square&logo=NixOS&logoColor=white)](https://nixos.org)

**Greetings!** Welcome to my little grimoire of declarative configuration and expressions~
Here I organize all things Nix, It is heavily ~~borrowed~~ inspired by [hlissner's dotfiles](https://github.com/hlissner/dotfiles) and [digga](https://github.com/divnix/digga). There's nothing much to add besides that, it is ever evolving and changing.

<img src="/../screenshots/priestess.png"/>

------

|                |                                                          |
|----------------|----------------------------------------------------------|
| **Shell:**     | zsh + zgenom                                             |
| **DM:**        | lightdm + lightdm-mini-greeter                           |
| **WM:**        | bspwm + polybar                                          |
| **Editor:**    | doom-emacs / vscode                                      |
| **Terminal:**  | st / kitty                                               |
| **Launcher:**  | rofi                                                     |
| **Browser:**   | firefox                                                  |
| **GTK Theme:** | [Ant Dracula](https://github.com/EliverLara/Ant-Dracula) |

-----


## Installation Guide

1. Acquire NixOS 21.11 or newer:
   ```sh
   # Yoink nixos-unstable
   wget -O nixos.iso https://channels.nixos.org/nixos-unstable/latest-nixos-minimal-x86_64-linux.iso
   
   # Write it to a flash drive
   cp nixos.iso /dev/sdX
   ```

2. Boot into the installer.

3. Switch to root user: `sudo su -`

4. Do your partitions and mount your root to `/mnt` ([for
   example](hosts/priestess/README.org)).

5. Install these dotfiles:
   ```sh
   nix-shell -p git nixFlakes

   # Set HOST to the desired hostname of this system
   HOST=...
   # Set USER to your desired username (defaults to yael)
   USER=...

   git clone https://github.com/konata-chan404/dotfiles /etc/dotfiles
   cd /etc/dotfiles
   
   # Create a host config in `hosts/` and add it to the repo:
   mkdir -p hosts/$HOST
   nixos-generate-config --root /mnt --dir /etc/dotfiles/hosts/$HOST
   rm -f hosts/$HOST/configuration.nix
   cp hosts/priestess/default.nix hosts/$HOST/default.nix
   vim hosts/$HOST/default.nix  # configure this for your system; don't use it as is!
   git add hosts/$HOST
   
   # Install nixOS
   USER=$USER nixos-install --root /mnt --impure --flake .#$HOST
   
   # If you get 'unrecognized option: --impure', replace '--impure' with 
   # `--option pure-eval no`.

   # Then move the dotfiles to the mounted drive!
   mv /etc/dotfiles /mnt/etc/dotfiles
   ```

6. Then reboot and you're good to go!

> :warning: **Don't forget to change your `root` and `$USER` passwords!** They
> are set to `nixos` by default.