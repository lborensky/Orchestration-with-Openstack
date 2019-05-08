#!/bin/bash
echo "LC_ALL=en_US.UTF-8" >> /etc/environment

echo "Installation (start: $(date +%d-%m-%Y:%H:%M:%S)) VM de Services OCB" > /tmp/BeginInstallBootVM.out

# mount volume & config system
VolumeDevice=$DataVolumeDevice
VolumeMount=$DataVolumeMount

mkfs -t ext4 $VolumeDevice
mkdir -p $VolumeMount
mount $VolumeDevice $VolumeMount
echo "$VolumeDevice    $VolumeMount    ext4    defaults    0     0" >> /etc/fstab

echo "Installation (stop: $(date +%d-%m-%Y:%H:%M:%S)) VM de Services OCB" >> /tmp/BeginInstallBootVM.out
