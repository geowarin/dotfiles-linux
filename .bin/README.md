
grub-install --target=x86_64-efi --efi-directory=/boot --removable

## Firefox

defaultPref("mousewheel.default.delta_multiplier_x", 240);
defaultPref("mousewheel.default.delta_multiplier_y", 120);
defaultPref("general.smoothScroll.msdPhysics.enabled", true);