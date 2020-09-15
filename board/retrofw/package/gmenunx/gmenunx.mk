################################################################################
#
# gmenunx
#
################################################################################
GMENUNX_VERSION = master
GMENUNX_SITE = $(call github,pingflood,gmenunx,$(GMENUNX_VERSION))
GMENUNX_SITE_METHOD = git

GMENUNX_DEPENDENCIES = sdl sdl_image sdl_ttf

define GMENUNX_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) dist -C $(@D)
endef

define GMENUNX_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/gmenunx
	cp -r \
		$(@D)/dist/retrofw/skins \
		$(@D)/dist/retrofw/translations \
		$(@D)/dist/retrofw/about.txt \
		$(@D)/dist/retrofw/COPYING \
		$(@D)/dist/retrofw/input.conf \
		$(TARGET_DIR)/usr/share/gmenunx
	$(INSTALL) -D -m 0755 \
		$(@D)/dist/retrofw/gmenunx \
		$(TARGET_DIR)/usr/bin/gmenunx
endef

$(eval $(generic-package))
