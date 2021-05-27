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
pacstrap /mnt base base-devel linux linux-firmware
genfstab -U /mnt >> /mnt/etc/fstab

wget https://raw.githubusercontent.com/robalozo/teste/main/arch2.sh
mv arch2.sh /mnt

arch-chroot /mnt bash arch2.sh
