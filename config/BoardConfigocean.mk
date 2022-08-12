include vendor/ocean/config/BoardConfigKernel.mk

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/ocean/config/BoardConfigQcom.mk
endif

include vendor/ocean/config/BoardConfigSoong.mk
