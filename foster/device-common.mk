# NVIDIA Tegra5 "Ardbeg" development system
#
# Copyright (c) 2014 NVIDIA Corporation.  All rights reserved.
#
# ------------------------------------------------
# Common options for both mobile and automotive
# ------------------------------------------------

## Common product locale
PRODUCT_LOCALES += en_US

## Common property overrides
PRODUCT_PROPERTY_OVERRIDES += ro.com.google.clientidbase=android-nvidia

## Common packages
$(call inherit-product-if-exists, vendor/nvidia/tegra/secureos/nvsi/nvsi.mk)
$(call inherit-product-if-exists, frameworks/base/data/videos/VideoPackage2.mk)
$(call inherit-product-if-exists, vendor/nvidia/tegra/core/android/t124/full.mk)
$(call inherit-product-if-exists, vendor/nvidia/tegra/core/nvidia-tegra-vendor.mk)
$(call inherit-product-if-exists, vendor/nvidia/tegra/ardbeg/partition-data/factory-ramdisk/factory.mk)

NV_VCM_FLASH_SCRIPT_PATH := vendor/nvidia/tegra/embedded/tools
NV_VCM_FLASH_FILES_PATH := $(NV_VCM_FLASH_SCRIPT_PATH)/boards/vcm30t124

ifneq ($(wildcard $(NV_VCM_FLASH_FILES_PATH)),)
PRODUCT_COPY_FILES += \
    $(NV_VCM_FLASH_FILES_PATH)/nvflash/VCM30T124_2GB_H5TC4G63AFR.bct:VCM30T124_2GB_H5TC4G63AFR.bct \
    $(NV_VCM_FLASH_FILES_PATH)/nvflash/VCM30T124_4GB_MT41K512M16.bct:VCM30T124_4GB_MT41K512M16.bct \
    $(NV_VCM_FLASH_FILES_PATH)/nvflash/quickboot_snor_android.cfg:quickboot_snor_android.cfg
endif

ifeq ($(wildcard vendor/nvidia/tegra/embedded/tools),vendor/nvidia/tegra/embedded/tools)
PRODUCT_COPY_FILES += \
    $(NV_VCM_FLASH_SCRIPT_PATH)/scripts/bootburn/bootburn.sh:bootburn.sh \
    $(NV_VCM_FLASH_SCRIPT_PATH)/scripts/bootburn/bootburn_adb.sh:bootburn_adb.sh \
    $(NV_VCM_FLASH_SCRIPT_PATH)/boards/vcm30t124/bootburn_helper.sh:bootburn_helper.sh \
    $(NV_VCM_FLASH_SCRIPT_PATH)/utils/flashramdisk.img:flashramdisk.img \
    $(NV_VCM_FLASH_SCRIPT_PATH)/utils/e2fsck:e2fsck \
    $(NV_VCM_FLASH_SCRIPT_PATH)/utils/resize2fs:resize2fs \
    $(NV_VCM_FLASH_SCRIPT_PATH)/utils/wr_sh.sh:wr_sh.sh \
    $(NV_VCM_FLASH_SCRIPT_PATH)/utils/GP1.img:GP1.img
endif

ifeq ($(wildcard vendor/nvidia/tegra/core-private),vendor/nvidia/tegra/core-private)
    NVFLASH_FILES_PATH := vendor/nvidia/tegra/bootloader/nvbootloader/odm-partner/ardbeg
else
    NVFLASH_FILES_PATH := vendor/nvidia/tegra/odm/ardbeg
endif

