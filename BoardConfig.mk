# 
# Copyright (C) 2023 The Android Open Source Project 
# 
# SPDX-License-Identifier: Apache-2.0 
# 

DEVICE_PATH := device/xiaomi/ruby 
PREBUILT_PATH := $(DEVICE_PATH)/prebuilt 

# For building with minimal manifest 
ALLOW_MISSING_DEPENDENCIES := true 

# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    system \
    vendor \
    product \
    boot \
    vbmeta_vendor \
    vbmeta_system
BOARD_USES_RECOVERY_AS_BOOT := true

# Architecture 
TARGET_ARCH := arm64 
TARGET_ARCH_VARIANT := armv8-a 
TARGET_CPU_ABI := arm64-v8a 
TARGET_CPU_ABI2 := 
TARGET_CPU_VARIANT := generic 
TARGET_CPU_VARIANT_RUNTIME := cortex-a55 
TARGET_2ND_ARCH := arm 
TARGET_2ND_ARCH_VARIANT := armv7-a-neon 
TARGET_2ND_CPU_ABI := armeabi-v7a 
TARGET_2ND_CPU_ABI2 := armeabi 
TARGET_2ND_CPU_VARIANT := generic 
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a55 

# Bootloader 
TARGET_BOOTLOADER_BOARD_NAME := ruby 
TARGET_NO_BOOTLOADER := true 

# Kernel 
BOARD_BOOTIMG_HEADER_VERSION := 2 
BOARD_KERNEL_BASE := 0x40078000 
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 
BOARD_KERNEL_PAGESIZE := 2048 
BOARD_RAMDISK_OFFSET := 0x11088000 
BOARD_DTB_OFFSET := 0x07c08000 
BOARD_KERNEL_TAGS_OFFSET := 0x07c08000 
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION) 
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET) 
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET) 
BOARD_MKBOOTIMG_ARGS += --dtb_offset $(BOARD_DTB_OFFSET) 
BOARD_KERNEL_IMAGE_NAME := Image 
BOARD_INCLUDE_DTB_IN_BOOTIMG := true 
TARGET_KERNEL_CONFIG := ruby_defconfig 
TARGET_KERNEL_SOURCE := kernel/xiaomi/ruby 

# Kernel - prebuilt 
TARGET_FORCE_PREBUILT_KERNEL := true 
ifeq ($(TARGET_FORCE_PREBUILT_KERNEL),true) 
TARGET_PREBUILT_KERNEL := $(PREBUILT_PATH)/kernel 
TARGET_PREBUILT_DTB := $(PREBUILT_PATH)/dtb.img 
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB) 
BOARD_INCLUDE_DTB_IN_BOOTIMG := 
endif 

# Partitions 
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64) 
BOARD_BOOTIMAGE_PARTITION_SIZE := 134217728 
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 134217728 
BOARD_HAS_LARGE_FILESYSTEM := true 
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4 
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4 
TARGET_COPY_OUT_VENDOR := vendor 
BOARD_SUPER_PARTITION_SIZE := 9126805504 # TODO: Fix hardcoded value 
BOARD_SUPER_PARTITION_GROUPS := xiaomi_dynamic_partitions 
BOARD_XIAOMI_DYNAMIC_PARTITIONS_PARTITION_LIST := system vendor product 
BOARD_XIAOMI_DYNAMIC_PARTITIONS_SIZE := 9122611200 # TODO: Fix hardcoded value 

# Platform 
TARGET_BOARD_PLATFORM := mt6877 
# Verified Boot 
BOARD_AVB_ENABLE := true 
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3

# Assert 
TARGET_OTA_ASSERT_DEVICE := ruby,rubypro

# Properties 
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop 

# fstab 
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab 

# Metadata 
BOARD_USES_METADATA_PARTITION := true 
TARGET_USERIMAGES_USE_EXT4 := true 
TARGET_USERIMAGES_USE_F2FS := true
 
# APEX 
DEXPREOPT_GENERATE_APEX_IMAGE := true 

# Recovery 
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888" 

# System as Root 
BOARD_SUPPRESS_SECURE_ERASE := true 

# Encryption 
TW_INCLUDE_CRYPTO := true 
TW_INCLUDE_CRYPTO_FBE := true 

# Treble 
BOARD_VNDK_VERSION := current 

ifneq ($(OF_HIDE_NOTCH),1) 
# Configure Status bar icons for regular TWRP builds only 
TW_CUSTOM_CLOCK_POS := 40 
TW_CUSTOM_CPU_POS := 605 
TW_STATUS_ICONS_ALIGN := center 
endif 

# TWRP Configuration 
TW_FRAMERATE := 60 
TW_THEME := portrait_hdpi 
TW_DEVICE_VERSION := Ruby_Norikhsan90 
TW_EXTRA_LANGUAGES := true 
TW_SCREEN_BLANK_ON_BOOT := true 
TW_USE_TOOLBOX := true 
TW_INCLUDE_FASTBOOTD := true 
TW_INCLUDE_NTFS_3G := true 
TW_INCLUDE_REPACKTOOLS := true 
TW_NO_HAPTICS := true 

# Hack: prevent anti rollback 
PLATFORM_SECURITY_PATCH := 2099-12-31 
VENDOR_SECURITY_PATCH := 2099-12-31 
PLATFORM_VERSION := 20.1.0 
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION) 

# Debug 
TWRP_INCLUDE_LOGCAT := true 
TARGET_USES_LOGD := true
