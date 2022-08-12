PRODUCT_VERSION_MAJOR = 19
PRODUCT_VERSION_MINOR = 1

ifeq ($(ocean_VERSION_APPEND_TIME_OF_DAY),true)
    ocean_BUILD_DATE := $(shell date -u +%Y%m%d_%H%M%S)
else
    ocean_BUILD_DATE := $(shell date -u +%Y%m%d)
endif

# Set ocean_BUILDTYPE from the env RELEASE_TYPE, for jenkins compat

ifndef ocean_BUILDTYPE
    ifdef RELEASE_TYPE
        # Starting with "ocean_" is optional
        RELEASE_TYPE := $(shell echo $(RELEASE_TYPE) | sed -e 's|^ocean_||g')
        ocean_BUILDTYPE := $(RELEASE_TYPE)
    endif
endif

# Filter out random types, so it'll reset to UNOFFICIAL
ifeq ($(filter RELEASE NIGHTLY SNAPSHOT EXPERIMENTAL,$(ocean_BUILDTYPE)),)
    ocean_BUILDTYPE := UNOFFICIAL
    ocean_EXTRAVERSION :=
endif

ifeq ($(ocean_BUILDTYPE), UNOFFICIAL)
    ifneq ($(TARGET_UNOFFICIAL_BUILD_ID),)
        ocean_EXTRAVERSION := -$(TARGET_UNOFFICIAL_BUILD_ID)
    endif
endif

ocean_VERSION_SUFFIX := $(ocean_BUILD_DATE)-$(ocean_BUILDTYPE)$(ocean_EXTRAVERSION)-$(ocean_BUILD)

# Internal version
ocean_VERSION := $(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(ocean_VERSION_SUFFIX)

# Display version
ocean_DISPLAY_VERSION := $(PRODUCT_VERSION_MAJOR)-$(ocean_VERSION_SUFFIX)
