ARCHS = armv7 armv7s arm64

TARGET = iphone:clang:latest:5.1.1

include theos/makefiles/common.mk

TWEAK_NAME = NoUninstall
NoUninstall_CFLAGS = -fobjc-arc
NoUninstall_FILES = NoUninstall.xm
NoUninstall_FRAMEWORKS = Foundation

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += nouninstallsettings
include $(THEOS_MAKE_PATH)/aggregate.mk
