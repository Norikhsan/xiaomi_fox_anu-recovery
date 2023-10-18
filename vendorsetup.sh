#!/bin/bash 
 
  export FOX_TARGET_DEVICES="ruby,rubypro" 
  export FOX_VARIANT="12.1" 
  export OF_MAINTAINER="Norikhsan90" 
  
  # Binaries & Tools 
  export FOX_USE_BASH_SHELL=1 
  export FOX_ASH_IS_BASH=1 
  export FOX_USE_NANO_EDITOR=1 
  export FOX_USE_TAR_BINARY=1 
  export FOX_USE_SED_BINARY=1 
  export FOX_USE_XZ_UTILS=1 
  export OF_ENABLE_LPTOOLS=1 
  
  # OrangeFox Addons 
  export FOX_ENABLE_APP_MANAGER=1 
  export FOX_DELETE_AROMAFM=1 
  
  # MIUI & Custom ROMs 
  export FOX_VIRTUAL_AB_DEVICE=1
  export OF_NO_MIUI_PATCH_WARNING=1 
  export OF_NO_TREBLE_COMPATIBILITY_CHECK=1 
  export OF_DONT_PATCH_ENCRYPTED_DEVICE=1 
  export OF_NO_RELOAD_AFTER_DECRYPTION=1 

  export OF_FBE_METADATA_MOUNT_IGNORE=1 
  export OF_NO_SPLASH_CHANGE=1
  export OF_FIX_DECRYPTION_ON_DATA_MEDIA=1
         
  # A/B partitions 
  export FOX_VIRTUAL_AB_DEVICE=1 
  export OF_AB_DEVICE_WITH_RECOVERY_PARTITION=0
  
	 # Disable Flashlight & Green LED
	 export OF_FLASHLIGHT_ENABLE=0
	 export OF_USE_GREEN_LED=0 
  
  # Removes the loop block errors after flashing ZIPs (Workaround) 
  export OF_LOOP_DEVICE_ERRORS_TO_LOG=1 
  export OF_IGNORE_LOGICAL_MOUNT_ERRORS=1 
  
  # Use LZ4 ramdisk compression as specified in BoardConfig.mk 
  export OF_USE_LZ4_COMPRESSION=true 
  
  # Security (Disables MTP&ADB during password prompt) 
  export OF_ADVANCED_SECURITY=1 

  # Screen settings 
  export OF_SCREEN_H=2400 
  export OF_STATUS_H=95 
  export OF_STATUS_INDENT_LEFT=48 
  export OF_STATUS_INDENT_RIGHT=48 
  export OF_ALLOW_DISABLE_NAVBAR=0 
  export OF_CLOCK_POS=1 # Left & Right 
  
  # Debugging 
  export FOX_RESET_SETTINGS=0 
  ## export FOX_INSTALLER_DEBUG_MODE=1
