#!/bin/bash

pacman -S nano grub networkmanager
ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
hwclock --systohc

echo 'pt_BR.UTF-8 UTF-8' >> /etc/locale.gen
locale-gen

echo 'LANG=pt_BR.UTF-8' > /etc/locale.conf
echo 'KEYMAP=br-abnt2' > /etc/vconsole.conf

echo 'arch' > /etc/hostname
echo '127.0.0.1	    localhost.localdomain   localhost' >> /etc/hosts
echo '::1    localhost.localdomain   localhost' >> /etc/hosts
echo '127.0.0.1	    arch.localdomain   arch' >> /etc/hosts

mkinitcpio -P
clear
passwd

grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager