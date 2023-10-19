 # 
 # Copyright (C) 2023 The Android Open Source Project 
 # 
 # SPDX-License-Identifier: Apache-2.0 
 # 

LOCAL_PATH := device/xiaomi/ruby

# Dynamic Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# API
PRODUCT_TARGET_VNDK_VERSION := 33
PRODUCT_SHIPPING_API_LEVEL := 32

# A/B
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

PRODUCT_PACKAGES += \
    otapreopt_script 

# fastbootd
PRODUCT_PACKAGES += \
    android.hardware.boot@1.1-impl \
    android.hardware.boot@1.1-impl.recovery \
    android.hardware.boot@1.2-mtkimpl.recovery
    fastbootd \
    resetprop

# Additional binaries & libraries needed for recovery
TARGET_RECOVERY_DEVICE_MODULES += \
    libkeymaster41 \
    libkeymaster4 \
    libpuresoftkeymasterdevice

RECOVERY_LIBRARY_SOURCE_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster41.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster4.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libpuresoftkeymasterdevice.so

 # Update engine
PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier \
    checkpoint_gc

PRODUCT_PACKAGES_DEBUG += \
    update_engine_client