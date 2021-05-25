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

arch-chroot /mnt
pacman -S nano grub networkmanager
ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
hwclock --systohc
locale-gen
nano /etc/hostname 
nano /etc/hosts

mkinitcpio -P
clear
passwd

grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

exit
reboot
