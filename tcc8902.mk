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
    device/telechips/tcc8902/etc/vold.fstab:system/etc/vold.fstab \
    device/telechips/tcc8902/modules/mali.ko:system/lib/modules/mali.ko

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml
