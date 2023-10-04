 # 
 # Copyright (C) 2023 The Android Open Source Project 
 # 
 # SPDX-License-Identifier: Apache-2.0 
 # 
  
 DEVICE_PATH := device/xiaomi/ruby

 # For building with minimal manifest
 ALLOW_MISSING_DEPENDENCIES := true
  
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
 TARGET_NO_BOOTLOADER          := true 

 # Display
 TARGET_SCREEN_DENSITY := 440

 # Platform 
 TARGET_BOARD_PLATFORM         := mt6877  
 BOARD_HAS_MTK_HARDWARE := true 
 BOARD_VENDOR := xiaomi
 
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
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel 
TARGET_PREBUILT_DTB :=  $(DEVICE_PATH)/prebuilt/dtb.img 
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB) 
BOARD_INCLUDE_DTB_IN_BOOTIMG := 
endif 

 # Despite being VA/B device, there is a dedicated recovery partition 
 BOARD_USES_RECOVERY_AS_BOOT := false 
  
 # Use LZ4 Ramdisk compression instead of GZIP 
 BOARD_RAMDISK_USE_LZ4 := true 
  
 # Power 
 ENABLE_CPUSETS    := true 
 ENABLE_SCHEDBOOST := true 
  
# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    system \
    system \
    vendor \
    vendor \
    product \
    product \
    boot \
    vbmeta_vendor \
    vbmeta_system
  
 # Verified Boot 
 BOARD_AVB_ENABLE := true 
  
 # VNDK Treble 
 BOARD_VNDK_VERSION := current 
  
 # Partitions 
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64) 
BOARD_BOOTIMAGE_PARTITION_SIZE := 134217728  
BOARD_SUPER_PARTITION_SIZE := 9126805504 
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor
BOARD_SUPER_PARTITION_GROUPS := xiaomi_dynamic_partitions 
BOARD_XIAOMI_DYNAMIC_PARTITIONS_PARTITION_LIST := system system vendor vendor product product
BOARD_XIAOMI_DYNAMIC_PARTITIONS_SIZE := 9122611200
  
 # System Properties 
 TARGET_SYSTEM_PROP := $(DEVICE_PATH)/system.prop 
  
 # Recovery 
 TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888" 
 TARGET_USERIMAGES_USE_EXT4 := true
 TARGET_USERIMAGES_USE_F2FS := true
 TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab 

 # TWRP Configuration
TW_THEME := portrait_hdpi
TW_INCLUDE_RESETPROP := true
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
TW_EXTRA_LANGUAGES := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_USE_TOOLBOX := true
TW_INCLUDE_REPACKTOOLS := true
TW_NO_REBOOT_RECOVERY := true
#TW_DEVICE_VERSION := Ruby_Norikhsan90
TARGET_USES_MKE2FS := true
BOARD_HAS_NO_SELECT_BUTTON := true
TW_INCLUDE_FASTBOOTD := true
TW_FRAMERATE := 60

 # DEVICE
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_MAX_BRIGHTNESS := 2047
TW_DEFAULT_BRIGHTNESS := 1200
TW_FRAMERATE := 60
TW_HAS_NO_RECOVERY_PARTITION := true
TW_EXCLUDE_APEX := true



