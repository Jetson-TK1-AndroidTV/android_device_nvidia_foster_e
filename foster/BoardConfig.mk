#
# Copyright (C) 2014 The Android Open-Source Project
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

# Use the non-open-source parts, if they're present
include vendor/nvidia/jetson/BoardConfigVendor.mk

# Enable dex-preoptimization to speed up first boot sequence
ifeq ($(HOST_OS),linux)
  ifeq ($(TARGET_BUILD_VARIANT),user)
    ifeq ($(WITH_DEXPREOPT),)
      WITH_DEXPREOPT := true
    endif
  endif
endif

TARGET_BOARD_PLATFORM := tegra
TARGET_TEGRA_VERSION := t124
TARGET_TEGRA_FAMILY := t12x

TARGET_KERNEL_DT_NAME ?= tegra124-ardbeg

# CPU options
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a15
TARGET_CPU_SMP := true

# powerhal
BOARD_USES_POWERHAL := true

BOARD_USES_GENERIC_AUDIO := false
BOARD_USES_ALSA_AUDIO := true
ifeq ($(PLATFORM_IS_NEXT),1)
  USE_CUSTOM_AUDIO_POLICY := 1
endif
BOARD_SUPPORT_NVOICE := true
BOARD_SUPPORT_NVAUDIOFX := true

# Bluetooth Bluez Stack
TARGET_USE_BLUEZ := true

BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_ath9k
BOARD_WLAN_DEVICE           := ath9k
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_ath9k

TARGET_NO_RADIOIMAGE := true
TARGET_NO_BOOTLOADER := true

TARGET_BOARD_INFO_FILE := device/nvidia/foster/board-info.txt
TARGET_BOOTLOADER_BOARD_NAME := jetson-tk1

# BOARD_WIDEVINE_OEMCRYPTO_LEVEL
# The security level of the content protection provided by the Widevine DRM plugin depends
# on the security capabilities of the underlying hardware platform.
# There are Level 1/2/3. To run HD contents, should be Widevine level 1 security.
BOARD_WIDEVINE_OEMCRYPTO_LEVEL := 1

# FS
TARGET_COPY_OUT_VENDOR := vendor
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_USERDATAIMAGE_PARTITION_SIZE  := 13090422784
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1342177280
BOARD_VENDORIMAGE_PARTITION_SIZE := 419430400
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_PARTITION_SIZE := 805306368
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 4096

# MKBOOTIMG
# TARGET_NO_KERNEL = false
TARGET_KERNEL_APPEND_DTB := true
TARGET_BUILD_KERNEL_MODULES := true
TARGET_KERNEL_HAVE_EXFAT =: true
TARGET_KERNEL_HAVE_NTSF =: true
BOARD_KERNEL_IMAGE_NAME := zImage-dtb
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_CMDLINE := androidboot.hardware=jetson-tk1 vmalloc=500M androidboot.selinux=permissive
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x01000000 --ramdisk_offset 0x02100000 --tags_offset 0x02000000

# Graphics
SF_VSYNC_EVENT_PHASE_OFFSET_NS := 1
USE_OPENGL_RENDERER := true

BOARD_SUPPORT_PARAGON_FUSE_UFSD := true

# UBOOT/XLOADER
TARGET_USE_XLOADER := false
TARGET_USE_UBOOT := false
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_TYPE := fastboot

BOARD_BUILD_BOOTLOADER := true

TARGET_UBOOT_BUILD ?= true

# This should be set to true for boards that support 3DVision.
BOARD_HAS_3DV_SUPPORT := true

# Allow this variable to be overridden to n for non-secure OS build
SECURE_OS_BUILD ?= y
ifeq ($(SECURE_OS_BUILD),y)
    SECURE_OS_BUILD := tlk
endif

# Use Nvidia optimized renderscript driver
OVERRIDE_RS_DRIVER := libnvRSDriver.so

# Double buffered display surfaces reduce memory usage, but will decrease performance.
# The default is to triple buffer the display surfaces.
# BOARD_DISABLE_TRIPLE_BUFFERED_DISPLAY_SURFACES := true

# Use CMU-style config with Nvcms
NVCMS_CMU_USE_CONFIG := true

# Using the NCT partition
TARGET_USE_NCT := false
# LBH related defines
# use LBH partition and resources in it
BOARD_HAVE_LBH_SUPPORT := false

# Per-application sizes for shader cache
MAX_EGL_CACHE_SIZE := 4194304
MAX_EGL_CACHE_ENTRY_SIZE := 262144

# AOSP master based board specific sepolicy
BOARD_SEPOLICY_DIRS += device/nvidia/platform/ardbeg/sepolicy_aosp/

include device/nvidia/common/BoardConfig.mk

# TWRP Recovery
RECOVERY_VARIANT := twrp
TW_THEME := landscape_hdpi
TW_SCREEN_BLANK_ON_BOOT := true
TARGET_RECOVERY_DEVICE_DIRS += device/nvidia/foster
TARGET_RECOVERY_FSTAB = device/nvidia/foster/fstab.jetson-tk1
#RECOVERY_GRAPHICS_USE_LINELENGTH := true
BOARD_HAS_NO_REAL_SDCARD := true
RECOVERY_SDCARD_ON_DATA := true
TW_NO_SCREEN_TIMEOUT := true
TW_NO_CPU_TEMP := true

ART_USE_HSPACE_COMPACT=true

# Include an expanded selection of fonts
EXTENDED_FONT_FOOTPRINT := true

BOARD_USES_GENERIC_INVENSENSE := false
