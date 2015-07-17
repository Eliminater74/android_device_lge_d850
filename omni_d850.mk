#$(call inherit-product, device/lge/d850/full_d850.mk)
#
# Inherit some common CM stuff.
#$(call inherit-product, vendor/cm/config/common_full_phone.mk)
#
# Enhanced NFC
#$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

# Get the prebuilt list of APNs
$(call inherit-product, vendor/omni/config/gsm.mk)

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Inherit from our custom product configuration
$(call inherit-product, vendor/omni/config/common.mk)



PRODUCT_PACKAGES += \
    charger_res_images \
    charger

# Copy needed files to make everything work for recovery
PRODUCT_COPY_FILES += \
#    device/lge/d850/kernel:kernel \
    device/lge/d850/img_info:img_info \
    device/lge/d850/postrecoveryboot.sh:recovery/root/sbin/postrecoveryboot.sh \
	device/lge/d850/sign:recovery/root/res/sign

PRODUCT_COPY_FILES += device/lge/d850/fstab.g3:recovery/root/fstab.g3
PRODUCT_COPY_FILES += device/lge/d850/twrp.fstab:recovery/root/etc/twrp.fstab


# Set those variables here to overwrite the inherited values.
PRODUCT_DEVICE := d850
PRODUCT_NAME := omni_d850
PRODUCT_BRAND := LG
PRODUCT_MODEL := G3
PRODUCT_MANUFACTURER := LGE

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_DEVICE="g3" \
    PRODUCT_NAME="g3_att_us" \
    BUILD_FINGERPRINT="lge/g3_att_us/g3:4.4.2/KVT49L.D85010d/D85010d.1403173065:user/release-keys" \
    PRIVATE_BUILD_DESC="g3_att_us-user 4.4.2 KVT49L.D85010d D85010d.1403173065 release-keys"
