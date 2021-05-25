#!/bin/bash
loadkeys br-abnt2
timedatectl set-ntp true
mkfs.ext4 /dev/sda2
mount /dev/sda2 /mnt  
pacstrap /mnt base linux linux-firmware
genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt
ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
hwclock --systohc
locale-gen
