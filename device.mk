#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 ReTWRPdtgen contributors
#
# SPDX-License-Identifier: Apache-2.0
#
LOCAL_PATH := device/google/stallion

PRODUCT_USE_DYNAMIC_PARTITIONS := true
# Recovery-only services discovered in the stock ramdisk
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/root/android.hardware.boot-service.default_recovery-pixel.rc:$(TARGET_COPY_OUT_RECOVERY)/root/android.hardware.boot-service.default_recovery-pixel.rc \
    $(LOCAL_PATH)/recovery/root/android.hardware.health-service.zumapro_recovery.rc:$(TARGET_COPY_OUT_RECOVERY)/root/android.hardware.health-service.zumapro_recovery.rc \
    $(LOCAL_PATH)/recovery/root/init.recovery.stallion.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.stallion.rc \
    $(LOCAL_PATH)/recovery/root/init.recovery.zuma.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.zuma.rc \
    $(LOCAL_PATH)/recovery/root/init.recovery.zumapro.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.zumapro.rc \
    $(LOCAL_PATH)/recovery/root/servicemanager.recovery.rc:$(TARGET_COPY_OUT_RECOVERY)/root/servicemanager.recovery.rc \
    $(LOCAL_PATH)/recovery/root/ueventd.rc:$(TARGET_COPY_OUT_RECOVERY)/root/ueventd.rc
