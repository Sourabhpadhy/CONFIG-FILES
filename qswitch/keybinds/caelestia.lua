-- #######################################################################################
-- QSWITCH PROFILE: CAELESTIA / MIDNIGHT SHELL
-- #######################################################################################

local home = os.getenv("HOME")
local hyprScripts = home .. "/.config/hypr/hyprland/scripts"

-----------------------------------------------------------------------------------------
-- 1. SAFE UNBINDS (Clear base fallbacks overridden by this profile)
-----------------------------------------------------------------------------------------
local unbinds = {
	"SUPER + R", "SUPER + A", "SUPER + P", "SUPER + I", "SUPER + M", "SUPER + L",
	"SUPER + SHIFT + D", "SUPER + ALT + V", "SUPER + Z", "SUPER + X", "SUPER + B",
	"SUPER + Slash", "SUPER + ALT + K", "SUPER + SHIFT + C", "SUPER + ALT + Period",
	"SUPER + SHIFT + S", "SUPER + SHIFT + ALT + S", "Print", "CTRL + Print",
	"SUPER + ALT + R", "CTRL + ALT + R", "SUPER + SHIFT + ALT + R",
	"CTRL + SUPER + Space", "CTRL + SUPER + Equal", "CTRL + SUPER + Minus",
	"XF86AudioPlay", "XF86AudioPause", "XF86AudioNext", "XF86AudioPrev", "XF86AudioStop",
	"CTRL + SUPER + R"
}
for _, key in ipairs(unbinds) do
	pcall(hl.unbind, key)
end

-----------------------------------------------------------------------------------------
-- 2. LAYER RULES & SHELL INTEGRATION
-----------------------------------------------------------------------------------------
hl.layer_rule({ target = "caelestia-.*", blur = true, ignore_zero = true })
hl.layer_rule({ target = "caelestia-drawers", blur = true, ignore_zero = true })
hl.layer_rule({ target = "caelestia-bar", blur = true, ignore_zero = true })
hl.layer_rule({ target = "caelestia-osd", blur = true, ignore_zero = true })

-----------------------------------------------------------------------------------------
-- 3. UNIFIED MATRIX BINDINGS (Zero Duplications)
-----------------------------------------------------------------------------------------
-- Shell Switcher (Strictly mapped to QSwitch)
hl.bind("SUPER + ALT + V", hl.dsp.exec_cmd(home .. "/.local/bin/switch.sh"), { description = "Launch QSwitch shell switcher" })

-- Navigation & Overlays
hl.bind("SUPER + R", hl.dsp.exec_cmd("caelestia shell drawers toggle launcher"), { description = "Toggle Caelestia launcher drawer" })
hl.bind("SUPER + A", hl.dsp.global("caelestia:showall"), { description = "Toggle workspace window overview" })
hl.bind("SUPER + P", hl.dsp.global("caelestia:showall"), { description = "Show all workspace windows" })
hl.bind("SUPER + I", hl.dsp.exec_cmd("gnome-control-center"), { description = "Open settings control center" })
hl.bind("SUPER + M", hl.dsp.global("caelestia:session"), { description = "Toggle Caelestia session menu" })
hl.bind("SUPER + L", hl.dsp.global("caelestia:lock"), { description = "Lock session via Caelestia" })

-- Drawers & Pickers (SUPER + X handles sidebar; SUPER + B left unmapped to avoid duplicates)
hl.bind("SUPER + SHIFT + D", hl.dsp.exec_cmd("pkill fuzzel || caelestia clipboard"), { description = "Toggle Caelestia clipboard history" })
hl.bind("SUPER + Z", hl.dsp.exec_cmd("caelestia wallpaper --random"), { description = "Change wallpaper" })
hl.bind("SUPER + X", hl.dsp.global("caelestia:sidebar"), { description = "Toggle Caelestia sidebar drawer" })
hl.bind("SUPER + ALT + Period", hl.dsp.exec_cmd("pkill fuzzel || caelestia emoji -p"), { description = "Toggle emoji picker" })
hl.bind("SUPER + SHIFT + C", hl.dsp.exec_cmd("hyprpicker -a"), { description = "Pick color #RRGGBB >> clipboard" })

