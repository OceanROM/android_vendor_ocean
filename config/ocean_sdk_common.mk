# Permissions for ocean sdk services
PRODUCT_COPY_FILES += \
    vendor/ocean/config/permissions/org.oceanos.globalactions.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/org.oceanos.globalactions.xml \
    vendor/ocean/config/permissions/org.oceanos.hardware.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/org.oceanos.hardware.xml \
    vendor/ocean/config/permissions/org.oceanos.livedisplay.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/org.oceanos.livedisplay.xml \
    vendor/ocean/config/permissions/org.oceanos.profiles.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/org.oceanos.profiles.xml \
    vendor/ocean/config/permissions/org.oceanos.settings.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/org.oceanos.settings.xml \
    vendor/ocean/config/permissions/org.oceanos.trust.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/org.oceanos.trust.xml

# ocean Platform Library
PRODUCT_PACKAGES += \
    org.oceanos.platform-res \
    org.oceanos.platform

# AOSP has no support of loading framework resources from /system_ext
# so the SDK has to stay in /system for now
PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    system/framework/oat/%/org.oceanos.platform.odex \
    system/framework/oat/%/org.oceanos.platform.vdex \
    system/framework/org.oceanos.platform-res.apk \
    system/framework/org.oceanos.platform.jar

ifndef ocean_PLATFORM_SDK_VERSION
  # This is the canonical definition of the SDK version, which defines
  # the set of APIs and functionality available in the platform.  It
  # is a single integer that increases monotonically as updates to
  # the SDK are released.  It should only be incremented when the APIs for
  # the new release are frozen (so that developers don't write apps against
  # intermediate builds).
  ocean_PLATFORM_SDK_VERSION := 9
endif

ifndef ocean_PLATFORM_REV
  # For internal SDK revisions that are hotfixed/patched
  # Reset after each ocean_PLATFORM_SDK_VERSION release
  # If you are doing a release and this is NOT 0, you are almost certainly doing it wrong
  ocean_PLATFORM_REV := 0
endif
