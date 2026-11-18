# Install llamacpp on Proxmox 9 with GPU passthrough to LXC 

Created: 2026/11  
Tested on:  pve-manager/9.2.26/41a0e2e09b9e6f9d (running kernel: 7.0.14-28-pve) Used software:  
- NVIDIA driver: 620.70.06
- CUDA toolkit: 13.2


> [!CAUTION]
> The NVIDIA driver and CUDA toolkit versions should be same on both the PVE host and the LXC container.

## Install the libraries

```bash
./01_install_libraries_proxmox.sh
```
## The CUDA toolkit

```bash
./02_install_cuda_toolkit.sh
```
Check the installed versions.  

```bash
nvcc --version
```
```bash
nvcc: NVIDIA (R) Cuda compiler driver
Copyright (c) 2005-2026 NVIDIA Corporation
Built on Fri_May_08_10:53:34_AM_PDT_2026
Cuda compilation tools, release 13.2, V13.2.86
Build cuda_13.2.r13.2/compiler.37953736_0
```  

```bash
nvidia-smi
```
```bash
Wed Nov 18 07:26:21 2026       
+-----------------------------------------------------------------------------------------+
| NVIDIA-SMI 620.70.06              KMD Version: 620.70.06     CUDA UMD Version: 13.5     |
+-----------------------------------------+------------------------+----------------------+
| GPU  Name                 Persistence-M | Bus-Id          Disp.A | Volatile Uncorr. ECC |
| Fan  Temp   Perf          Pwr:Usage/Cap |           Memory-Usage | GPU-Util  Compute M. |
|                                         |                        |               MIG M. |
|=========================================+========================+======================|
|   0  NVIDIA GeForce RTX 3060        Off |   00000000:01:00.0 Off |                  N/A |
|  0%   44C    P8             13W /  170W |       1MiB /  12288MiB |      0%      Default |
|                                         |                        |                  N/A |
+-----------------------------------------+------------------------+----------------------+

+-----------------------------------------------------------------------------------------+
| Processes:                                                                              |
|  GPU   GI   CI              PID   Type   Process name                        GPU Memory |
|        ID   ID                                                               Usage      |
|=========================================================================================|
|  No running processes found                                                             |
+-----------------------------------------------------------------------------------------+
```  


NVIDIA developer documentation [install instructions](https://developer.nvidia.com/cuda-13-2-2-download-archive?target_os=Linux&target_arch=x86_64&Distribution=Debian&target_version=13&target_type=deb_network).


## Create LXC container

- CPU: 4(/6) cores of Ryzen 5 5600G
- RAM: 16384 MiB
- Storage: 40 GB 
