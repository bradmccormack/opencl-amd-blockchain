#!/bin/bash

# TODO update the PKGBUILD automatically ( possibly use this as a webhook endpoint to update the package for me)

DRIVER_NOTES_URL="http://support.amd.com/en-us/kb-articles/Pages/AMDGPU-Pro-Beta-Mining-Driver-for-Linux-Release-Notes.aspx"
DRIVER_URL_PREFIX="drivers/linux/beta/ubuntu/amdgpu-pro-"

DRIVER_DETAILS=$(wget -O - -o /dev/null ${DRIVER_NOTES_URL} | grep "${DRIVER_URL_PREFIX}")

major="$(cat "${DRIVER_DETAILS}"cxz | cut -d- -f3)"
#minor=${DRIVER_DETAILS[]}

printf "\\nMajor is ${major}"


#<a href="https://www2.ati.com/drivers/linux/beta/ubuntu/amdgpu-pro-17.40-483984.tar.xz">AMDGPU-Pro Beta Mining Driver Version 17.40 for Ubuntu 16.04.3</a>
