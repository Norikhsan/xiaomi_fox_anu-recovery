#
# Copyright (C) 2022 The OrangeFox Recovery Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

FDEVICE="ruby"
#set -o xtrace

fox_get_target_device() {
local chkdev=$(echo "$BASH_SOURCE" | grep -w $FDEVICE)
   if [ -n "$chkdev" ]; then 
      FOX_BUILD_DEVICE="$FDEVICE"
   else
      chkdev=$(set | grep BASH_ARGV | grep -w $FDEVICE)
      [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
   fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
   fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then
   		export TW_DEFAULT_LANGUAGE="en"
		export LC_ALL="C"
	
 		# Version / Maintainer infos
		export OF_MAINTAINER="Tapin Recovery Instraller"
		export FOX_VERSION=R12.1_0
		export FOX_BUILD_TYPE="Beta"
		export TARGET_DEVICE_ALT="ruby"

		# OTA / DM-Verity / Encryption
		export OF_NO_TREBLE_COMPATIBILITY_CHECK=1
		export OF_DISABLE_MIUI_OTA_BY_DEFAULT=1
		export OF_FIX_OTA_UPDATE_MANUAL_FLASH_ERROR=1	
  
		export OF_DONT_PATCH_ON_FRESH_INSTALLATION=1
		export OF_DONT_PATCH_ENCRYPTED_DEVICE=1
		export OF_KEEP_DM_VERITY_FORCED_ENCRYPTION=1
		export OF_SKIP_DECRYPTED_ADOPTED_STORAGE=1

		# Display / Leds
		export OF_SCREEN_H="2400"
		export OF_STATUS_H="110"
		export OF_STATUS_INDENT_LEFT=48
		export OF_STATUS_INDENT_RIGHT=48
		export OF_HIDE_NOTCH=1
		export OF_CLOCK_POS=1 # left and right clock positions available
		export OF_USE_GREEN_LED=0

		# Security (Disables MTP & ADB during password prompt)
		export OF_ADVANCED_SECURITY=1

		# Removes the loop block errors after flashing ZIPs (Workaround) 
		export OF_LOOP_DEVICE_ERRORS_TO_LOG=1 

		# Other OrangeFox configs
		export OF_ENABLE_LPTOOLS=1
		export OF_ALLOW_DISABLE_NAVBAR=0
	        export OF_QUICK_BACKUP_LIST="/boot;/data;"
		export FOX_BUGGED_AOSP_ARB_WORKAROUND="1546300800" # Tue Jan 1 2019 00:00:00 GMT
		export FOX_DELETE_AROMAFM=1

	# let's see what are our build VARs
	if [ -n "$FOX_BUILD_LOG_FILE" -a -f "$FOX_BUILD_LOG_FILE" ]; then
  	   export | grep "FOX" >> $FOX_BUILD_LOG_FILE
  	   export | grep "OF_" >> $FOX_BUILD_LOG_FILE
   	   export | grep "TARGET_" >> $FOX_BUILD_LOG_FILE
  	   export | grep "TW_" >> $FOX_BUILD_LOG_FILE
 	fi
fi
