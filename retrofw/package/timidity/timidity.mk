################################################################################
#
# timidity
#
################################################################################

TIMIDITY_VERSION = master
TIMIDITY_SITE = $(call github,retrofw,timidity,$(TIMIDITY_VERSION))
TIMIDITY_INSTALL_TARGET = YES

define TIMIDITY_INSTALL_TARGET_CMDS 
	rm -rf $(TARGET_DIR)/usr/local/lib/timidity/;
	mkdir -p $(TARGET_DIR)/usr/local/lib/timidity/;
	cp -r $(@D)/instruments $(@D)/copyright.txt $(@D)/README $(@D)/timidity.cfg $(TARGET_DIR)/usr/local/lib/timidity/;
endef

$(eval $(generic-package))
