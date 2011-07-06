$(call inherit-product, $(SRC_TARGET_DIR)/product/small_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/telechips/tcc8902/device-vendor.mk)

$(call inherit-product, device/telechips/common/common.mk)

DEVICE_PACKAGE_OVERLAYS += device/telechips/tcc8902/overlay


ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/telechips/tcc8902/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

PRODUCT_COPY_FILES += \
    device/telechips/tcc8902/init.rc:root/init.rc

PRODUCT_COPY_FILES += \
    device/telechips/tcc8902/etc/vold.fstab:system/etc/vold.fstab

PRODUCT_COPY_FILES += \
    device/telechips/tcc8902/modules/mali.ko:system/lib/modules/mali.ko

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml

PRODUCT_NAME := full_tcc8902
PRODUCT_DEVICE := tcc8902
