-- --- YOUR CUSTOM MAPPINGS ---
hl.bind("SUPER + R", hl.dsp.exec_cmd("dms ipc call spotlight toggle"))
-- hl.bind("SUPER + Space", hl.dsp.exec_cmd("dms ipc call spotlight toggle")) -- Freed up
hl.bind("SUPER + P", hl.dsp.exec_cmd("dms ipc call widget toggle clock"))
hl.bind("SUPER + SHIFT + D", hl.dsp.exec_cmd("dms ipc call clipboard toggle"))
hl.bind("SUPER + Z", hl.dsp.exec_cmd("dms ipc call dankdash wallpaper"))
hl.bind("SUPER + B", hl.dsp.exec_cmd("dms ipc call widget toggle controlCenterButton"))
hl.bind("SUPER + I", hl.dsp.exec_cmd("dms ipc call settings toggle"))
hl.bind("SUPER + M", hl.dsp.exec_cmd("wlogout || hyprctl dispatch exit")) 
hl.bind("SUPER + L", hl.dsp.exec_cmd("$dms ipc call lock lock"))

-- --- ORIGINAL DMS BINDS (Untouched) ---
hl.unbind("SUPER + SHIFT + N")
hl.bind("SUPER + N", hl.dsp.exec_cmd("dms ipc call widget toggle controlCenterButton"))
hl.bind("SUPER + SHIFT + N", hl.dsp.exec_cmd("dms ipc call notepad toggle"))
hl.bind("SUPER + J", hl.dsp.exec_cmd("dms ipc call bar toggle index 0"))