PRODUCT_COPY_FILES += \
    $(NVFLASH_FILES_PATH)/nvflash/PM358_Hynix_2GB_H5TC4G63AFR_RDA_792MHz.cfg:flash_pm358_792.cfg \
    $(NVFLASH_FILES_PATH)/nvflash/PM359_Hynix_2GB_H5TC4G63AFR_RDA_792MHz.cfg:flash_pm359_792.cfg \
    $(NVFLASH_FILES_PATH)/nvflash/E1780_Hynix_2GB_H5TC4G63AFR_RDA_408Mhz.cfg:flash_e1780_408.cfg \
    $(NVFLASH_FILES_PATH)/nvflash/E1780_Hynix_2GB_H5TC4G63AFR_RDA_792Mhz.cfg:flash_e1780_792.cfg \
    $(NVFLASH_FILES_PATH)/nvflash/E1780_Hynix_4GB_H5TC8G63AMR_PBA_792Mhz.cfg:flash_e1780_4gb_792.cfg \
    $(NVFLASH_FILES_PATH)/nvflash/E1780_Hynix_2GB_H5TC4G63AFR_RDA_924Mhz.cfg:flash_e1780_924.cfg \
    $(NVFLASH_FILES_PATH)/nvflash/E1782_Hynix_4GB_H5TC8G63AMR_PBA_792Mhz.cfg:flash_e1782_4gb_792.cfg \
    $(NVFLASH_FILES_PATH)/nvflash/E1782_Hynix_2GB_H5TC4G63AFR_RDA_924Mhz.cfg:flash_e1782_924.cfg \
    $(NVFLASH_FILES_PATH)/nvflash/E1782_Hynix_4GB_H5TC8G63AMR_PBA_792Mhz_spi.cfg:flash_e1782_4gb_792_spi.cfg \
    $(NVFLASH_FILES_PATH)/nvflash/E1782_Hynix_2GB_H5TC4G63AFR_RDA_924Mhz_spi.cfg:flash_e1782_924_spi.cfg \
    $(NVFLASH_FILES_PATH)/nvflash/E1792_Elpida_2GB_EDFA164A2MA_JD_F_792MHz.cfg:flash_e1792_792.cfg \
    $(NVFLASH_FILES_PATH)/nvflash/E1792_Elpida_2GB_EDFA164A2MA_JD_F_924MHz.cfg:flash_e1792_924.cfg \
    $(NVFLASH_FILES_PATH)/nvflash/E1791_Elpida_4GB_edfa232a2ma_792MHz.cfg:flash_e1791_4gb_792.cfg \
    $(NVFLASH_FILES_PATH)/nvflash/E1791_Elpida_4GB_edfa232a2ma_924MHz.cfg:flash_e1791_4gb_924.cfg \
    $(NVFLASH_FILES_PATH)/nvflash/E1761_Hynix_4GB_H5TC4G63AFR_PBA_792Mhz.cfg:flash_e1761_4gb_792.cfg \
    $(NVFLASH_FILES_PATH)/nvflash/E1761_Hynix_2GB_H5TC4G63AFR_PBA_792Mhz.cfg:flash_e1761_2gb_792.cfg \
    $(NVFLASH_FILES_PATH)/nvflash/E1761_Hynix_2GB_H5TC4G63AFR_RDA_924MHz.cfg:flash_e1761_2gb_924.cfg \
    $(NVFLASH_FILES_PATH)/nvflash/E1922_samsung_pop_3GB_K3QF6F60MM_924MHz.cfg:flash_e1922_3gb_924.cfg \
    $(NVFLASH_FILES_PATH)/nvflash/E1923_samsung_pop_3GB_K3QF6F60MM_924MHz.cfg:flash_e1923_3gb_924.cfg \
    $(NVFLASH_FILES_PATH)/nvflash/eks_nokey.dat:eks.dat \
    $(NVFLASH_FILES_PATH)/nvflash/NCT_ardbeg.txt:NCT_ardbeg.txt \
    $(NVFLASH_FILES_PATH)/nvflash/nct_tn8.txt:nct_tn8.txt \
    $(NVFLASH_FILES_PATH)/nvflash/nct_tn8-ffd.txt:nct_tn8-ffd.txt \
    $(NVFLASH_FILES_PATH)/partition_data/config/nvcamera.conf:system/etc/nvcamera.conf \
    $(NVFLASH_FILES_PATH)/nvflash/common_bct.cfg:bct.cfg \
    $(NVFLASH_FILES_PATH)/nvflash/fuse_write.txt:fuse_write.txt \
    $(NVFLASH_FILES_PATH)/nvflash/tn8_bootsplash.bmp:tn8_bootsplash.bmp \
    $(NVFLASH_FILES_PATH)/nvflash/tn8_bootsplash_land.bmp:tn8_bootsplash_land.bmp \
    $(NVFLASH_FILES_PATH)/nvflash/lowbat.bmp:lowbat.bmp \
    $(NVFLASH_FILES_PATH)/nvflash/charging.bmp:charging.bmp \
    $(NVFLASH_FILES_PATH)/nvflash/charged.bmp:charged.bmp \
    $(NVFLASH_FILES_PATH)/nvflash/fullycharged.bmp:fullycharged.bmp \
    $(NVFLASH_FILES_PATH)/nvflash/charging.png:root/res/images/charger/charging.png \
    $(NVFLASH_FILES_PATH)/nvflash/charged.png:root/res/images/charger/charged.png \
    $(NVFLASH_FILES_PATH)/nvflash/fullycharged.png:root/res/images/charger/fullycharged.png \
    $(NVFLASH_FILES_PATH)/nvflash/nvbdktest_plan.txt:nvbdktest_plan.txt

