################################################################################
#
# recovery
#
################################################################################
RECOVERY_VERSION = master
RECOVERY_SITE = $(call github,retrofw,recovery,$(RECOVERY_VERSION))
RECOVERY_SITE_METHOD = git

RECOVERY_DEPENDENCIES = sdl sdl_image sdl_ttf

define RECOVERY_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
endef

define RECOVERY_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 \
		$(@D)/retrofw \
		$(TARGET_DIR)/usr/bin/retrofw
endef

$(eval $(generic-package))
