ARCHS = armv7 arm64
TARGET = iphone:8.1

include theos/makefiles/common.mk

TWEAK_NAME = NoUninstall
NoUninstall_FILES = NoUninstall.xm
NoUninstall_FRAMEWORKS = Foundation

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += nouninstall
include $(THEOS_MAKE_PATH)/aggregate.mk

after-install::
	install.exec "killall -9 SpringBoard"

