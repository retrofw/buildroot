#!/bin/sh

mnt=/media

root=$(basename $(readlink -f /dev/root | head -c -2))
ln -sf ${root}3 /dev/home
ln -sf mmcblk$(( $(readlink -f /dev/root | head -c -3 |  tail -c 1) ^ 1 )) /dev/sdcard

mdev_umount()
{
	if grep -qs "${mnt}/$1 " /proc/mounts ; then
		umount -fl "${mnt}/$1";
		rmdir "${mnt}/$1";
	fi
}

mdev_mount()
{
	if [ "$1" == "${root}1" ] || [ "$1" == "${root}2" ] || [ "$1" == "${root}3" ] || grep -q "${mnt}/$1 " /proc/mounts ; then
		# Already mounted
		exit 0
	fi

	mkdir -p "${mnt}/$1" || exit 1

	if ! mount -t auto -o noatime,check=r,shortname=lower,utf8=true "/dev/$1" "${mnt}/$1"; then
		if ! mount -t auto -o noatime "/dev/$1" "${mnt}/$1"; then
			rmdir "${mnt}/$1"
			exit 1
		fi
	fi
}

case "${ACTION}" in
add|"")
	mdev_umount ${MDEV}
	mdev_mount ${MDEV}
	;;
remove)
	mdev_umount ${MDEV}
	;;
esac
