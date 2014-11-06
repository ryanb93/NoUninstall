ARCHS = armv7 arm64
TARGET = iphone:8.1

include theos/makefiles/common.mk

BUNDLE_NAME = NoUninstall
NoUninstall_FILES = NoUninstallListController.mm
NoUninstall_INSTALL_PATH = /Library/PreferenceBundles
NoUninstall_FRAMEWORKS = UIKit
NoUninstall_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/NoUninstall.plist$(ECHO_END)
