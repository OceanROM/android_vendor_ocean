# Build fingerprint
ifneq ($(BUILD_FINGERPRINT),)
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)
endif

# oceanOS System Version
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.ocean.version=$(ocean_VERSION) \
    ro.ocean.releasetype=$(ocean_BUILDTYPE) \
    ro.ocean.build.version=$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR) \
    ro.modversion=$(ocean_VERSION) \
    ro.oceanlegal.url=https://oceanos.org/legal

# oceanOS Platform Display Version
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.ocean.display.version=$(ocean_DISPLAY_VERSION)

# oceanOS Platform SDK Version
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.ocean.build.version.plat.sdk=$(ocean_PLATFORM_SDK_VERSION)

# oceanOS Platform Internal Version
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.ocean.build.version.plat.rev=$(ocean_PLATFORM_REV)