ifeq ($(APPEND_DTB_TO_KERNEL), true)
PRODUCT_COPY_FILES += \
    $(NVFLASH_FILES_PATH)/nvflash/android_fastboot_nvtboot_emmc_full.cfg:flash.cfg
    $(NVFLASH_FILES_PATH)/nvflash/android_fastboot_nvtboot_spi_sata_full.cfg:flash_spi_sata.cfg
else
ifeq ($(BUILD_NV_CRASHCOUNTER),true)
PRODUCT_COPY_FILES += \
    $(NVFLASH_FILES_PATH)/nvflash/android_cc_fastboot_dtb_emmc_full.cfg:flash.cfg \
    $(NVFLASH_FILES_PATH)/nvflash/android_cc_fastboot_nvtboot_dtb_spi_sata_full.cfg:flash_spi_sata.cfg
else
PRODUCT_COPY_FILES += \
    $(NVFLASH_FILES_PATH)/nvflash/android_fastboot_nvtboot_nct_dtb_emmc_full.cfg:flash.cfg \
    $(NVFLASH_FILES_PATH)/nvflash/android_fastboot_nvtboot_dtb_spi_sata_full.cfg:flash_spi_sata.cfg \
    $(NVFLASH_FILES_PATH)/nvflash/android_fastboot_nvtboot_nct_dtb_emmc_full.cfg:flash_nct.cfg \
    $(NVFLASH_FILES_PATH)/nvflash/laguna_android_fastboot_nvtboot_dtb_emmc_full.cfg:laguna_flash.cfg \
    $(NVFLASH_FILES_PATH)/nvflash/tn8_android_fastboot_nvtboot_dtb_emmc_full.cfg:tn8_flash.cfg \
    $(NVFLASH_FILES_PATH)/nvflash/tn8_android_fastboot_nvtboot_dtb_emmc_full_signed.cfg:tn8_flash_signed.cfg \
    $(NVFLASH_FILES_PATH)/nvflash/tn8_android_fastboot_nvtboot_dtb_emmc_full_mfgtest.cfg:tn8diag_flash.cfg \
    $(NVFLASH_FILES_PATH)/nvflash/tn8_android_fastboot_nvtboot_dtb_emmc_full_mfgtest_signed.cfg:tn8diag_flash_signed.cfg

NVFLASH_CFG_BASE_FILE := $(NVFLASH_FILES_PATH)/nvflash/tn8_android_fastboot_nvtboot_dtb_emmc_full.cfg
endif
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/jetson_android_fastboot_nvtboot_dtb_emmc_full.cfg:jetson_flash.cfg

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/flash/fastboot.bin:fastboot.bin \
    $(LOCAL_PATH)/flash/nvflash:nvflash \
    $(LOCAL_PATH)/flash/PM375_Hynix_2GB_H5TC4G63AFR_RDA_924MHz.cfg:flash_pm375_924.cfg

NVFLASH_FILES_PATH :=

# OPENGL AEP permission file
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:system/etc/permissions/android.hardware.opengles.aep.xml

PRODUCT_COPY_FILES += \
    $(call add-to-product-copy-files-if-exists,frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml)

PRODUCT_COPY_FILES += \
  $(LOCAL_PATH)/ueventd.ardbeg.rc:root/ueventd.ardbeg.rc \
  $(LOCAL_PATH)/ueventd.ardbeg.rc:root/ueventd.laguna.rc \
  $(LOCAL_PATH)/ueventd.ardbeg.rc:root/ueventd.tn8.rc \
  $(LOCAL_PATH)/ueventd.ardbeg.rc:root/ueventd.jetson-tk1.rc \
  $(LOCAL_PATH)/ueventd.ardbeg.rc:root/ueventd.ardbeg_sata.rc \
  $(LOCAL_PATH)/tegra-kbc.kl:system/usr/keylayout/tegra-kbc.kl \
  $(LOCAL_PATH)/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
  $(LOCAL_PATH)/Vendor_0955_Product_7210.kl:system/usr/keylayout/Vendor_0955_Product_7210.kl \
  $(LOCAL_PATH)/../common/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
  $(LOCAL_PATH)/../common/wifi_loader.sh:system/bin/wifi_loader.sh \
  $(LOCAL_PATH)/../common/init.comms.rc:root/init.comms.rc \
  $(LOCAL_PATH)/../common/init.ussrd.rc:root/init.ussrd.rc \
  $(LOCAL_PATH)/../common/wpa_supplicant.sh:system/bin/wpa_supplicant.sh \
  $(LOCAL_PATH)/../common/gps_select.sh:system/bin/gps_select.sh \
  $(LOCAL_PATH)/../common/ussr_setup.sh:system/bin/ussr_setup.sh \
  $(LOCAL_PATH)/ussrd.conf:system/etc/ussrd.conf \
  $(LOCAL_PATH)/../common/set_hwui_params.sh:system/bin/set_hwui_params.sh \
  $(LOCAL_PATH)/../common/comms/marvel_wpa.conf:/system/etc/firmware/marvel_wpa.conf \
  $(LOCAL_PATH)/../common/comms/marvel_p2p.conf:/system/etc/firmware/marvel_p2p.conf \
  $(LOCAL_PATH)/../drivers/comms/brcm_wpa.conf:/system/etc/firmware/brcm_wpa.conf \
  $(LOCAL_PATH)/../drivers/comms/brcm_p2p.conf:/system/etc/firmware/brcm_p2p.conf

