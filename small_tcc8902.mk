#$(call inherit-product, $(SRC_TARGET_DIR)/product/small_base.mk)
#
# Copyright (C) 2009 The Android Open Source Project
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

# This is a build configuration for a full-featured build of the
# Open-Source part of the tree. This is a base configuration to
# bes used for AOSP builds on various target devices.

PRODUCT_PACKAGES := \
    VoiceDialer

# Additional settings used in all AOSP builds
PRODUCT_PROPERTY_OVERRIDES := \
    keyguard.no_require_sim=true

# Put en_US first in the list, to make it default.
PRODUCT_LOCALES := en_US

# Pick up some sounds - stick with the short list to save space
# on smaller devices.
#$(call inherit-product-if-exists, frameworks/base/data/sounds/OriginalAudio.mk)

# Get the list of languages.
#$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_small.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/generic.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
#$(call inherit-product, device/common/gps/gps_us_supl.mk)

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
