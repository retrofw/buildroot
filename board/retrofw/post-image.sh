#!/bin/sh

[ -z "$LCD" ] && exit;

title() {
	echo -e "\e[1;32m $1 \e[0m "
}

BOARD_DIR="$(dirname $0)"
BOARD_NAME="$(basename ${BOARD_DIR})"
GENIMAGE_CFG="${BOARD_DIR}/genimage-${BOARD_NAME}.cfg"
GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"

rm -rf "${GENIMAGE_TMP}"

if [ -z "$RETROFW_VERSION" ]; then
	RETROFW_VERSION="latest/download"
else
	RETROFW_VERSION="download/${RETROFW_VERSION}"
fi

title "Building RetroFW image..."

wget -q --show-progress -N -P "${BINARIES_DIR}/" \
https://github.com/retrofw/retrofw/releases/${RETROFW_VERSION}/RetroFW_${LCD}_U-Boot.bin \
https://github.com/retrofw/retrofw/releases/${RETROFW_VERSION}/RetroFW_${LCD}_uImage.bin

cp "${BINARIES_DIR}/RetroFW_${LCD}_U-Boot.bin" "${BINARIES_DIR}/u-boot.bin"
cp "${BINARIES_DIR}/RetroFW_${LCD}_uImage.bin" "${BINARIES_DIR}/uImage.bin"

touch "${BINARIES_DIR}/.prsz" "${BINARIES_DIR}/.fsck" "${BINARIES_DIR}/.defl"

genimage                           \
	--rootpath "${TARGET_DIR}"     \
	--tmppath "${GENIMAGE_TMP}"    \
	--inputpath "${BINARIES_DIR}"  \
	--outputpath "${BINARIES_DIR}" \
	--config "${GENIMAGE_CFG}"

rm "${BINARIES_DIR}/.prsz" "${BINARIES_DIR}/.fsck" "${BINARIES_DIR}/.defl"

title "Zipping image file"
rm -f ${BINARIES_DIR}/RetroFW_${LCD}.zip
zip -j ${BINARIES_DIR}/RetroFW_${LCD}.zip ${BINARIES_DIR}/RetroFW.img
