# 
 # Copyright (C) 2023 The Android Open Source Project 
 # 
 # SPDX-License-Identifier: Apache-2.0 
 # 
  
 # Inherit from those products 
 $(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk) 
 $(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk) 
  
 # Inherit from device configuration 
 $(call inherit-product, device/xiaomi/tapas/device.mk) 
  
 # Inherit from TWRP common configuration 
 $(call inherit-product, vendor/twrp/config/common.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := ruby
PRODUCT_NAME := twrp_ruby
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := 22101316G
PRODUCT_RELEASE_NAME := Redmi Note 12 Pro 5G
PRODUCT_MANUFACTURER := xiaomi

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi


# HACK: Set vendor patch level
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.build.security_patch=2099-12-31
