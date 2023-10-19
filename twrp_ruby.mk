 # 
 # Copyright (C) 2023 The Android Open Source Project 
 # 
 # SPDX-License-Identifier: Apache-2.0 
 # 

 # Release name 
 PRODUCT_RELEASE_NAME := ruby
  
 # Inherit from those products. Most specific first. 
  $(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk) 
  $(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk) 
  
 # Inherit some common TWRP stuff 
  $(call inherit-product, vendor/twrp/config/common.mk) 
  
 # Inherit from ruby device 
  $(call inherit-product, device/xiaomi/ruby/device.mk) 
  
 # Device identifier. This must come after all inclusions  
  PRODUCT_DEVICE := ruby 
  PRODUCT_NAME := twrp_ruby 
  PRODUCT_BRAND := Redmi 
  PRODUCT_MODEL := 22101316G 
  PRODUCT_MANUFACTURER := xiaomi 
 
PRODUCT_GMS_CLIENTID_BASE := android-xiaomi 
  
 PRODUCT_BUILD_PROP_OVERRIDES += \ 
     PRIVATE_BUILD_DESC="vnd_ruby-user 12 SP1A.210812.016 V13.0.4.0.SMOINXM release-keys" 
  
 BUILD_FINGERPRINT := Redmi/ruby_in/ruby:12/SP1A.210812.016/V13.0.4.0.SMOINXM:user/release-keys