# Installation de ArchLinux VM VMWare

## Sources

Pour la réalisation de cette doc je me suis inspirée de deux documentation:
* La première le wiki de arch linux: [https://wiki.archlinux.org/index.php/Installation_guide#Partition_the_disks](https://wiki.archlinux.org/index.php/Installation_guide#Partition_the_disks)
* La seconde le guide de Frederic Bezies: [https://github.com/FredBezies/arch-tuto-installation/blob/master/install.md](https://github.com/FredBezies/arch-tuto-installation/blob/master/install.md)

## Partie I

Insérer le fichier ISO dans le lecteur CD de la machine virtuelle. Au premier menu, taper sur **[ENTRER]** pour choisir le premier choix : `Arch Linux install medium (x86_64, BIOS)`. 

### Disposition du clavier

Changer la disposition du clavier avec :
```none
loadkeys fr
````

### Réseau

Vérifier la connection à internet :
```none
ip a
ping archlinux.org
```

### Date et heure

Activer l'update de l'heure via NTP :
```none
timedatectl set-ntp true
```

Changer la zone de temps :
```
timedatectl set-timezone Europe/Paris
timedatectl status
```

### Partitionnement des disques

#### Via cfdisk

Lancer l'utilitaire cfdisk :
```none
cfdisk
```

Choisir le label `dos` pour le type à appliquer :
```none
 ┌─Select_label_type───┐
 │ gpt                 │
 │ dos ◄──────────     │
 │ sgi                 │
 │ sun                 │
 └─────────────────────┘
```

Réaliser le partionnement souhaité, en voici un exemple :
```none
Device      Boot  Start  End  Sectors  Size  Id Type
/dev/sda1   *                          512M  83 Linux
/dev/sda2                                1G  82 Linux swap / Solaris
/dev/sda3                               20G  83 Linux
/dev/sda4                             18.5G  83 Linux
```

#### Via fdisk

Lancer fdisk :
```none
fdisk /dev/sda
```

Puis réaliser le partitionement comme dans la section précédente :
```
Command : o
Created a new DOS disklabel with disk identifier 0xXXXXXXXX

Command : n
Partition type
 p primary (0 primary, 0 extended, 4 free)
 e extended (container for logical partitions)
Select (default p): p
Partition number (1-4, default 1): 1
First sector (2048-83886076, default 2048): 2048
Last sector, +/-sectors or +/-size{K,M,G,T,P} (2048-83886079, default 83886079): +512M

Created a new partition 1 of type 'Linux' and of size 512MiB.

Command : a
Selected partition 1
The bootable flag on partition 1 is enabled now.

Command : n
Partition type
 p primary (1 primary, 0 extended, 3 free)
 e extended (container for logical partitions)
Select (default p): p
Partition number (2-4, default 2): 2
First sector (1050624-83886076, default 2048):
Last sector, +/-sectors or +/-size{K,M,G,T,P} (1050624-83886079, default 83886079): +1G

Created a new partition 2 of type 'Linux' and of size 1GiB.

Command : t
Partition number (1,2, default 2): 2
Hex code or alias (type L to list all): L
Hex code or alias (type L to list all): 82

Changed type of partition 'Linux' to 'Linux swap / Solaris'.

Command : n
Partition type
 p primary (2 primary, 0 extended, 2 free)
 e extended (container for logical partitions)
Select (default p): p
Partition number (3-4, default 3): 3
First sector (3147776-83886076, default 3147776):
Last sector, +/-sectors or +/-size{K,M,G,T,P} (3147776-83886079, default 83886079): +20G

Created a new partition 3 of type 'Linux' and of size 20GiB.


Command : n
Partition type
 p primary (3 primary, 0 extended, 1 free)
 e extended (container for logical partitions)
Select (default p): p

Selected partition 4
First sector (45090816-83886076, default 45090816):
Last sector, +/-sectors or +/-size{K,M,G,T,P} (45090816-83886079, default 83886079): [ENTRER]

Created a new partition 4 of type 'Linux' and of size 18.5 GiB.

Command : w
The partition table has been altered.
Syncing disks.

root@archiso ~ #
```

Formater les partitions suivante en `ext4`:
```none
mkfs.ext4 /dev/sda1 
mkfs.ext4 /dev/sda3
mkfs.ext4 /dev/sda4
```

Puis formater et activer le swap:
```none
mkswap /dev/sda2
swapon /dev/sda2
```

Montage des différentes partitions:
```none
mount /dev/sda3 /mnt
mkdir /mnt/{boot,home}
mount /dev/sda1 /mnt/boot
mount /dev/sda4 /mnt/home
```

### Installation du système de base

```bash
pacstrap /mnt base linux linux-firmware base-devel pacman-contrib
```

* base apporte les paquets suivant : [base](https://archlinux.org/packages/core/any/base/)
* linux apporte les paquets suivant: [linux](https://archlinux.org/packages/core/x86_64/linux/)

C'est une installation la plus minimaliste donc nous rajouter les paquets qui semble nécessaire. Pour ma part:
```bash
pacstrap /mnt vim zip unzip alsa-utils mtools dosfstools lsb-release exfat-utils bash-completion
pacstrap /mnt man-db man-pages texinfo
pacstrap /mnt grub os-prober
```
VIM et MAN par dessus tout !

### Configuration du système - fstab

Générer le fichier /etc/fstab en fonction des montages déjà réalisé:
```bash
genfstab -U /mnt >> /mnt/etc/fstab
```

### Chroot

Changer sa racine pour se placer dans le nouveau système:
```bash
arch-chroot /mnt
```

### Localtime

```bash
ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime
hwclock --systohc
```

### Localisation

```bash
vim /etc/locale.gen
```

Décommenter `fr_FR.UTF-8 UTF-8` et `en_US.UTF-8 UTF-8`.

Editer le fichier `/etc/locale.conf`:
```none
LANG=fr_FR.UTF-8
LC_COLLATE=C
```

Editer le fichier `/etc/vconsole.conf`:
```none
KEYMAP=fr-latin9
```

Puis taper la commande pour générer les traduction:
```bash
locale-gen
```

### Réseaux

Installer networkmanager:
```bash
pacman -Sy
pacman -S networkmanager netplan
systemctl enable NetworkManager
```

Changer le hostname de la machine:
```bash
vim /etc/hostname

archy
```

Et éditer le fichier /etc/hosts :
```bash
127.0.0.1	localhost
::1		localhost
127.0.1.1	archy.local	archy
```

### Génération de l'image du noyau

Génération de l'image via mkinitcpio:
```bash
mkinitcpio -P
```

### Installer Grub

Installer grub sinon on pourra jamais booter :p
```bash
grub-install --no-floppy --recheck /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
```

### Changer le mot de passe de root

Changer le mot de passe:
```bash
passwd
```

### Reboot

Redémarer:
```bash
exit
umount -R /mnt
reboot
```

## Partie II - Interface Graphique

Création d'un utilisateur:
```bash
useradd -m -c 'Nom complet' -s /bin/bash pseudo
passwd pseudo
```

Installation de xorg et sddm:
```bash
pacman -S xorg sddm
```

Activer le service sddm dés le démarrage:
```bash
systemctl enable sddm
```

Installer plasma-desktop pour juste une interface graphique, sinon c'est plasma mais cela rajoute quelques applications de KDE.
```bash
pacman -S plasma-desktop
```
ou
```bash
pacman -S plasma
```

