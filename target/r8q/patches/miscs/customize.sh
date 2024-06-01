SKIPUNZIP=1

echo "Fix up /product/etc/build.prop"
sed -i "/# Removed by /d" "$WORK_DIR/product/etc/build.prop" \
    && sed -i "s/#bluetooth./bluetooth./g" "$WORK_DIR/product/etc/build.prop" \
    && sed -i "s/?=/=/g" "$WORK_DIR/product/etc/build.prop" \
    && sed -i "$(sed -n "/provisioning.hostname/=" "$WORK_DIR/product/etc/build.prop" | sed "2p;d")d" "$WORK_DIR/product/etc/build.prop"

echo "Disable OEM unlock toggle"
sed -i \
    "$(sed -n "/ro.oem_unlock_supported/=" "$WORK_DIR/vendor/default.prop") cro.oem_unlock_supported=0" \
    "$WORK_DIR/vendor/default.prop"

echo "Enable HFR"
sed -i 's/ro.surface_flinger.use_content_detection_for_refresh_rate=false/ro.surface_flinger.use_content_detection_for_refresh_rate=true/g' "$WORK_DIR/vendor/default.prop"
    {
echo "ro.surface_flinger.enable_frame_rate_override=false"
echo "ro.surface_flinger.set_idle_timer_ms=250"
echo "ro.surface_flinger.set_touch_timer_ms=300"
echo "ro.surface_flinger.set_display_power_timer_ms=300"
    } >> "$WORK_DIR/vendor/default.prop"
