# Installation de ArchLinux VM VMWare

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
