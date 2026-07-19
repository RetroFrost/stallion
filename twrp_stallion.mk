#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 ReTWRPdtgen contributors
#
# SPDX-License-Identifier: Apache-2.0
#
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
$(call inherit-product, vendor/twrp/config/common.mk)
$(call inherit-product, device/google/stallion/device.mk)

PRODUCT_DEVICE := stallion
PRODUCT_NAME := twrp_stallion
PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel 10a
PRODUCT_MANUFACTURER := google
BUILD_FINGERPRINT := google/stallion_beta/stallion:17/CP21.260330.011/15499021:user/release-keys
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="stallion_beta-user 17 CP21.260330.011 15499021 release-keys"
