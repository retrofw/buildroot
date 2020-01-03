#############################################################
#
# libopk
#
#############################################################
LIBOPK_VERSION = 540699a
LIBOPK_SITE = $(call github,retrofw,libopk,$(LIBOPK_VERSION))
LIBOPK_DEPENDENCIES = libini zlib
LIBOPK_INSTALL_STAGING = YES

$(eval $(cmake-package))
