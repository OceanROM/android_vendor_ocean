# Inherit common ocean stuff
$(call inherit-product, vendor/ocean/config/common.mk)

# Inherit ocean atv device tree
$(call inherit-product, device/ocean/atv/ocean_atv.mk)

# AOSP packages
PRODUCT_PACKAGES += \
    LeanbackIME

# ocean packages
PRODUCT_PACKAGES += \
    oceanCustomizer

PRODUCT_PACKAGE_OVERLAYS += vendor/ocean/overlay/tv
