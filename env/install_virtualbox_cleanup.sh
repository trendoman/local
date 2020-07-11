#! /bin/bash

# https://askubuntu.com/questions/900118/vboxdrv-sh-failed-modprobe-vboxdrv-failed-please-use-dmesg-to-find-out-why

# Using a signing utility shippped with the kernel build files, sign all the VirtualBox modules using the private MOK key generated earlier. 
# Put this in a small script /root/module-signing/sign-vbox-modules, so it can be easily run when new kernels are installed as part of regular updates.
# You will need to run the signing script every time a new kernel update is installed, since this will cause a rebuild of the third party VirtualBox 
# modules. Use the script only after the new kernel has been booted, since it relies on modinfo -n and uname -r to tell which kernel version to sign for.

sudo -i
cd /root/module-signing/

# chmod 700 /root/module-signing/sign-vbox-modules
for modfile in $(dirname $(modinfo -n vboxdrv))/*.ko; do
  echo "Signing $modfile"
  /usr/src/linux-headers-$(uname -r)/scripts/sign-file sha256 \
                                /root/module-signing/MOK.priv \
                                /root/module-signing/MOK.der "$modfile"
done

modprobe vboxdrv

