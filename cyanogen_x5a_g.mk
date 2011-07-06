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
PRODUCT_NAME := cyanogen_x5a_g
PRODUCT_BRAND := telechips
PRODUCT_DEVICE := tcc8902
PRODUCT_MODEL := X5A-G
PRODUCT_MANUFACTURER := HSG
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=x5a_g BUILD_ID=GRJ22 BUILD_DISPLAY_ID=GRJ22 BUILD_FINGERPRINT=google/soju/crespo:2.3.4/GRJ22/121341:user/release-keys PRIVATE_BUILD_DESC="soju-user 2.3.4 GRJ22 121341 release-keys" BUILD_NUMBER=121341

# Extra TCC8902 overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/telechips/tcc8902/overlay

# Accelerometer hacks
PRODUCT_PROPERTY_OVERRIDES += \
    sensor.accelerometer.flip_xy=1 \
    sensor.accelerometer.invert_x=1 \
    sensor.accelerometer.invert_y=1

#
# Set ro.modversion
#
ifdef CYANOGEN_NIGHTLY
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=CyanogenMod-7-$(shell date +%m%d%Y)-NIGHTLY-TCC8902
else
    ifdef CYANOGEN_RELEASE
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=CyanogenMod-7.1.0-RC1-TCC8902
    else
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=CyanogenMod-7.1.0-RC1-TCC8902-KANG
    endif
endif

#
# Copy TCC8902 specific prebuilt files
#
PRODUCT_COPY_FILES +=  \
    vendor/cyanogen/prebuilt/mdpi/media/bootanimation.zip:system/media/bootanimation.zip
