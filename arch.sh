#!/bin/bash
loadkeys br-abnt2
timedatectl set-ntp true
(
    echo n
    echo p
    echo 1
    echo 2048
    echo 62914559
    echo w
) | fdisk /dev/sda

mkfs.ext4 /dev/sda1
mount /dev/sda1 /mnt  
pacstrap /mnt base linux linux-firmware
genfstab -U /mnt >> /mnt/etc/fstab
cp arch.sh /mnt

arch-chroot /mnt ./arch.sh
pacman -S nano grub networkmanager
ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
hwclock --systohc
locale-gen
echo 'arch' > /etc/hostname
echo '127.0.0.1	    localhost.localdomain   localhost' >> /etc/hosts
echo '::1    localhost.localdomain   localhost' >> /etc/hosts
echo '127.0.0.1	    arch.localdomain   arch' >> /etc/hosts

mkinitcpio -P
clear
passwd

grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

