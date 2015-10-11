TARGET = iphone::8.4
ARCHS = armv7 armv7s arm64

include theos/makefiles/common.mk

THEOS_PACKAGE_DIR=./debs

TWEAK_NAME = TrackingBlocker
TrackingBlocker_FILES = TrackingBlocker.xm

include $(THEOS_MAKE_PATH)/tweak.mk

clean::
	rm -f $(THEOS_PACKAGE_DIR)/*.deb
