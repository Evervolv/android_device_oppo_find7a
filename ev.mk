# Copyright (C) 2010 The Android Open Source Project
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
# This file is the build configuration for a full Android
# build for grouper hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

# Sample: This is where we'd set a backup provider if we had one
# $(call inherit-product, device/sample/products/backup_overlay.mk)

# Get the prebuilt list of APNs
$(call inherit-product, vendor/ev/config/gsm.mk)

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Inherit from our custom product configuration
$(call inherit-product, vendor/ev/config/common.mk)

# Inherit from hardware-specific part of the product configuration
$(call inherit-product, device/oppo/find7a/device.mk)

# Discard inherited values and use our own instead.
PRODUCT_NAME := ev_find7a
PRODUCT_DEVICE := find7a
PRODUCT_BRAND := Oppo
PRODUCT_MODEL := Find7a
PRODUCT_MANUFACTURER := Oppo

# Inline kernel
TARGET_KERNEL_SOURCE := kernel/oppo/msm8974
TARGET_KERNEL_CONFIG := msm8974_find7_defconfig

# Inherit from proprietary blobs
$(call inherit-product-if-exists, vendor/oppo/find7a/find7a-vendor.mk)

