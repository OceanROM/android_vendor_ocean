# Inherit common ocean stuff
$(call inherit-product, vendor/ocean/config/common.mk)

# Inherit ocean car device tree
$(call inherit-product, device/ocean/car/ocean_car.mk)

# Inherit the main AOSP car makefile that turns this into an Automotive build
$(call inherit-product, packages/services/Car/car_product/build/car.mk)
