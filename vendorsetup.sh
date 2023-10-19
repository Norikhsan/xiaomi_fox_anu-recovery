export TARGET_ARCH="arm64-v8a"

# Some about us
export FOX_VERSION="R12.1"
export OF_MAINTAINER=norikhsan90
export TARGET_DEVICE_ALT="ruby"
export FOX_TARGET_DEVICES="ruby,rubypro"

# Use magisk boot for patching
export OF_USE_MAGISKBOOT=1
export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES=1
export OF_DONT_PATCH_ENCRYPTED_DEVICE=1

# We have a/b partitions
export FOX_AB_DEVICE=1
export FOX_VIRTUAL_AB_DEVICE=1

# Disable Flashlight & Green LED
export OF_FLASHLIGHT_ENABLE=0
export OF_USE_GREEN_LED=0 

# Screen specifications
export OF_STATUS_INDENT_LEFT=48
export OF_STATUS_INDENT_RIGHT=48
export OF_ALLOW_DISABLE_NAVBAR=0
export OF_CLOCK_POS=0
export OF_SCREEN_H=2400
export OF_STATUS_H=120

# Device stuff
export OF_KEEP_FORCED_ENCRYPTION=1
export OF_NO_TREBLE_COMPATIBILITY_CHECK=1
export OF_FBE_METADATA_MOUNT_IGNORE=1
export OF_PATCH_AVB20=0

# Run a process after formatting data to work-around MTP issues
#export OF_RUN_POST_FORMAT_PROCESS=1

# Removes the loop block errors after flashing ZIPs (Workaround) 
export OF_LOOP_DEVICE_ERRORS_TO_LOG=1 
#export OF_IGNORE_LOGICAL_MOUNT_ERRORS=1 

# MIUI & Custom ROMs 
export FOX_VIRTUAL_AB_DEVICE=1
export OF_NO_MIUI_PATCH_WARNING=1 
export OF_NO_TREBLE_COMPATIBILITY_CHECK=1 
export OF_DONT_PATCH_ENCRYPTED_DEVICE=1 
export OF_NO_RELOAD_AFTER_DECRYPTION=1 

export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES=1
export OF_FBE_METADATA_MOUNT_IGNORE=1 
export OF_NO_SPLASH_CHANGE=1
export OF_FIX_DECRYPTION_ON_DATA_MEDIA=1

# For some reason this is dumb and necessary
#export FOX_BUGGED_AOSP_ARB_WORKAROUND="1601559499"

# Quick Backup list
#export OF_QUICK_BACKUP_LIST="/boot;/data;/super;"
  
# Security (Disables MTP&ADB during password prompt) 
export OF_ADVANCED_SECURITY=1 

# Magisk 26.3
#export FOX_USE_SPECIFIC_MAGISK_ZIP=~/Magisk/Magisk-v26.3.zip

# Dont install AROMAFM
export FOX_DELETE_AROMAFM=1

# Add some extras
export FOX_USE_ZIP_BINARY=1
export FOX_USE_TAR_BINARY=1
export FOX_ASH_IS_BASH=1
export FOX_REPLACE_BUSYBOX_PS=1
export FOX_USE_BASH_SHELL=1
export OF_USE_LZMA_COMPRESSION=1
export FOX_USE_NANO_EDITOR=1
export OF_DONT_KEEP_LOG_HISTORY=1
export OF_NO_SPLASH_CHANGE=1
export FOX_INSTALLER_DISABLE_AUTOREBOOT=1