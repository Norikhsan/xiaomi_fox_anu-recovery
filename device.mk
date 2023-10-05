# 
 # Copyright (C) 2023 The Android Open Source Project 
 # 
 # SPDX-License-Identifier: Apache-2.0 
 # 

 # Dynamic Partitions
   PRODUCT_USE_DYNAMIC_PARTITIONS := true

 # Virtual A/B
   ENABLE_VIRTUAL_AB := true
   $(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)
  
 PRODUCT_PACKAGES += \ 
     update_engine \ 
     update_engine_sideload \ 
     update_verifier 
  
 PRODUCT_PACKAGES_DEBUG += \ 
     update_engine_client 
  
 AB_OTA_POSTINSTALL_CONFIG += \ 
     RUN_POSTINSTALL_system=true \ 
     POSTINSTALL_PATH_system=system/bin/otapreopt_script \ 
     FILESYSTEM_TYPE_system=ext4 \ 
     POSTINSTALL_OPTIONAL_system=true 

 PRODUCT_PACKAGES += \ 
     otapreopt_script 
  
 PRODUCT_PACKAGES += \ 
     android.hardware.fastboot@1.0-impl-mock \ 
     fastbootd 

# Additional Libraries
TARGET_RECOVERY_DEVICE_MODULES += \
     libkeymaster4 \
     libkeymaster41 \
     libpuresoftkeymasterdevice

RECOVERY_LIBRARY_SOURCE_FILES += \
     $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster4.so \
     $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster41.so \
     $(TARGET_OUT_SHARED_LIBRARIES)/libpuresoftkeymasterdevice.so
  
TW_OVERRIDE_SYSTEM_PROPS := \
"ro.build.product;ro.build.fingerprint;ro.build.version.incremental;ro.product.device=ro.product.system.device;ro.product.model=ro.product.system.model;ro.product.name=ro.product.system.name"
