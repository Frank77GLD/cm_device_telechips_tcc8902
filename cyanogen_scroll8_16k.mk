# Inherit AOSP device configuration for TCC8902.
#$(call inherit-product, device/telechips/tcc8902/full_tcc8902.mk)
$(call inherit-product, device/telechips/tcc8902/small_tcc8902.mk)

# Inherit some common cyanogenmod stuff.
#$(call inherit-product, vendor/cyanogen/products/common.mk)
$(call inherit-product, device/telechips/tcc8902/cyanogen_common_small.mk)

# Include GSM stuff
#$(call inherit-product, vendor/cyanogen/products/gsm.mk)

# Include extra dictionaries for LatinIME
#PRODUCT_PACKAGE_OVERLAYS += vendor/cyanogen/overlay/dictionaries

#
# Setup device specific product configuration.
#
PRODUCT_NAME := cyanogen_scroll8_16k
PRODUCT_BRAND := telechips
PRODUCT_DEVICE := tcc8902
PRODUCT_MODEL := Scroll 8 16K
PRODUCT_MANUFACTURER := Storage Options
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=scroll8_16k BUILD_ID=GRK39F BUILD_FINGERPRINT=google/soju/crespo:2.3.6/GRK39F/189904:user/release-keys PRIVATE_BUILD_DESC="soju-user 2.3.6 GRK39F 189904 release-keys" BUILD_NUMBER=189904

# Extra TCC8902 overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/telechips/tcc8902/overlay

# Accelerometer hacks
PRODUCT_PROPERTY_OVERRIDES += \
    accelerometer.flip_xy=1 \
    accelerometer.invert_x=1

# Release name and versioning
PRODUCT_RELEASE_NAME := TCC8902
PRODUCT_VERSION_DEVICE_SPECIFIC :=
-include vendor/cyanogen/products/common_versions.mk

#
# Copy TCC8902 specific prebuilt files
#
#PRODUCT_COPY_FILES +=  \
#    vendor/cyanogen/prebuilt/mdpi/media/bootanimation.zip:system/media/bootanimation.zip
