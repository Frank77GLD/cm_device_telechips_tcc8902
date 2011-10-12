$(call inherit-product, $(SRC_TARGET_DIR)/product/small_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/telechips/tcc8902/device-vendor.mk)

$(call inherit-product, device/telechips/common/common.mk)
$(call inherit-product, device/telechips/tcc8902/tcc8902.mk)

PRODUCT_NAME := full_tcc8902
PRODUCT_DEVICE := tcc8902
