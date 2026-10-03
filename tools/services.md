
Yes. I compared your **original service/autostart list** with the current one. Below is the clean record of what you have changed, what is actually disabled now, and exactly how to start/re-enable each item when needed.

One important issue: **Docker and containerd are still running right now**, even though Docker is no longer enabled at boot. Your current output shows:

```text
docker.service       active running
containerd.service   active running
```

So they were disabled from automatic startup, but the currently running processes were not stopped, or Docker restarted them. We'll account for that.

# Linux Services You Disabled

## 1. AppArmor

**Status:** Disabled from automatic startup.

Originally:

```text
apparmor.service    enabled
```

Now it is absent from the enabled list.

### What it does

AppArmor is a Linux security mechanism that restricts what applications can access.

### Start temporarily

```bash
sudo systemctl start apparmor.service
```

### Re-enable at boot

```bash
sudo systemctl enable --now apparmor.service
```

### Disable again

```bash
sudo systemctl disable --now apparmor.service
```

**Current choice:** Disabled.

> Note: I still recommend reconsidering this one later because it is a security feature. Its boot cost was about 4 seconds.

---

# 2. Cronie

**Status:** Disabled.

Originally:

```text
cronie.service    enabled
```

Now it is gone from the enabled list.

Cronie provides scheduled `cron` jobs.

### Start manually

```bash
sudo systemctl start cronie.service
```

### Re-enable automatic startup

```bash
sudo systemctl enable --now cronie.service
```

### Disable again

```bash
sudo systemctl disable --now cronie.service
```

**Current choice:** Disabled because you don't use cron.

---

# 3. CUPS

**Status:** Disabled.

Originally:

```text
cups.service    enabled
cups.socket     enabled
```

Now neither appears as enabled.

CUPS is the Linux printing system.

### Start manually

```bash
sudo systemctl start cups.service
```

### Re-enable automatic startup

```bash
sudo systemctl enable --now cups.service
sudo systemctl enable cups.socket
```

### Disable again

```bash
sudo systemctl disable --now cups.service
sudo systemctl disable cups.socket
```

**Current choice:** Disabled because you don't use physical printers.

---

# 4. Docker

**Status:** Disabled from automatic startup, but **still running right now**.

Originally:

```text
docker.service    enabled
```

Now:

```text
docker.service    NOT enabled
```

But:

```text
docker.service    active running
```

### Stop it now

Since you want Docker to be manual:

```bash
sudo systemctl stop docker.service
```

Then check:

```bash
systemctl status docker.service
```

You should see it inactive.

### Start Docker when you need it

```bash
sudo systemctl start docker.service
```

Then:

```bash
docker ps
```

### Re-enable Docker at boot

If you later decide you want Docker running every boot:

```bash
sudo systemctl enable --now docker.service
```

### Disable automatic startup again

```bash
sudo systemctl disable docker.service
```

And if it's running:

```bash
sudo systemctl stop docker.service
```

---

# 5. containerd

This one needs a small distinction.

`containerd.service` wasn't in your original **enabled services** list, but it was running because Docker uses it.

Your current output still shows:

```text
containerd.service    active running
```

After stopping Docker, check:

```bash
systemctl status containerd.service
```

If it remains running and you don't need Docker:

```bash
sudo systemctl stop containerd.service
```

### Start manually

```bash
sudo systemctl start containerd.service
```

Normally, you shouldn't need to start it separately when using Docker. Start Docker first:

```bash
sudo systemctl start docker.service
```

### If you explicitly want containerd enabled at boot

```bash
sudo systemctl enable --now containerd.service
```

### Disable automatic startup

```bash
sudo systemctl disable containerd.service
```

For your setup, I would leave **both Docker and containerd manual**.

---

# 6. ModemManager

**Status:** Disabled.

Originally:

```text
ModemManager.service    enabled
```

Now absent from the enabled list.

This manages cellular/WWAN modems such as USB 4G/5G modems and laptops with SIM-based cellular hardware.

It isn't required for your normal Wi-Fi.

### Start manually

```bash
sudo systemctl start ModemManager.service
```

### Re-enable at boot

```bash
sudo systemctl enable --now ModemManager.service
```

### Disable again

```bash
sudo systemctl disable --now ModemManager.service
```

**Current choice:** Disabled.

---

# 7. NetworkManager-wait-online

**Status:** Disabled.

Originally:

```text
NetworkManager-wait-online.service    enabled
```

Now absent.

This is good because it was adding:

```text
8.433 seconds
```

to the boot chain.

Remember:

