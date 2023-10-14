#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

cat > target/linux/x86/patches-5.15/199-add-mt7921k-pci-device-id << EOF
--- a/drivers/net/wireless/mt76/mt7921/pci.c
+++ b/drivers/net/wireless/mt76/mt7921/pci.c
@@ -14,6 +14,8 @@

 static const struct pci_device_id mt7921_pci_device_table[] = {
        { PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, 0x7961) },
+       { PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, 0x0608) },
+       { PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, 0x0616) },
        { },
 };
EOF
