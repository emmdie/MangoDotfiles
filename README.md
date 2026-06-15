Current config for my laptop. Built arround MangoWC with [Gruvbox](https://github.com/morhetz/gruvbox) colours
# Screenshots
<img width="1919" height="1200" alt="image" src="https://github.com/user-attachments/assets/82584841-e84d-4bd5-a82e-98560d124c51" />
<img width="1919" height="1200" alt="image" src="https://github.com/user-attachments/assets/ac84b26e-e864-4cee-b586-361ea82e3a43" />
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/5ec8f0bd-6017-440d-9fc8-748c6df86f53" />

# Software
## Window manager: [Mango](https://mangowm.github.io/)
- MDisplay for configuring monitors
- Bar: [waybar](https://github.com/alexays/waybar)

## Shell
Fish (required for layout script, chose this because of jvns.ca recommendation)
### Plugins:
* [Fisher](https://github.com/jorgebucaran/fisher)
* [Sponge](https://github.com/meaningful-ooo/sponge)
* [Autopair](https://github.com/jorgebucaran/autopair.fish)
* [Tide](https://github.com/IlanCosman/tide)
### Aliases
- defined in myabbrs.fish
- Check fish config, additionally I use [advcpmv](https://github.com/jarun/advcpmv) instead of cp and mv
### System status display
I like to display a small System status display upon opening a new Shell like so:  21:06 │ 󰍛 4.4Gi/15Gi │ 󰘚 2% │ 󰋊 36% │ Pacman: 󰚰 80
This requires two scripts to download upgradeable packages daily in the background and show the current count of downloaded packages.

<details>
  <summary>Scripts</summary>
  ### 

  ### /etc/systemd/system/pacman-download.timer
  ```systemd
  [Unit]
  Description=Timer for downloading package updates

  [Timer]
  OnCalendar=daily
  Persistent=true

  [Install]
  WantedBy=timers.target
  
  ```
  
  ### /etc/systemd/system/pacman-download.timer
  ```systemd
  [Unit]
  Description=Download available package updates (no install)

  [Service]
  Type=oneshot
  ExecStart=/usr/bin/pacman -Syuw --noconfirm
  
   ```
  Start the timer:
  ```bash
  sudo systemctl daemon-reload
  sudo systemctl enable --now pacman-download.timer

  ```
  
</details>

## Terminal
ghostty

## Screenshots
wayfreeze, grim, slurp
## lock screen
* swayidle
* swaylock
## Browser
- Firefox with mtab, Slop evader, keepassxc, uBlock origin, pawBlock and gruvbox dark theme

## Utils
### System
- Paccache for cleaning pacman cache
### Productivity
- pomotime (installed via pipx)
