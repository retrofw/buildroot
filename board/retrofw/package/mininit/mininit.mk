#############################################################
#
# mininit
#
#############################################################

MININIT_VERSION = master
MININIT_SITE = $(call github,retrofw,mininit,$(MININIT_VERSION))

define MININIT_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
endef

define MININIT_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/mininit-syspart $(BINARIES_DIR)/mininit-syspart
endef

$(eval $(generic-package))
