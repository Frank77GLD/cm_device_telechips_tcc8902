USE_CAMERA_STUB := true
BOARD_USES_GENERIC_AUDIO := true

# inherit from the proprietary version
-include vendor/telechips/tcc8902/BoardConfigVendor.mk

TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := tcc92xx
TARGET_CPU_ABI := armeabi-v6l
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv6-vfp
TARGET_ARCH_VARIANT_CPU := arm1176jzf-s
TARGET_ARCH_VARIANT_FPU := vfp
TARGET_BOOTLOADER_BOARD_NAME := tcc8902

TARGET_PROVIDES_INIT_RC := true

TARGET_PREBUILT_KERNEL := device/telechips/tcc8902/kernel
BOARD_KERNEL_CMDLINE := console=ttySAC0 androidboot.hardware=tcc92xx
BOARD_KERNEL_BASE := 0x40000000
#BOARD_KERNEL_PAGESIZE := 
include device/telechips/tcc8803/BoardConfig.pagesize.mk

# fix this up by examining /proc/mtd on a running device
# dev:    size   erasesize  name
# mtd0: 00a00000 00080000 "boot"
# mtd1: 00200000 00080000 "kpanic"
# mtd2: 0a000000 00080000 "system"
# mtd3: 00200000 00080000 "splash"
# mtd4: 02800000 00080000 "cache"
# mtd5: 11e00000 00080000 "userdata"
# mtd6: 00a00000 00080000 "recovery"
# mtd7: 00100000 00080000 "misc"
# mtd8: 00100000 00080000 "tcc"
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00a00000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00a00000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x0a000000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x11e00000
BOARD_FLASH_BLOCK_SIZE := 524288

BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/telechips/tcc8902/recovery_ui.c

BOARD_WPA_SUPPLICANT_DRIVER := AWEXT
WIFI_DRIVER_MODULE_PATH     := "/system/wifi/ar6000.ko"
WIFI_DRIVER_MODULE_ARG      := "ifname=wlan0 fwmode=1"
WIFI_DRIVER_MODULE_NAME     := "ar6000"

BOARD_HAVE_BLUETOOTH := true

BOARD_EGL_CFG := device/telechips/tcc8902/egl.cfg
BOARD_NO_RGBX_8888 := true
TARGET_USES_16BPPSURFACE_FOR_OPAQUE := true

BOARD_USE_USB_MASS_STORAGE_SWITCH := true
