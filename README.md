# cpu-ec-reporter

cpu-ec-reporter is a lightweight Linux utility set used to:

- Periodically read CPU temperature and report it to the EC over serial
- Report suspend/resume state changes to the EC
- Initialize RTL8211F NIC LED trigger behavior

The project is distributed as a Debian package, with runtime logic implemented by shell scripts and systemd units.

## Directory Layout

- `scripts/`: runtime scripts (installed to `/usr/bin`)
- `systemd/`: systemd service/timer units (installed to `/lib/systemd/system`)
- `sleep-hooks/`: systemd-sleep hook script (installed to `/usr/lib/systemd/system-sleep`)
- `debian/`: Debian packaging metadata and rules

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
