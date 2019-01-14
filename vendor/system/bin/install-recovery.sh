#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 10035200 b0832f62764e47c9e86b2748ca19d645235ab41f 6469632 ebcfc67ec3ffae78dc0a140bd700f902f62cea3f
fi
if ! applypatch -c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery:10035200:b0832f62764e47c9e86b2748ca19d645235ab41f; then
  applypatch  EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot:6469632:ebcfc67ec3ffae78dc0a140bd700f902f62cea3f EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery b0832f62764e47c9e86b2748ca19d645235ab41f 10035200 ebcfc67ec3ffae78dc0a140bd700f902f62cea3f:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
