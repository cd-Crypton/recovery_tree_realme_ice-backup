# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 SebaUbuntu's TWRP device tree generator
# SPDX-License-Identifier: Apache-2.0

# Device Path
DEVICE_PATH := device/$(PRODUCT_BRAND)/$(PRODUCT_DEVICE)

# For Minimal Manifest
ALLOW_MISSING_DEPENDENCIES := true

# A/B Flags
BOARD_USES_RECOVERY_AS_BOOT := true
TARGET_NO_RECOVERY := true

# Build
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := 
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := kryo300

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a75

# APEX
DEXPREOPT_GENERATE_APEX_IMAGE := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := $(PRODUCT_PLATFORM)
TARGET_NO_BOOTLOADER := false

# Kernel
BOARD_BOOTIMG_HEADER_VERSION := 3
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_KERNEL_CMDLINE += console=ttyMSM0,115200n8 androidboot.hardware=qcom androidboot.console=ttyMSM0 androidboot.memcg=1 lpm_levels.sleep_disabled=1 video=vfb:640x400,bpp=32,memsize=3072000 msm_rtb.filter=0x237 service_locator.enable=1 androidboot.usbcontroller=a600000.dwc3 swiotlb=0 loop.max_part=7 cgroup.memory=nokmem,nosocket pcie_ports=compat loop.max_part=7 iptable_raw.raw_before_defrag=1 ip6table_raw.raw_before_defrag=1 kpti=off iptable_raw.raw_before_defrag=1
BOARD_KERNEL_CMDLINE += androidboot.init_fatal_reboot_target=recovery
BOARD_KERNEL_CMDLINE += twrpfastboot=1
BOARD_KERNEL_IMAGE_NAME := kernel
TARGET_KERNEL_CONFIG := $(PRODUCT_DEVICE)_defconfig
TARGET_KERNEL_SOURCE := kernel/$(PRODUCT_BRAND)/$(PRODUCT_DEVICE)

# Kernel - prebuilt
TARGET_FORCE_PREBUILT_KERNEL := true
ifeq ($(TARGET_FORCE_PREBUILT_KERNEL),true)
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/ice/$(BOARD_KERNEL_IMAGE_NAME)
endif

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 201326592
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_USES_METADATA_PARTITION := true

# Super Partitions
BOARD_SUPER_PARTITION_SIZE := 9126805504 # TODO: Fix hardcoded value
BOARD_SUPER_PARTITION_GROUPS := qualcomm_dynamic_partitions
BOARD_QUALCOMM_DYNAMIC_PARTITIONS_PARTITION_LIST := system system_ext product vendor odm
BOARD_QUALCOMM_DYNAMIC_PARTITIONS_SIZE := 9122611200 # TODO: Fix hardcoded value

# File-system Type
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4

# Copy-out Hacks
TARGET_COPY_OUT_SYSTEM := system
TARGET_COPY_OUT_VENDOR := vendor

# Platform
BOARD_USES_QCOM_HARDWARE := true
TARGET_BOARD_PLATFORM := $(PRODUCT_PLATFORM)
QCOM_BOARD_PLATFORMS := $(PRODUCT_PLATFORM)

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USES_MKE2FS := true

# Avb
BOARD_AVB_ENABLE := true
BOARD_AVB_VBMETA_SYSTEM := system
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 1

# Patch and Version
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)
PLATFORM_VERSION := 99.87.36
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)
BOARD_SUPPRESS_SECURE_ERASE := true
BOARD_USES_QCOM_FBE_DECRYPTION := true

# Properties
TARGET_SYSTEM_PROP := $(DEVICE_PATH)/properties/system.prop
TARGET_VENDOR_PROP := $(DEVICE_PATH)/properties/vendor.prop

# TWRP Configuration
TW_THEME := portrait_hdpi
TW_EXTRA_LANGUAGES := true
TW_NO_SCREEN_BLANK := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_USE_TOOLBOX := true
TW_INCLUDE_REPACKTOOLS := true
TW_EXTRA_LANGUAGES := true
TW_INCLUDE_NTFS_3G := true
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_LIBRESETPROP := true
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel0-backlight/brightness"
TW_MAX_BRIGHTNESS := 2047
TW_DEFAULT_BRIGHTNESS := 1200
TW_EXCLUDE_APEX := true
TW_HAS_EDL_MODE := true
TW_BACKUP_EXCLUSIONS := /data/fonts
TW_LOAD_VENDOR_MODULES := "adsp_loader_dlkm.ko apr_dlkm.ko msm_drm.ko q6_notifier_dlkm.ko q6_pdr_dlkm.ko snd_event_dlkm.ko"

# Decryption
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true

# Version/Maintainer
TW_DEVICE_VERSION := Crypton

# Debuging flags
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