> **You did NOT disable NetworkManager.**

You still have:

```text
NetworkManager.service    active running
wpa_supplicant.service    active running
```

So your Wi-Fi/network connection is still managed normally.

### Start it manually if you ever need it

```bash
sudo systemctl start NetworkManager-wait-online.service
```

Usually you won't need to.

### Re-enable at boot

```bash
sudo systemctl enable NetworkManager-wait-online.service
```

### Disable again

```bash
sudo systemctl disable NetworkManager-wait-online.service
```

**Current choice:** Disabled.

---

# 8. Proton VPN

**Status:** Disabled from automatic startup.

Originally:

```text
proton.VPN.service    enabled
```

Now absent from the enabled list.

### Start Proton VPN manually

```bash
sudo systemctl start proton.VPN.service
```

Check:

```bash
systemctl status proton.VPN.service
```

### Re-enable at boot

```bash
sudo systemctl enable --now proton.VPN.service
```

### Disable again

```bash
sudo systemctl disable --now proton.VPN.service
```

**Current choice:** Manual start.

Remember that while the service is stopped, your normal Internet traffic isn't automatically going through Proton VPN.

---

# User Services You Disabled

You made a bigger change here.

Originally you had:

```text
dms.service
mega-mount.service
mpd.service
rclone-gdrive.service
rclone-onedrive.service
valent.service
wireplumber.service
xdg-user-dirs.service
```

Now:

```text
dms.service
valent.service
wireplumber.service
xdg-user-dirs.service
```

So these four were disabled:

```text
mega-mount.service
mpd.service
rclone-gdrive.service
rclone-onedrive.service
```

---

# 9. MEGA mount

**Status:** Disabled.

Originally:

```text
mega-mount.service    enabled
```

Now it is no longer enabled or running.

This was your rclone mount for MEGA.

### Start MEGA manually

```bash
systemctl --user start mega-mount.service
```

Check:

```bash
systemctl --user status mega-mount.service
```

### Re-enable at login

```bash
systemctl --user enable --now mega-mount.service
```

### Disable automatic startup

```bash
systemctl --user disable --now mega-mount.service
```

**Current choice:** Manual start.

---

# 10. Google Drive mount

**Status:** Disabled.

Originally:

```text
rclone-gdrive.service    enabled
```

Now it is gone.

### Start manually

```bash
systemctl --user start rclone-gdrive.service
```

### Re-enable at login

```bash
systemctl --user enable --now rclone-gdrive.service
```

### Disable again

```bash
systemctl --user disable --now rclone-gdrive.service
```

**Current choice:** Manual start.

---

# 11. OneDrive

You said you don't need OneDrive.

There were actually **two things** related to OneDrive:

### User service

```text
rclone-onedrive.service
```

You disabled it.

### Desktop autostart

```text
~/.config/autostart/onedrive.desktop
```

You removed it.

That `.desktop` file contained:

```bash
rclone mount --vfs-cache-mode full onedrive: ~/OneDrive2
```

So OneDrive should no longer automatically mount.

### If you ever need the old OneDrive mount

You can manually run:

```bash
rclone mount --vfs-cache-mode full onedrive: ~/OneDrive2
```

But since you said you don't need OneDrive, **I would leave it disabled and not restore the autostart.**

---

# 12. MPD

**Status:** Disabled.

Originally:

```text
mpd.service    enabled
```

Now it isn't enabled or running.

MPD = Music Player Daemon.

### Start manually

```bash
systemctl --user start mpd.service
```

### Re-enable at login

```bash
systemctl --user enable --now mpd.service
```

### Disable again

```bash
systemctl --user disable --now mpd.service
```

**Current choice:** Disabled/manual.

If you never use MPD, we can later check whether you even need the package installed.

---

# 13. Valent

**Status:** **Still enabled.**

This is important.

Your current list still says:

```text
valent.service    enabled
```

And it is running:

```text
app-ca.andyholmes.Valent@autostart.service    active running
```

So you **have not disabled Valent yet**.

Since you previously said you were experimenting with Valent and wanted a lighter phone-integration setup, I wouldn't disable it unless you've decided you don't use it.

If you want it manual:

```bash
systemctl --user disable --now valent.service
```

Then also disable its desktop autostart:

```bash
mkdir -p ~/.config/autostart-disabled
mv ~/.config/autostart/ca.andyholmes.Valent.desktop \
   ~/.config/autostart-disabled/
```

Start it manually later:

```bash
systemctl --user start valent.service
```

Re-enable automatic startup:

```bash
systemctl --user enable --now valent.service
```

