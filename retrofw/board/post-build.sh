#!/bin/sh
TARGET=$1

mkdir -p "${TARGET}"/home/retrofw "${TARGET}"/boot

rm -rf \
	"${TARGET}"/lost+found \
	"${TARGET}"/etc/init.d/S01syslogd \
	"${TARGET}"/etc/init.d/S02klogd \
	"${TARGET}"/etc/init.d/S20urandom \
	"${TARGET}"/etc/init.d/S80dnsmasq \
	"${TARGET}"/etc/init.d/S50telnet \
	"${TARGET}"/var/lib/opkg \
	"${TARGET}"/run \
	"${TARGET}"/var/lib/opkg \
	"${TARGET}"/root

ln -sf /home/retrofw/.opkg "${TARGET}"/var/lib/opkg
ln -sf /home/retrofw/ "${TARGET}"/root

ln -sf /tmp "${TARGET}"/run
ln -sf /etc/issue "${TARGET}"/etc/issue.net

chmod +x "${TARGET}"/etc/init.d/* "${TARGET}"/usr/bin/retrofw
