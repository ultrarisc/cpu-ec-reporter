# cpu-ec-reporter

cpu-ec-reporter is a lightweight Linux utility set used to:

- Periodically read CPU temperature and report it to the EC over serial
- Report suspend/resume state changes to the EC
- Initialize RTL8211F NIC LED trigger behavior
- Remove the ttyS1 console argument from GRUB during package installation or upgrade

The project is distributed as a Debian package, with runtime logic implemented by shell scripts and systemd units.

## Directory Layout

- `scripts/`: runtime scripts (installed to `/usr/bin`) and the GRUB cleanup script (installed to `/usr/lib/cpu-ec-reporter`)
- `systemd/`: systemd service/timer units (installed to `/lib/systemd/system`)
- `sleep-hooks/`: systemd-sleep hook script (installed to `/usr/lib/systemd/system-sleep`)
- `debian/`: Debian packaging metadata and rules

## ttyS1 Console Cleanup

During package installation or upgrade, `debian/postinst` runs
`/usr/lib/cpu-ec-reporter/remove_ttys1_console.sh` in the configure stage.
The script checks `GRUB_CMDLINE_LINUX` in `/etc/default/grub` for the exact
argument `console=ttyS1,115200n8`. If present, it removes the argument and runs
`update-grub`. If absent, it leaves the file unchanged and skips `update-grub`.

Reboot for the updated kernel command line to take effect.

## Build Debian Package

Minimum build dependency:

- `debhelper-compat (= 13)`

Build command:

```bash
dpkg-buildpackage -b -us -uc
```

For more Debian-specific details, see `debian/README.Debian`.

## License

This project is licensed under Apache-2.0.
See `LICENSE` and `debian/copyright` for details.
