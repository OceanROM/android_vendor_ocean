# Inherit full common ocean stuff
$(call inherit-product, vendor/ocean/config/common_full.mk)

# Required packages
PRODUCT_PACKAGES += \
    androidx.window.extensions \
    LatinIME

# Include ocean LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/ocean/overlay/dictionaries
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/ocean/overlay/dictionaries
