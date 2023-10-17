# 
 # Copyright (C) 2023 The Android Open Source Project 
 # 
 # SPDX-License-Identifier: Apache-2.0 
 # 

 # Release name 
 PRODUCT_RELEASE_NAME := ruby
  
 # To reference the default compilation configuration file, core_64_bit must precede other references, otherwise it will not take effect.
 $(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk) 
 $(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk) 
  
 # Inherit from bomb device 
 $(call inherit-product, device/xiaomi/ruby/device.mk) 
  
 # Inherit some common TWRP stuff. 
 $(call inherit-product, vendor/twrp/config/common.mk) 
  
 # Device identifier. This must come after all inclusions 
 PRODUCT_DEVICE := ruby
 PRODUCT_NAME := twrp_ruby
 PRODUCT_BRAND := Redmi
 PRODUCT_MODEL := 22101316G
 PRODUCT_RELEASE_NAME := Redmi Note 12 Pro 5G
 PRODUCT_MANUFACTURER := xiaomi
