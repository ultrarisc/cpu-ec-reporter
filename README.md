# cpu-ec-reporter – What Is It?


**cpu-ec-reporter** is a custom application tool provided by the manufacturer:

- Use systemd service to periodically obtain CPU temperature information and
send it to EC
- Use systemd services to send system suspend and wake-up statuses
- Set the LED lights of the RTL8211F network card.

See https://github.com/ultrarisc/cpu-ec-reporter/blob/main/debian/README.Debian for a more detailed description of this project.

---

## Getting Help (Other Sources)

* **🐛 GitHub Issues:** [Open an issue](https://github.com/ultrarisc/cpu-ec-reporter/issues)

---


## Installation


### Build Environment Requirements
* `debhelper-compat`

### Build Instructions

```bash
dpkg-buildpackage -b -us -uc
```

---
