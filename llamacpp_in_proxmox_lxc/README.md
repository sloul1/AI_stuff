# Install llamacpp on Proxmox 9 with GPU passthrough to LXC 

Created: 2026/11  
Tested on:  pve-manager/9.2.26/41a0e2e09b9e6f9d (running kernel: 7.0.14-28-pve)  

## Install the libraries

```bash
./01_install_libraries_proxmox.sh
```
## The CUDA toolkit

> [!CAUTION]
> The CUDA toolkit version should be same on the PVE host and the LXC container  

Used software:  
```NVIDIA-SMI 595.99.02```  
```Driver Version: 595.99.02```  
```CUDA Version: 13.2```  


NVIDIA developer documentation [install instructions](https://developer.nvidia.com/cuda-13-2-2-download-archive?target_os=Linux&target_arch=x86_64&Distribution=Debian&target_version=13&target_type=deb_network).

```bash
./02_install_cuda_toolkit.sh
```

## Create LXC container

- CPU: 6(/12) cores of Ryzen 5 5600G
- RAM: 16384 MiB
- Storage: 40 GB 
