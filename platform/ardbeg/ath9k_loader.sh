#!/system/bin/sh

# Copyright (c) 2012-2014, NVIDIA CORPORATION.  All rights reserved.
#
# NVIDIA CORPORATION and its licensors retain all intellectual property
# and proprietary rights in and to this software, related documentation
# and any modifications thereto.  Any use, reproduction, disclosure or
# distribution of this software and related documentation without an express
# license agreement from NVIDIA CORPORATION is strictly prohibited.

if [ $(getprop ro.hardware) == "jetson-tk1" ]; then
	/system/bin/log -t "wifiloader" -p i "jetson-tk1 device is detected"
	if [ -e /system/lib/modules/ath9k.ko ]; then
		insmod /system/lib/modules/ath.ko
        insmod /system/lib/modules/ath9k_hw.ko
        insmod /system/lib/modules/ath9k_common.ko
        insmod /system/lib/modules/ath9k.ko
        insmod /system/lib/modules/hidp.ko
        insmod /system/lib/modules/bnep.ko
        insmod /system/lib/modules/rfcomm.ko
        insmod /system/lib/modules/btusb.ko
        insmod /system/lib/modules/hci_uart.ko
        insmod /system/lib/modules/ath3k.ko
	else
		/system/bin/log -t "wifiloader" -p i "KO not found, compiled part of kernel"
        fi
		if [ ! -f /data/misc/wifi/wpa_supplicant.conf ]
	then
		/system/bin/log -t "wifiloader" -p i  "ATH9: WLAN0 copy /system/etc/firmware/brcm_wpa.conf"
		cp /system/etc/wifi/wpa_supplicant.conf /data/misc/wifi/wpa_supplicant.conf
		if [ $(getprop ro.build.version.sdk) -gt 22 ]; then
			/system/bin/log -t "wifiloader" -p i  "ATH9: WLAN0 enable WOW triggers"
			echo "wowlan_triggers=any" >> /data/misc/wifi/wpa_supplicant.conf
		fi
		chmod 0660 /data/misc/wifi/wpa_supplicant.conf
		chown system:wifi /data/misc/wifi/wpa_supplicant.conf
	elif [ -f /data/misc/wifi/wpa_supplicant.conf ]; then
		wowlan_trigger_found=$(grep wowlan_triggers /data/misc/wifi/wpa_supplicant.conf)
		if [ -z $wowlan_trigger_found ]; then
			echo "wowlan_triggers=any" >> /data/misc/wifi/wpa_supplicant.conf
		fi
	fi

	    if [ ! -f /data/misc/wifi/p2p_supplicant.conf ]
	then
		/system/bin/log -t "wifiloader" -p i  "ATH9: p2p copy /system/etc/firmware/brcm_p2p.conf"
		cp /system/etc/wifi/p2p_supplicant.conf /data/misc/wifi/p2p_supplicant.conf
		chmod 0660 /data/misc/wifi/p2p_supplicant.conf
		chown system:wifi /data/misc/wifi/p2p_supplicant.conf
	fi
fi

#increase the wmem default and wmem max size
echo 262144 > /proc/sys/net/core/wmem_default
echo 262144 > /proc/sys/net/core/wmem_max
