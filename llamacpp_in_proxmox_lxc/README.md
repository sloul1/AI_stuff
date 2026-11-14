# Install llamacpp on Proxmox 9

Created: 2026/11
Tested on: pve-manager/9.2.26/41a0e2e09b9e6f9d (running kernel: 7.0.14-28-pve)

## Install the libraries

```bash
install_libraries_proxmox.sh
```
## The CUDA toolkit

> [!CAUTION]
> The CUDA toolkit version should be same on the PVE host and the LXC container