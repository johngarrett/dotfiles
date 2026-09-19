# Desktop tools and hardware controls

This is the reference for optional desktop utilities and hardware settings that
are useful on the Arch workstation. These instructions describe how to use the
tools; they are not part of `setup.sh` or the managed package list.

## Mouse DPI

Use Piper to change the DPI profile of a supported gaming mouse:

1. Open **Piper** from the application launcher.
2. Select the mouse.
3. Choose or create a DPI profile and set the desired DPI value.
4. Apply the profile to the mouse. If the mouse has onboard memory, save it to
   the desired hardware profile.

Piper controls the mouse's hardware DPI. A game's sensitivity setting is a
   separate adjustment and does not change the hardware DPI.

If Piper does not detect the mouse, check that the device is supported by
`libratbag` and that its ratbag service is available. Some mice instead require
their own hardware DPI button or vendor-specific utility.

## Crunchy or stuttering audio

Open **PulseAudio Volume Control** (`pavucontrol`) to confirm that the correct
output device and profile are selected. The Waybar audio module opens it when
clicked.

For a quick recovery, restart the user audio services:

```bash
systemctl --user restart pipewire pipewire-pulse wireplumber
```

Inspect the active devices and recent audio errors with:

```bash
wpctl status
journalctl --user -u pipewire -u pipewire-pulse -u wireplumber -n 100 --no-pager
```

If the log repeatedly reports that RTKit or realtime scheduling is unavailable,
install and enable the `rtkit` service. Realtime scheduling helps prevent
audio dropouts when the system is busy. Bluetooth audio may also sound crunchy
when it switches profiles; in `pavucontrol`, prefer the high-quality A2DP
profile when microphone input is not needed.

## Future additions

Add instructions here for other optional desktop utilities and device
management as they are configured.