# t124 SOC rc files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/../common/init.tegra.rc:root/init.tegra.rc \
    $(LOCAL_PATH)/../soc/t124/init.t124.rc:root/init.t124.rc \
    $(LOCAL_PATH)/../common/init.tegra_sata.rc:root/init.tegra_sata.rc \
    $(LOCAL_PATH)/../common/init.tegra_emmc.rc:root/init.tegra_emmc.rc

# p1859 rc files
ifneq ($(wildcard $(LOCAL_PATH)/../p1859),)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/../p1859/init.tegra.p1859.rc:root/init.tegra.p1859.rc \
    $(LOCAL_PATH)/../p1859/init.tegra_emmc.p1859.rc:root/init.tegra_emmc.p1859.rc \
    $(LOCAL_PATH)/../p1859/init.icera.p1859.rc:root/init.icera.p1859.rc \
    $(LOCAL_PATH)/../p1859/rebindEthernet.sh:system/bin/rebindEthernet.sh \
    $(LOCAL_PATH)/../p1859/bt_vendor.p1859.conf:system/etc/bluetooth/bt_vendor.p1859.conf \
    $(LOCAL_PATH)/../p1859/ueventd.p1859.rc:root/ueventd.p1859.rc \
    $(LOCAL_PATH)/../p1859/power.p1859.rc:system/etc/power.p1859.rc \
    $(LOCAL_PATH)/../p1859/init.p1859.rc:root/init.p1859.rc \
    $(LOCAL_PATH)/../p1859/fstab.p1859:root/fstab.p1859
endif

# ardbeg rc files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/power.ardbeg.rc:system/etc/power.ardbeg.rc \
    $(LOCAL_PATH)/power.tn8.rc:system/etc/power.tn8.rc \
    $(LOCAL_PATH)/power.jetson-tk1.rc:system/etc/power.jetson-tk1.rc \
    $(LOCAL_PATH)/init.ardbeg.rc:root/init.ardbeg.rc \
    $(LOCAL_PATH)/init.laguna.rc:root/init.laguna.rc \
    $(LOCAL_PATH)/init.tn8.rc:root/init.tn8.rc \
    $(LOCAL_PATH)/init.jetson-tk1.rc:root/init.jetson-tk1.rc \
    $(LOCAL_PATH)/init.recovery.tn8.rc:root/init.recovery.tn8.rc \
    $(LOCAL_PATH)/init.recovery.jetson-tk1.rc:root/init.recovery.jetson-tk1.rc \
    $(LOCAL_PATH)/init.tn8_common.rc:root/init.tn8_common.rc \
    $(LOCAL_PATH)/init.jetson-tk1_common.rc:root/init.jetson-tk1_common.rc \
    $(LOCAL_PATH)/init.tn8_emmc.rc:root/init.tn8_emmc.rc \
    $(LOCAL_PATH)/init.jetson-tk1_emmc.rc:root/init.jetson-tk1_emmc.rc \
    $(LOCAL_PATH)/init.ardbeg_sata.rc:root/init.ardbeg_sata.rc \
    $(LOCAL_PATH)/fstab.ardbeg:root/fstab.ardbeg \
    $(LOCAL_PATH)/fstab.tn8:root/fstab.tn8 \
    $(LOCAL_PATH)/fstab.jetson-tk1:root/fstab.jetson-tk1 \
    $(LOCAL_PATH)/fstab.laguna:root/fstab.laguna \
    $(LOCAL_PATH)/fstab.ardbeg_sata:root/fstab.ardbeg_sata \
    $(LOCAL_PATH)/init.tn8.usb.rc:root/init.tn8.usb.rc \
    $(LOCAL_PATH)/init.jetson-tk1.usb.rc:root/init.jetson-tk1.usb.rc \
    $(LOCAL_PATH)/../common/init.nv_dev_board.usb.rc:root/init.nv_dev_board.usb.rc \
    $(LOCAL_PATH)/../common/init.tlk.rc:root/init.tlk.rc \
    $(LOCAL_PATH)/../common/init.hdcp.rc:root/init.hdcp.rc

