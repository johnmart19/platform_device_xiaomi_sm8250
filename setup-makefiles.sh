#!/bin/bash
#
# Copyright (C) 2020 The LineageOS Project
# Copyright (C) 2021 Syberia Project
#
# SPDX-License-Identifier: Apache-2.0
#

set -e

DEVICE_COMMON=sm8250-common
VENDOR=xiaomi

INITIAL_COPYRIGHT_YEAR=2021

# Load extract_utils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "${MY_DIR}" ]]; then MY_DIR="${PWD}"; fi

SYBERIA_ROOT="${MY_DIR}/../../.."

HELPER="${SYBERIA_ROOT}/vendor/syberia/build/tools/extract_utils.sh"
if [ ! -f "${HELPER}" ]; then
    echo "Unable to find helper script at ${HELPER}"
    exit 1
fi
source "${HELPER}"

# Initialize the helper for common
setup_vendor "${DEVICE_COMMON}" "${VENDOR}" "${SYBERIA_ROOT}" true

# Copyright headers and guards
write_headers "alioth thyme"

# The standard common blobs
write_makefiles "${MY_DIR}/proprietary-files.txt" true

# We are done!
write_footers
