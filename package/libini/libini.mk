#############################################################
#
# libini
#
#############################################################
LIBINI_VERSION = c3413da
LIBINI_SITE = $(call github,retrofw,libini,$(LIBINI_VERSION))
LIBINI_INSTALL_STAGING = YES

$(eval $(cmake-package))
