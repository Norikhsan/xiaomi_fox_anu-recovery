# 
 # Copyright (C) 2023 The Android Open Source Project 
 # 
 # SPDX-License-Identifier: Apache-2.0 
 # 

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