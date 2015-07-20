#
# Copyright (C) 2014 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Get non-open-source specific aspects
$(call inherit-product-if-exists, vendor/lge/d850/d850-vendor.mk)

# Audio
PRODUCT_COPY_FILES += \
    device/lge/g3-common/configs/mixer_paths_qcwcn.xml:system/etc/mixer_paths.xml

# NFC
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Bluetooth
PRODUCT_PACKAGES += \
    init.galbi.bt.sh \
    init.galbi.bt_vendor.rc

# GPS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gps.conf:system/etc/gps.conf

# Thermal
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/thermal-engine-8974.conf:system/etc/thermal-engine-8974.conf

# Select Tmobile LTE IPV6 on first boot
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/apn/apns-conf.xml:system/etc/apns-conf.xml

# Personal Packages
PRODUCT_PACKAGES += \
    OmniSwitch \
	OmniGears \
	OTAUpdates 
#	KernelAdiutor \
#	MaterialTabs \
#	picasso \
#	FloatingActionButton

#Viper4Android
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/viper4android/ViPER4Android_FX_A4.x.apk:system/priv-app/Viper4Android/viper4android.apk \
    $(LOCAL_PATH)/viper4android/lib/libv4a_fx_ics_NEON_HQ.so:system/lib/soundfx/libv4a_fx_ics_NEON_HQ.so \
    $(LOCAL_PATH)/viper4android/conf/audio_effects.conf:system/etc/audio_effects.conf
 
# KernelAdiutor
PRODUCT_COPY_FILES += \
#    $(LOCAL_PATH)/Packages/KernelAdiutor/app-no_launcher-unaligned.apk:system/app/KernelAdiutor/base.apk
    $(LOCAL_PATH)/Packages/KernelAdiutor/app-no_launcher-unaligned.apk:system/priv-app/KernelAdiutor/KernelAdiutor.apk
    
#OTA Updater
#PRODUCT_COPY_FILES += \
#    $(LOCAL_PATH)/OTAUpdates/lib/armeabi-v7a/libbypass.so:system/app/OTAUpdates/lib/arm/libbypass.so \
#    $(LOCAL_PATH)/OTAUpdates/OTAUpdates.apk:system/app/OTAUpdates/base.apk
  
#Quick Remote Workaround
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/QuickRemote/addon.d/80-quickremote.sh:system/addon.d/80-quickremote.sh \
    $(LOCAL_PATH)/QuickRemote/app/LGQRemote/LGQRemote.apk:system/app/LGQRemote/LGQRemote.apk \
    $(LOCAL_PATH)/QuickRemote/app/QuicksetSDK/QuicksetSDK.apk:system/app/QuicksetSDK/QuicksetSDK.apk \
    $(LOCAL_PATH)/QuickRemote/etc/init.d/10QuickRemote:system/etc/init.d/10QuickRemote \
    $(LOCAL_PATH)/QuickRemote/media/audio/ui/IR_normal.ogg:system/media/audio/ui/IR_normal.ogg


# Wifi
PRODUCT_PACKAGES += \
    hostapd_default.conf \
    libwcnss_qmi \
    wcnss_service

# NFC packages
PRODUCT_PACKAGES += \
    NfcNci \
    nfc_nci.pn54x.default

PRODUCT_COPY_FILES += \
    device/lge/g3-common/wcnss/WCNSS_cfg.dat:system/etc/firmware/wlan/prima/WCNSS_cfg.dat \
    device/lge/g3-common/wcnss/WCNSS_qcom_cfg.ini:system/etc/wifi/WCNSS_qcom_cfg.ini \
    device/lge/g3-common/wcnss/WCNSS_qcom_wlan_nv.bin:system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin \
    device/lge/g3-common/wcnss/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
    device/lge/g3-common/wcnss/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf

# common g3
$(call inherit-product, device/lge/g3-common/g3.mk)
