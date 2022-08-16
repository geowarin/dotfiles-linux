#!/usr/bin/env -S bash -e

kernel=$1

if [ -z "$1" ]; then 
    echo "Please pass a kernel as the first argument to $0"
    exit 1
fi

sed -i '/^MODULES=/ s/.$/ nvidia nvidia_modeset nvidia_uvm nvidia_drm)/;s/( /(/' /etc/mkinitcpio.conf
sed -i '/GRUB_CMDLINE_LINUX_DEFAULT=/ s/.$/ nvidia-drm.modeset=1"/;s/" /"/' /etc/default/grub

case $kernel in
'linux' ) 
    package="nvidia"
    ;;
'linux-lts' ) 
    package="nvidia-lts"
    ;;
* ) 
    package="nvidia-dkms"
    ;;
esac


# Understand the nivia hook
# Man: https://man.archlinux.org/man/alpm-hooks.5
# When there is an nvidia update *without* a linux update => Update initramfs
# Trigger: when nvidia OR kernel gets updated
# Action: reading the pkg list as stdin, if we find a linux update, do nothing, otherwise => mkinitcpio
# This avoids rebuild twice, as linux updates will automatically trigger mkinitcpio

if [ ! -d /etc/pacman.d/hooks ]; then
    mkdir /etc/pacman.d/hooks
fi

tee "/etc/pacman.d/hooks/nvidia-${kernel}.hook" <<EOF
[Trigger]
Operation=Install
Operation=Upgrade
Operation=Remove
Type=Package
Target=$package
Target=$kernel

[Action]
Description=Update Nvidia module in initcpio
Depends=mkinitcpio
When=PostTransaction
NeedsTargets
Exec=/bin/sh -c 'while read -r trg; do case \$trg in $kernel) exit 0; esac; done; /usr/bin/mkinitcpio -p $kernel'
EOF

pacman -S -q --noconfirm "$package" nvidia-settings

# IDK LOL: https://github.com/HansKristian-Work/vkd3d-proton/issues/711#issuecomment-867000702
tee "/etc/udev/rules.d/70-nvidia.rules" <<EOF
ACTION=="add", DEVPATH=="/bus/pci/drivers/nvidia", RUN+="/usr/bin/nvidia-modprobe -c0 -u"
EOF

# cat > ~/.xprofile <<EOF
# # loads .nvidia-settings-rc
# nvidia-settings --load-config-only
# EOF