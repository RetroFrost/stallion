#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 ReTWRPdtgen contributors
#
# SPDX-License-Identifier: Apache-2.0
#
DEVICE_PATH := device/google/stallion

ALLOW_MISSING_DEPENDENCIES := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_VARIANT := cortex-a55

# Bootloader / platform
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := stallion
TARGET_BOARD_PLATFORM := zumapro

# A/B OTA
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    boot \
    init_boot \
    vbmeta \
    vendor_boot \
    vendor_kernel_boot
# Boot image format
BOARD_BOOT_HEADER_VERSION := 4
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_KERNEL_CMDLINE := dyndbg="func alloc_contig_dump_pages +p" earlycon=exynos4210,0x10870000 console=ttySAC0,115200 androidboot.console=ttySAC0 printk.devkmsg=on cma_sysfs.experimental=Y cgroup.memory=nokmem rcupdate.rcu_expedited=1 rcu_nocbs=all rcutree.enable_rcu_lazy swiotlb=noforce disable_dma32=on sysctl.kernel.sched_pelt_multiplier=4 rodata=on kasan=off at24.write_timeout=100 log_buf_len=1024K android_arch_task_struct_size=512 bootconfig
BOARD_BOOTCONFIG += \
    androidboot.boot_devices=13200000.ufs
BOARD_RAMDISK_USE_LZ4 := true
BOARD_INIT_BOOT_HEADER_VERSION := 4
BOARD_MKBOOTIMG_INIT_ARGS += --header_version $(BOARD_INIT_BOOT_HEADER_VERSION)

# GKI: recovery resources belong in vendor_boot, not in boot.img.
BOARD_USES_GENERIC_KERNEL_IMAGE := true
BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT := true
BOARD_MOVE_GSI_AVB_KEYS_TO_VENDOR_BOOT := true
BOARD_BUILD_VENDOR_RAMDISK_IMAGE := true
BOARD_EXCLUDE_KERNEL_FROM_RECOVERY_IMAGE := true
BOARD_INCLUDE_RECOVERY_RAMDISK_IN_VENDOR_BOOT := true

# Stock prebuilts extracted from the supplied images
BOARD_PREBUILT_BOOTIMAGE := $(DEVICE_PATH)/prebuilt/boot.img
TARGET_NO_KERNEL := true
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_PREBUILT_DTBIMAGE_DIR := $(DEVICE_PATH)/prebuilt/dtb

# Sizes are taken only from supplied images. Verify them against factory data.
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_VENDOR_KERNEL_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_INIT_BOOT_IMAGE_PARTITION_SIZE := 8388608
BOARD_FLASH_BLOCK_SIZE := 4096

# Modules retained from modern vendor/vendor_kernel ramdisk fragments
BOARD_VENDOR_KERNEL_RAMDISK_KERNEL_MODULES := $(wildcard $(DEVICE_PATH)/prebuilt/modules/*.ko)
BOARD_VENDOR_KERNEL_RAMDISK_KERNEL_MODULES_LOAD := $(file < $(DEVICE_PATH)/prebuilt/modules/modules.load)

# Partitions and recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery.fstab
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
PRODUCT_USE_DYNAMIC_PARTITIONS := true
# Deliberately no guessed BOARD_SUPER_PARTITION_SIZE. Copy the real values from
# the factory package's misc_info.txt or a maintained device tree.
BOARD_USES_METADATA_PARTITION := true
TARGET_SCREEN_DENSITY := 420

# Android Verified Boot 2.0
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
VENDOR_SECURITY_PATCH := 2026-05-05

# TWRP
TW_THEME := portrait_hdpi
TW_EXTRA_LANGUAGES := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_INCLUDE_REPACKTOOLS := true