-- Cheatsheet, Virtual Keyboard & Shell Management
hl.bind("SUPER + Slash", hl.dsp.exec_cmd("notify-send 'Keybinds' 'SUPER+R: Launcher | SUPER+A: Overview | SUPER+I: Settings | SUPER+ALT+V: QSwitch'"), { description = "Keybind hints notification" })
hl.bind("SUPER + ALT + K", hl.dsp.exec_cmd("command -v wvkbd-mobintl >/dev/null 2>&1 && pkill wvkbd-mobintl || wvkbd-mobintl -L 300 || squeekboard"), { description = "Toggle virtual keyboard" })
hl.bind("CTRL + SUPER + R", hl.dsp.exec_cmd("killall caelestia 2>/dev/null; caelestia &"), { description = "Restart Caelestia shell" })

-----------------------------------------------------------------------------------------
-- 4. CAPTURE & RECORDING
-----------------------------------------------------------------------------------------
-- Screenshots
hl.bind("SUPER + SHIFT + S", hl.dsp.global("caelestia:screenshotFreeze"), { description = "Frozen screen region snip" })
hl.bind("SUPER + SHIFT + ALT + S", hl.dsp.global("caelestia:screenshot"), { description = "Live screen region snip" })
hl.bind("Print", hl.dsp.exec_cmd("caelestia screenshot"), { locked = true, description = "Screenshot >> clipboard" })
hl.bind("CTRL + Print", hl.dsp.exec_cmd("caelestia screenshot"), { locked = true, description = "Screenshot >> clipboard" })

-- Screen Recording
hl.bind("SUPER + ALT + R", hl.dsp.exec_cmd("caelestia record -s"), { locked = true, description = "Record selected screen region" })
hl.bind("CTRL + ALT + R", hl.dsp.exec_cmd("caelestia record"), { locked = true, description = "Record fullscreen" })
hl.bind("SUPER + SHIFT + ALT + R", hl.dsp.exec_cmd("caelestia record -r"), { locked = true, description = "Record fullscreen with audio" })

-----------------------------------------------------------------------------------------
-- 5. CAELESTIA NATIVE IPC MEDIA CONTROLS
-----------------------------------------------------------------------------------------
hl.bind("CTRL + SUPER + Space", hl.dsp.global("caelestia:mediaToggle"), { locked = true, description = "Media play/pause" })
hl.bind("XF86AudioPlay", hl.dsp.global("caelestia:mediaToggle"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.global("caelestia:mediaToggle"), { locked = true })

hl.bind("CTRL + SUPER + Equal", hl.dsp.global("caelestia:mediaNext"), { locked = true, description = "Media track next" })
hl.bind("XF86AudioNext", hl.dsp.global("caelestia:mediaNext"), { locked = true })

hl.bind("CTRL + SUPER + Minus", hl.dsp.global("caelestia:mediaPrev"), { locked = true, description = "Media track previous" })
hl.bind("XF86AudioPrev", hl.dsp.global("caelestia:mediaPrev"), { locked = true })

hl.bind("XF86AudioStop", hl.dsp.global("caelestia:mediaStop"), { locked = true, description = "Media stop" })

-----------------------------------------------------------------------------------------
-- 6. UNIQUE CAELESTIA CAPABILITIES (Mouse Drawer Interrupts)
-----------------------------------------------------------------------------------------
-- Prevents window drag/resize operations from conflicting while drawers are open
hl.bind("SUPER + mouse:272", hl.dsp.global("caelestia:launcherInterrupt"))
hl.bind("SUPER + mouse:273", hl.dsp.global("caelestia:launcherInterrupt"))
hl.bind("SUPER + mouse:274", hl.dsp.global("caelestia:launcherInterrupt"))
hl.bind("SUPER + mouse:275", hl.dsp.global("caelestia:launcherInterrupt"))
hl.bind("SUPER + mouse:276", hl.dsp.global("caelestia:launcherInterrupt"))
hl.bind("SUPER + mouse:277", hl.dsp.global("caelestia:launcherInterrupt"))
hl.bind("SUPER + mouse_up", hl.dsp.global("caelestia:launcherInterrupt"))
hl.bind("SUPER + mouse_down", hl.dsp.global("caelestia:launcherInterrupt"))

-- AI text summary fallback matching global setup
hl.bind("SUPER + SHIFT + ALT + mouse:273", hl.dsp.exec_cmd("bash " .. hyprScripts .. "/ai/primary-buffer-query.sh"), { description = "Generate AI summary for selected text" })