---

# 14. Bluetooth

You **did not disable Bluetooth**.

Good, because you said you use/like it.

Currently:

```text
bluetooth.service    enabled
```

and:

```text
app-blueman@autostart.service    active running
obex.service                      active running
```

So leave these alone.

---

# 15. SSH

You also **did not disable SSH**.

Your current list still has:

```text
sshd.service    enabled
```

and it is running.

If you don't need other machines to SSH **into this laptop**, you can make it manual:

```bash
sudo systemctl disable --now sshd.service
```

Then later:

```bash
sudo systemctl start sshd.service
```

Or restore automatic startup:

```bash
sudo systemctl enable --now sshd.service
```

### Important

You can still use:

```bash
ssh user@server
```

for outgoing SSH connections even when `sshd.service` is disabled.

`sshd` is the server component that accepts incoming SSH connections.

---

# Current status summary

| Service            | Original            | Current                             | Manual start                                      |
| ------------------ | ------------------- | ----------------------------------- | ------------------------------------------------- |
| AppArmor           | Enabled             | **Disabled**                        | `sudo systemctl start apparmor`                   |
| Cronie             | Enabled             | **Disabled**                        | `sudo systemctl start cronie`                     |
| CUPS               | Enabled             | **Disabled**                        | `sudo systemctl start cups`                       |
| CUPS socket        | Enabled             | **Disabled**                        | `sudo systemctl enable --now cups.socket`         |
| Docker             | Enabled             | **Disabled, but currently running** | `sudo systemctl start docker`                     |
| containerd         | Running via Docker  | **Still running**                   | `sudo systemctl start containerd`                 |
| ModemManager       | Enabled             | **Disabled**                        | `sudo systemctl start ModemManager`               |
| NM wait-online     | Enabled             | **Disabled**                        | `sudo systemctl start NetworkManager-wait-online` |
| Proton VPN         | Enabled             | **Disabled**                        | `sudo systemctl start proton.VPN`                 |
| MEGA mount         | Enabled             | **Disabled**                        | `systemctl --user start mega-mount`               |
| Google Drive mount | Enabled             | **Disabled**                        | `systemctl --user start rclone-gdrive`            |
| OneDrive           | Autostart + service | **Disabled/removed**                | Manual rclone command if ever needed              |
| MPD                | Enabled             | **Disabled**                        | `systemctl --user start mpd`                      |
| Bluetooth          | Enabled             | **Still enabled**                   | —                                                 |
| SSH                | Enabled             | **Still enabled**                   | —                                                 |
| Valent             | Enabled             | **Still enabled**                   | —                                                 |

---

# What you have actually gained so far

The important change is that these expensive services are no longer configured to start automatically:

```text
Docker
containerd
NetworkManager-wait-online
CUPS
ModemManager
Proton VPN
AppArmor
Cronie
MEGA rclone mount
Google Drive rclone mount
OneDrive rclone mount
MPD
```

However, **your current boot measurement has not changed yet**:

```text
1min 40.291s
```

And the critical chain now has something interesting:

```text
graphical.target
└─ multi-user.target
   └─ sshd.service
      └─ network.target
         └─ wpa_supplicant
            └─ ...
```

Docker is no longer on the critical chain, and `NetworkManager-wait-online` is no longer on it.

But **sshd is now on the critical chain** because it is still enabled.

So if you don't need incoming SSH connections, disabling SSH is the next easy change:

```bash
sudo systemctl disable --now sshd.service
```

That also removes this:

```text
sshd.service @47.220s +285ms
```

from the boot chain.

## And there's a bigger issue

The biggest remaining delays are:

```text
home.mount                 16.628s
systemd-journal-flush      16.519s
ldconfig                    9.105s
```

Those aren't ordinary unnecessary services we should randomly disable.

Especially:

```text
home.mount
systemd-journal-flush
ldconfig
```

need to be investigated rather than disabled.

Your **16.6-second `/home` mount** is particularly interesting because we already established that `/home` is your Btrfs filesystem on the 5400-RPM HDD. That's likely a separate storage/Btrfs issue rather than an unnecessary service.

### My recommendation for the next step

First stop the things that are **still running despite being disabled**:

```bash
sudo systemctl stop docker.service
sudo systemctl stop containerd.service
```

Then, if you don't need incoming SSH:

```bash
sudo systemctl disable --now sshd.service
```

Then reboot and run:

```bash
systemd-analyze
systemd-analyze blame | head -30
systemd-analyze critical-chain
```

That will give us a clean measurement of what your changes actually achieved.
