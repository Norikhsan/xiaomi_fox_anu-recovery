 # 
 # Copyright (C) 2023 The Android Open Source Project 
 # 
 # SPDX-License-Identifier: Apache-2.0 
 # 

 # Release name 
 PRODUCT_RELEASE_NAME := ruby
  
 # Inherit from those products. Most specific first. 
  $(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk) 
  $(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk) 
  
 # Inherit from ruby device
 $(call inherit-product, device/xiaomi/ruby/device.mk)

 # Inherit from our custom product configuration
 $(call inherit-product, vendor/twrp/config/common.mk)

 # Device identifier. This must come after all inclusions  
  PRODUCT_DEVICE := ruby 
  PRODUCT_NAME := twrp_ruby 
  PRODUCT_BRAND := Redmi 
  PRODUCT_MODEL := 22101316G 
  PRODUCT_MANUFACTURER := xiaomi  
