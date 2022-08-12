# Inherit mini common ocean stuff
$(call inherit-product, vendor/ocean/config/common_mini.mk)

# Required packages
PRODUCT_PACKAGES += \
    androidx.window.extensions \
    LatinIME

$(call inherit-product, vendor/ocean/config/telephony.mk)
