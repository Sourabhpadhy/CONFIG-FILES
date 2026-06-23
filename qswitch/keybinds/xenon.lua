local xenon = "qs -c xenon ipc call "

-- --- YOUR CUSTOM MAPPINGS ---
hl.bind("SUPER + R", hl.dsp.exec_cmd(xenon .. "launcher toggle"))
-- hl.bind("SUPER + Space", hl.dsp.exec_cmd(xenon .. "launcher toggle")) -- Freed up
hl.bind("SUPER + X", hl.dsp.exec_cmd(xenon .. "sidePanel toggle"))
hl.bind("SUPER + SHIFT + D", hl.dsp.exec_cmd(xenon .. "clipboard toggle"))
hl.bind("SUPER + Z", hl.dsp.exec_cmd(xenon .. "wallpaperpanel toggle"))
hl.bind("SUPER + I", hl.dsp.exec_cmd("gnome-control-center")) 
hl.bind("SUPER + M", hl.dsp.exec_cmd("wlogout || hyprctl dispatch exit")) 
hl.bind("SUPER + L", hl.dsp.exec_cmd(xenon .. "lock lock"))

-- --- ORIGINAL XENON BINDS (Untouched) ---
hl.bind("SUPER + CTRL + L", hl.dsp.exec_cmd(xenon .. "sidePanel toggleLock"))