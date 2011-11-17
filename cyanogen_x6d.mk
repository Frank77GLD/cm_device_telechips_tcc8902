# Inherit AOSP device configuration for TCC8902.
$(call inherit-product, device/telechips/tcc8902/full_tcc8902.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cyanogen/products/common.mk)

# Include GSM stuff
$(call inherit-product, vendor/cyanogen/products/gsm.mk)

# Include extra dictionaries for LatinIME
PRODUCT_PACKAGE_OVERLAYS += vendor/cyanogen/overlay/dictionaries

#
# Setup device specific product configuration.
#
PRODUCT_NAME := cyanogen_x6d
PRODUCT_BRAND := telechips
PRODUCT_DEVICE := tcc8902
PRODUCT_MODEL := X6D
PRODUCT_MANUFACTURER := HSG
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=x6d BUILD_ID=GRK39F BUILD_FINGERPRINT=google/soju/crespo:2.3.6/GRK39F/189904:user/release-keys PRIVATE_BUILD_DESC="soju-user 2.3.6 GRK39F 189904 release-keys" BUILD_NUMBER=189904

# Extra TCC8902 overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/telechips/tcc8902/overlay

# Accelerometer hacks
PRODUCT_PROPERTY_OVERRIDES += \
    accelerometer.flip_xy=1 \
    accelerometer.invert_x=1 \
    accelerometer.invert_y=1

# Release name and versioning
PRODUCT_RELEASE_NAME := TCC8902
PRODUCT_VERSION_DEVICE_SPECIFIC :=
-include vendor/cyanogen/products/common_versions.mk

#
# Copy TCC8902 specific prebuilt files
#
PRODUCT_COPY_FILES +=  \
    vendor/cyanogen/prebuilt/mdpi/media/bootanimation.zip:system/media/bootanimation.zip
