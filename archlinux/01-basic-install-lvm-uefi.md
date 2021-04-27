# Installation de Arch Linux

## Introduction

### Objectif de la documentation

Cette documentation à pour but de décrire le procéder d'installation d'une distribution Arch Linux

### Sources

Pour réaliser cette documentation à été utilisé les sources suivantes :
* [La documentation de Arch Linux](https://wiki.archlinux.org/index.php/Installation_guide)
* [Les documentations précédentes de mon repo](https://github.com/wolfgit53/custom/edit/master/archlinux/)
* [Le guide de Frederic Bezies](https://github.com/FredBezies/arch-tuto-installation/blob/master/install.md)

### Matériel

L'installation va se faire sur une machine virtuelle, mais sera au final utilisé pour une installation sur la config suivante:
* CPU Ryzen 5 5600x
* 32GB de RAM
* 1 SSD nvme de 500GB
* 1 HDD de 1T
* 1 RTX 3070

### Partitionnement

1 SSD et 1 HDD vont être utilisés pour installer le système Arch Linux.
Le SSD est pour le système, et le HDD les données.
Or un SSD à parfois une durée de vie limité, c'est pourquoi une partie du système sera sur le HDD.


## Installation

Passer la disposition du clavier en azerty:
```bash
loadkeys fr
```

Mise à jour de la date et de l'heure:
```bash
timedatectl status
timedatectl set-timezone Europe/Paris
timedatectl set-ntp true
timedatectl status
```

Vérifier l'existence du dossier suivant pour s'assurer d'avoir une carte en UEFI:
```bash
ls /sys/firmware/efi/efivars
```

Désactiver ipv6 si besoin:
```bash
sysctl -w net.ipv6.conf.all.disable_ipv6=1
sysctl -w net.ipv6.conf.default.disable_ipv6=1
systemctl restart systemd-sysctl.service
```

Vérifier de la connectivité:
```bash
ip a
ping archlinux.com
```

Il est venu le temps du partitionemennnnnnnnnnnnt!
```bash
fdisk /dev/nvme0n1
Command: g
Command: n
Partition number (1-128, default 1): 1
First sector (2048-83886046, default 2048): 2048
Last sector: +512M
Command: n
Partition number (2-128, default 2): 2
First sector (1050624-83886046): 1050624
Last sector: [ENTER]

Command: w
```

```bash
mkfs.vfat -F32 /dev/nvme0n1p1
```

```bash
pvcreate /dev/nvme0n1p2
vgcreate vg-sys /dev/nvme0n1p2
lvcreate -L 20G --name ROOT vg-sys
mkfs -t ext4 -L root /dev/vg-sys/ROOT
blockdev --getalignoff /dev/nvme0n1
```
