 # 
 # Copyright (C) 2023 The Android Open Source Project 
 # 
 # SPDX-License-Identifier: Apache-2.0 
 # 
  
 DEVICE_PATH := device/xiaomi/ruby
  
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
 TARGET_USES_UEFI              := true 
  
 # Platform 
 TARGET_BOARD_PLATFORM         := mt6877  
 
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
    system_ext \
    vendor \
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
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 134217728 
BOARD_SUPER_PARTITION_SIZE := 9126805504 # TODO: Fix hardcoded value 
BOARD_SUPER_PARTITION_GROUPS := xiaomi_dynamic_partitions 
BOARD_XIAOMI_DYNAMIC_PARTITIONS_PARTITION_LIST := system system_ext vendor product 
BOARD_XIAOMI_DYNAMIC_PARTITIONS_SIZE := 9122611200 # TODO: Fix hardcoded value 
  
 BOARD_USES_METADATA_PARTITION := true 
 BOARD_USES_VENDORIMAGE   := true 
 BOARD_USES_SYSTEMIMAGE   := true 
 BOARD_USES_SYSTEM_EXTIMAGE    := true 
    
 BOARD_PARTITION_LIST := $(call to-upper, $(BOARD_XIAOMI_DYNAMIC_PARTITIONS_PARTITION_LIST)) 
 $(foreach p, $(BOARD_PARTITION_LIST), $(eval BOARD_$(p)IMAGE_FILE_SYSTEM_TYPE := erofs)) 
 $(foreach p, $(BOARD_PARTITION_LIST), $(eval TARGET_COPY_OUT_$(p) := $(call to-lower, $(p)))) 
  
 BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs 
 TARGET_COPY_OUT_SYSTEM_EXT := system_ext 
 TARGET_COPY_OUT_PRODUCT    := product 
  
 # Filesystems 
 TARGET_USERIMAGES_USE_EXT4    := true 
 TARGET_USERIMAGES_USE_F2FS    := true 
 TARGET_USES_MKE2FS            := true 
 BOARD_HAS_LARGE_FILESYSTEM    := true 
  
 # Workaround for error copying vendor files to recovery ramdisk 
 BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4 
 TARGET_COPY_OUT_VENDOR := vendor 
  
 # System Properties 
 TARGET_SYSTEM_PROP := $(DEVICE_PATH)/system.prop 
  
 # Recovery 
 TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888" 
 TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab 
 TARGET_RECOVERY_QCOM_RTC_FIX := true 
 TARGET_USES_LOGD := true

TARGET_USES_LOGD := true
