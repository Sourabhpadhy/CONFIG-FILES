-- --- YOUR CUSTOM MAPPINGS ---
hl.bind("SUPER + R", hl.dsp.exec_cmd("caelestia shell drawers toggle launcher"))
-- hl.bind("SUPER + Space", hl.dsp.global("caelestia:launcher")) -- Freed up
hl.bind("SUPER + P", hl.dsp.global("caelestia:showall"))
hl.bind("SUPER + SHIFT + D", hl.dsp.exec_cmd("pkill fuzzel || caelestia clipboard"))
hl.bind("SUPER + X", hl.dsp.global("caelestia:sidebar"))
hl.bind("SUPER + Z", hl.dsp.exec_cmd("caelestia wallpaper --random"))
hl.bind("SUPER + I", hl.dsp.exec_cmd("gnome-control-center"))
hl.bind("SUPER + M", hl.dsp.global("caelestia:session"))
hl.bind("SUPER + L", hl.dsp.global("caelestia:lock"))

-- --- CONFLICT RESOLUTIONS ---
hl.bind("SUPER + ALT + Period", hl.dsp.exec_cmd("pkill fuzzel || caelestia emoji -p"))

-- --- ORIGINAL CAELESTIA BINDS (Untouched) ---
hl.bind("SUPER + mouse:272", hl.dsp.global("caelestia:launcherInterrupt"))
hl.bind("SUPER + mouse:273", hl.dsp.global("caelestia:launcherInterrupt"))
hl.bind("SUPER + mouse:274", hl.dsp.global("caelestia:launcherInterrupt"))
hl.bind("SUPER + mouse:275", hl.dsp.global("caelestia:launcherInterrupt"))
hl.bind("SUPER + mouse:276", hl.dsp.global("caelestia:launcherInterrupt"))
hl.bind("SUPER + mouse:277", hl.dsp.global("caelestia:launcherInterrupt"))
hl.bind("SUPER + mouse_up", hl.dsp.global("caelestia:launcherInterrupt"))
hl.bind("SUPER + mouse_down", hl.dsp.global("caelestia:launcherInterrupt"))

hl.bind("CTRL + SUPER + Space", hl.dsp.global("caelestia:mediaToggle"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.global("caelestia:mediaToggle"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.global("caelestia:mediaToggle"), { locked = true })
hl.bind("CTRL + SUPER + Equal", hl.dsp.global("caelestia:mediaNext"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.global("caelestia:mediaNext"), { locked = true })
hl.bind("CTRL + SUPER + Minus", hl.dsp.global("caelestia:mediaPrev"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.global("caelestia:mediaPrev"), { locked = true })
hl.bind("XF86AudioStop", hl.dsp.global("caelestia:mediaStop"), { locked = true })

hl.bind("SUPER + CTRL + ALT + U", hl.dsp.exec_cmd("~/.local/bin/switch.sh"))
hl.bind("SUPER + ALT + V", hl.dsp.exec_cmd("pkill fuzzel || caelestia clipboard -d"))
hl.bind("Print", hl.dsp.exec_cmd("caelestia screenshot"), { locked = true })
hl.bind("SUPER + SHIFT + S", hl.dsp.global("caelestia:screenshotFreeze"))
hl.bind("SUPER + SHIFT + ALT + S", hl.dsp.global("caelestia:screenshot"))
hl.bind("SUPER + ALT + R", hl.dsp.exec_cmd("caelestia record -s"))
hl.bind("CTRL + ALT + R", hl.dsp.exec_cmd("caelestia record"))
hl.bind("SUPER + SHIFT + ALT + R", hl.dsp.exec_cmd("caelestia record -r"))
hl.bind("SUPER + SHIFT + C", hl.dsp.exec_cmd("hyprpicker -a"))

hl.bind("SUPER + R", hl.dsp.exec_cmd("caelestia shell drawers toggle launcher"))
