#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 SebaUbuntu's TWRP device tree generator
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

# APEX
DEXPREOPT_GENERATE_APEX_IMAGE := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := ruby
TARGET_NO_BOOTLOADER := true

# Platform
TARGET_BOARD_PLATFORM := mt6877

# Assert
TARGET_OTA_ASSERT_DEVICE := ruby,rubypro

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# fstab
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab

# Kernel
BOARD_BOOTIMG_HEADER_VERSION := 2
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 androidboot.tee_type=2 buildvariant=user
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x11088000
BOARD_KERNEL_TAGS_OFFSET := 0x07c08000
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
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
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_PRODUCT := product
BOARD_SUPER_PARTITION_SIZE := 9126805504 # TODO: Fix hardcoded value
BOARD_SUPER_PARTITION_GROUPS := xiaomi_dynamic_partitions
BOARD_XIAOMI_DYNAMIC_PARTITIONS_PARTITION_LIST := system vendor product
BOARD_XIAOMI_DYNAMIC_PARTITIONS_SIZE := 9122611200 # TODO: Fix hardcoded value

BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USERIMAGES_USE_EXT4 := true
 
# AVB
 BOARD_AVB_ENABLE := true
 BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3

# Encryption
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
TW_RECOVERY_ADDITIONAL_RELINK_LIBRARY_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster4.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster41.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libpuresoftkeymasterdevice.so

# Metadata
BOARD_USES_METADATA_PARTITION := true
BOARD_ROOT_EXTRA_FOLDERS += metadata
BOARD_SUPPRESS_SECURE_ERASE := true

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TW_EXCLUDE_DEFAULT_USB_INIT := true

# Additional binaries & libraries needed for recovery
TARGET_RECOVERY_DEVICE_MODULES += \
    libkeymaster4 \
    libkeymaster41 \
    libpuresoftkeymasterdevice

# Treble
BOARD_VNDK_VERSION := current
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive

# TWRP specific build flags
TW_THEME := portrait_hdpi
TW_DEVICE_VERSION := Ruby_Norikhsan90
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_FASTBOOTD := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_INCLUDE_REPACKTOOLS := true
TW_USE_TOOLBOX := true
TW_EXTRA_LANGUAGES := true
TW_INCLUDE_NTFS_3G := true
TW_INCLUDE_REPACKTOOLS := true
TARGET_USES_MKE2FS := true
TW_OVERRIDE_SYSTEM_PROPS := \
    "ro.build.date.utc;ro.build.flavor;ro.build.tags;ro.build.type;ro.build.user;ro.build.version.incremental=ro.system.build.version.incremental;ro.build.version.release=ro.system.build.version.release;ro.build.version.release_or_codename=ro.system.build.version.release;ro.bootimage.build.tags;ro.bootimage.build.type;ro.bootimage.build.fingerprint=ro.system.build.fingerprint;ro.bootimage.build.version.incremental=ro.system.build.version.incremental;ro.bootimage.build.version.release=ro.system.build.version.release;ro.bootimage.build.version.release_or_codename=ro.system.build.version.release;ro.product.build.fingerprint=ro.system.build.fingerprint;ro.product.build.version.incremental=ro.system.build.version.incremental;ro.product.build.version.release=ro.system.build.version.release;ro.product.build.version.release_or_codename=ro.system.build.version.release;ro.build.description=ro.system.build.fingerprint;ro.build.display.id=ro.system.build.fingerprint;ro.build.fingerprint=ro.system.build.fingerprint;ro.odm.build.tags;ro.odm.build.type;ro.odm.build.fingerprint=ro.system.build.fingerprint;ro.odm.build.version.incremental=ro.system.build.version.incremental;ro.odm.build.version.release=ro.system.build.version.release;ro.odm.build.version.release_or_codename=ro.system.build.version.release;ro.system.build.tags;ro.system.build.type;ro.system.build.fingerprint=ro.system.build.fingerprint;ro.system.build.version.incremental=ro.system.build.version.incremental;ro.system.build.version.release=ro.system.build.version.release;ro.system.build.version.release_or_codename=ro.system.build.version.release;ro.system_ext.build.tags;ro.system_ext.build.type;ro.system_ext.build.fingerprint=ro.system.build.fingerprint;ro.system_ext.build.version.incremental=ro.system.build.version.incremental;ro.system_ext.build.version.release=ro.system.build.version.release;ro.system_ext.build.version.release_or_codename=ro.system.build.version.release;ro.vendor.build.tags;ro.vendor.build.type;ro.vendor.build.fingerprint=ro.system.build.fingerprint;ro.vendor.build.version.incremental=ro.system.build.version.incremental;ro.vendor.build.version.release=ro.system.build.version.release;ro.vendor.build.version.release_or_codename=ro.system.build.version.release"

# Device config
TW_FRAMERATE := 120
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_MAX_BRIGHTNESS := 2047
TW_DEFAULT_BRIGHTNESS := 1200
TW_NO_SCREEN_BLANK := true
TW_NO_HAPTICS := true

ifneq ($(OF_HIDE_NOTCH),1)
    # Configure Status bar icons for regular TWRP builds only
    TW_CUSTOM_CLOCK_POS := 40
    TW_CUSTOM_CPU_POS := 605
    TW_STATUS_ICONS_ALIGN := center
endif

# Haptic
TW_SUPPORT_INPUT_AIDL_HAPTICS :=true
TW_SUPPORT_INPUT_AIDL_HAPTICS_FQNAME := "IVibrator/vibratorfeature"

# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 20.1.0
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)

# Debug
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
