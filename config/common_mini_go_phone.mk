# Set ocean specific identifier for Android Go enabled products
PRODUCT_TYPE := go

# Inherit mini common ocean stuff
$(call inherit-product, vendor/ocean/config/common_mini_phone.mk)