ifeq ($(NO_ROOT_DEVICE),1)
  PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init_no_root_device.rc:root/init.rc
endif

# Face detection model
PRODUCT_COPY_FILES += \
    vendor/nvidia/tegra/core/include/ft/model_frontalface.xml:system/etc/model_frontal.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/../common/cluster:system/bin/cluster \
    $(LOCAL_PATH)/../common/cluster_get.sh:system/bin/cluster_get.sh \
    $(LOCAL_PATH)/../common/cluster_set.sh:system/bin/cluster_set.sh \
    $(LOCAL_PATH)/../common/dcc:system/bin/dcc \
    $(LOCAL_PATH)/../common/hotplug:system/bin/hotplug \
    $(LOCAL_PATH)/../common/mount_debugfs.sh:system/bin/mount_debugfs.sh

PRODUCT_COPY_FILES += \
    device/nvidia/foster/nvcms/device.cfg:system/lib/nvcms/device.cfg

PRODUCT_COPY_FILES += \
    device/nvidia/foster/enctune.conf:system/etc/enctune.conf

ifneq ($(wildcard vendor/nvidia/tegra/core-private),)
    BCMBINARIES_PATH := vendor/nvidia/tegra/3rdparty/bcmbinaries
else ifneq ($(wildcard vendor/nvidia/tegra/prebuilt/ardbeg/3rdparty/bcmbinaries),)
    BCMBINARIES_PATH := vendor/nvidia/tegra/prebuilt/ardbeg/3rdparty/bcmbinaries
else ifneq ($(wildcard vendor/nvidia/tegra/prebuilt/shieldtablet/3rdparty/bcmbinaries),)
    BCMBINARIES_PATH := vendor/nvidia/tegra/prebuilt/shieldtablet/3rdparty/bcmbinaries
endif

# embedded p1859
PRODUCT_PACKAGES += \
    mkbootimg_embedded \
    quickboot \
    quickboot1.bin \
    rcmboot.bin \
    cpu_stage2.bin \
    nvml \
    nvimagegen \
    nvskuflash \
    nvskupreserve

# Nvidia Miracast
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/../common/miracast/com.nvidia.miracast.xml:system/etc/permissions/com.nvidia.miracast.xml

# NvBlit JNI library
PRODUCT_COPY_FILES += \
    vendor/nvidia/tegra/graphics-partner/android/frameworks/Graphics/com.nvidia.graphics.xml:system/etc/permissions/com.nvidia.graphics.xml

#enable Widevine drm
PRODUCT_PROPERTY_OVERRIDES += drm.service.enabled=true

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise


# Enable secure USB debugging in user release build
ifeq ($(TARGET_BUILD_TYPE),release)
ifeq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.adb.secure=1
endif
endif

# Copy public/private tnspecs
ifeq ($(wildcard vendor/nvidia/ardbeg/tnspec.json),vendor/nvidia/ardbeg/tnspec.json)
PRODUCT_COPY_FILES += vendor/nvidia/ardbeg/tnspec.json:tnspec.json
else ifeq ($(wildcard $(LOCAL_PATH)/tnspec.json),$(LOCAL_PATH)/tnspec.json)
PRODUCT_COPY_FILES += $(LOCAL_PATH)/tnspec.json:tnspec-public.json
endif

## Blake firmware files
LOCAL_BLAKE_FW_PATH=vendor/nvidia/blake/firmware/firmware-bin
PRODUCT_COPY_FILES += \
    $(call add-to-product-copy-files-if-exists, $(LOCAL_BLAKE_FW_PATH)/nVidiaBlake-UPDATE.ozu:system/etc/firmware/nVidiaBlake-UPDATE.ozu) \
    $(call add-to-product-copy-files-if-exists, $(LOCAL_BLAKE_FW_PATH)/nVidiaBlake-UPDATE.xmg:system/etc/firmware/nVidiaBlake-UPDATE.xmg) \
    $(call add-to-product-copy-files-if-exists, $(LOCAL_BLAKE_FW_PATH)/touchpad_fw.bin:system/etc/firmware/touchpad_fw.bin) \
    $(call add-to-product-copy-files-if-exists, $(LOCAL_BLAKE_FW_PATH)/touchbutton_fw.bin:system/etc/firmware/touchbutton_fw.bin)
