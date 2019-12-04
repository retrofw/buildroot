################################################################################
#
# parted
#
################################################################################

FATRESIZE_VERSION = 1.0.2
FATRESIZE_SOURCE = fatresize-$(FATRESIZE_VERSION).tar.bz2
FATRESIZE_SITE = https://ufpr.dl.sourceforge.net/project/fatresize/fatresize/$(FATRESIZE_VERSION)
FATRESIZE_DEPENDENCIES = host-pkgconf util-linux
FATRESIZE_INSTALL_STAGING = YES
FATRESIZE_INSTALL_TARGET = YES
# For uclinux patch
# FATRESIZE_AUTORECONF = YES
# FATRESIZE_GETTEXTIZE = YES
FATRESIZE_LICENSE = GPLv3+
FATRESIZE_LICENSE_FILES = COPYING

# ifeq ($(BR2_PACKAGE_READLINE),y)
FATRESIZE_DEPENDENCIES += parted
# FATRESIZE_CONF_OPTS += --with-readline
# else
# FATRESIZE_CONF_OPTS += --without-readline
# endif

# ifeq ($(BR2_PACKAGE_LVM2),y)
# FATRESIZE_DEPENDENCIES += lvm2
# FATRESIZE_CONF_OPTS += --enable-device-mapper
# else
FATRESIZE_CONF_OPTS += --disable-device-mapper
FATRESIZE_CONF_OPTS += --disable-nls

# endif

# ifeq ($(BR2_STATIC_LIBS),y)
# FATRESIZE_CONF_OPTS += --disable-dynamic-loading
# endif

# HOST_FATRESIZE_DEPENDENCIES = host-pkgconf host-util-linux
# HOST_FATRESIZE_CONF_OPTS += \
# 	--without-readline \
# 	--disable-device-mapper \

$(eval $(autotools-package))

