-- #######################################################################################
-- QSWITCH PROFILE: II (END-4 / ILLOGICAL IMPULSE / END4-PC)
-- #######################################################################################

local home = os.getenv("HOME")
local qsConfig = "end4-pC"
local qsScripts = home .. "/.config/quickshell/" .. qsConfig .. "/scripts"
local hyprScripts = home .. "/.config/hypr/hyprland/scripts"

-----------------------------------------------------------------------------------------
-- 1. SAFE UNBINDS (Clear base fallbacks overridden by this profile)
-----------------------------------------------------------------------------------------
local unbinds = {
	"SUPER + R", "SUPER + A", "SUPER + P", "SUPER + I", "SUPER + M", "SUPER + L",
	"SUPER + SHIFT + D", "SUPER + ALT + V", "SUPER + Z", "SUPER + X", "SUPER + B",
	"SUPER + J", "SUPER + Slash", "SUPER + ALT + K", "SUPER + SHIFT + C",
	"SUPER + ALT + Period", "SUPER + SHIFT + S", "SUPER + SHIFT + ALT + S",
	"Print", "CTRL + Print", "SUPER + ALT + R", "CTRL + ALT + R", "SUPER + SHIFT + ALT + R",
	"CTRL + SUPER + Space", "CTRL + SUPER + Equal", "CTRL + SUPER + Minus",
	"CTRL + SUPER + P", "CTRL + SUPER + R", "SUPER + SHIFT + M",
	"SUPER + SHIFT + A", "SUPER + SHIFT + X", "SUPER + SHIFT + T"
}
for _, key in ipairs(unbinds) do
	pcall(hl.unbind, key)
end

-----------------------------------------------------------------------------------------
-- 2. LAYER RULES & SHELL INTEGRATION
-----------------------------------------------------------------------------------------
hl.layer_rule({ target = "quickshell:.*", blur = true, ignore_zero = true })
hl.layer_rule({ target = "corner.*", blur = true, ignore_zero = true })
hl.layer_rule({ target = "bar", blur = true, ignore_zero = true })

-- Load isolated End-4 rules so they do not leak into other desktop shells
local ii_rules = home .. "/.config/hypr/hyprland/ii-rules.lua"
local f = io.open(ii_rules, "r")
if f then
	f:close()
	pcall(dofile, ii_rules)
end

-----------------------------------------------------------------------------------------
-- 3. UNIFIED MATRIX BINDINGS (Zero Duplications)
-----------------------------------------------------------------------------------------
-- Shell Switcher (Strictly mapped to QSwitch)
hl.bind("SUPER + ALT + V", hl.dsp.exec_cmd(home .. "/.local/bin/switch.sh"), { description = "Launch QSwitch shell switcher" })

-- Navigation & Overlays
hl.bind("SUPER + R", hl.dsp.global("quickshell:searchToggleRelease"), { description = "Toggle Quickshell search" })
hl.bind("SUPER + A", hl.dsp.global("quickshell:overviewWorkspacesToggle"), { description = "Toggle workspace overview" })
hl.bind("SUPER + P", hl.dsp.global("quickshell:overlayToggle"), { description = "Toggle widget overlay" })
hl.bind("SUPER + I", hl.dsp.global("quickshell:settingsToggle"), { description = "Toggle settings dashboard" })
hl.bind("SUPER + M", hl.dsp.global("quickshell:sessionToggle"), { description = "Toggle session power menu" })
hl.bind("SUPER + L", hl.dsp.exec_cmd("loginctl lock-session || hyprlock"), { description = "Lock session" })

-- Drawers & Pickers
hl.bind("SUPER + SHIFT + D", hl.dsp.global("quickshell:overviewClipboardToggle"), { description = "Toggle clipboard history" })
hl.bind("SUPER + Z", hl.dsp.global("quickshell:wallpaperSelectorToggle"), { description = "Toggle wallpaper picker" })
hl.bind("SUPER + X", hl.dsp.global("quickshell:sidebarLeftToggle"), { description = "Toggle left sidebar" })
hl.bind("SUPER + B", hl.dsp.global("quickshell:sidebarRightToggle"), { description = "Toggle right sidebar" })
hl.bind("SUPER + ALT + Period", hl.dsp.global("quickshell:overviewEmojiToggle"), { description = "Toggle emoji picker" })
hl.bind("SUPER + SHIFT + C", hl.dsp.exec_cmd("hyprpicker -a"), { description = "Pick color #RRGGBB >> clipboard" })

-- Media Controls (IPC & Widget)
hl.bind("CTRL + SUPER + Space", hl.dsp.global("quickshell:mediaControlsToggle"), { description = "Toggle media controls widget" })
hl.bind("CTRL + SUPER + Equal", hl.dsp.exec_cmd("playerctl next"), { locked = true, description = "Media next track" })
hl.bind("CTRL + SUPER + Minus", hl.dsp.exec_cmd("playerctl previous"), { locked = true, description = "Media previous track" })
hl.bind("SUPER + SHIFT + M", hl.dsp.global("quickshell:mediaControlsToggle"), { description = "Toggle media overlay" })

-- Cheatsheet, Virtual Keyboard & Shell Management
hl.bind("SUPER + Slash", hl.dsp.global("quickshell:cheatsheetToggle"), { description = "Toggle keybind cheatsheet" })
hl.bind("SUPER + ALT + K", hl.dsp.global("quickshell:oskToggle"), { description = "Toggle on-screen keyboard" })
hl.bind("CTRL + SUPER + R", hl.dsp.exec_cmd("killall ydotool qs quickshell 2>/dev/null; qs -c " .. qsConfig .. " &"), { description = "Restart Quickshell" })

-----------------------------------------------------------------------------------------
-- 4. CAPTURE & RECORDING
-----------------------------------------------------------------------------------------
-- Screenshots
hl.bind("SUPER + SHIFT + S", hl.dsp.global("quickshell:regionScreenshot"), { description = "Screen region snip" })
hl.bind("SUPER + SHIFT + ALT + S", hl.dsp.global("quickshell:regionScreenshot"), { description = "Direct screen snip" })

local grimhyprctl = "grim -o \"$(hyprctl activeworkspace -j | jq -r '.monitor')\""
hl.bind("Print", hl.dsp.exec_cmd("bash -c '" .. grimhyprctl .. " - | wl-copy'"), { locked = true, description = "Active monitor screenshot >> clipboard" })
hl.bind("CTRL + Print", hl.dsp.exec_cmd("bash -c 'mkdir -p $(xdg-user-dir PICTURES)/Screenshots && " .. grimhyprctl .. " - | tee $(xdg-user-dir PICTURES)/Screenshots/Screenshot_$(date +%Y-%m-%d_%H.%M.%S).png | wl-copy'"), { locked = true, description = "Active monitor screenshot >> file & clipboard" })

-- Screen Recording
hl.bind("SUPER + ALT + R", hl.dsp.global("quickshell:regionRecord"), { locked = true, description = "Record selected screen region" })
hl.bind("CTRL + ALT + R", hl.dsp.exec_cmd("bash " .. qsScripts .. "/videos/record.sh --fullscreen"), { locked = true, description = "Record fullscreen (no audio)" })
hl.bind("SUPER + SHIFT + ALT + R", hl.dsp.exec_cmd("bash " .. qsScripts .. "/videos/record.sh --fullscreen --sound"), { locked = true, description = "Record fullscreen (with audio)" })

-----------------------------------------------------------------------------------------
-- 5. UNIQUE END-4 FUNCTIONS
-----------------------------------------------------------------------------------------
hl.bind("SUPER + J", hl.dsp.global("quickshell:barToggle"), { description = "Toggle bar visibility" })
hl.bind("CTRL + SUPER + P", hl.dsp.global("quickshell:panelFamilyCycle"), { description = "Cycle panel layout family" })

-- Vision, OCR & Translation
hl.bind("SUPER + SHIFT + A", hl.dsp.global("quickshell:regionSearch"), { description = "Google Lens visual search" })
hl.bind("SUPER + SHIFT + X", hl.dsp.global("quickshell:regionOcr"), { description = "Extract text from region >> clipboard" })
hl.bind("SUPER + SHIFT + T", hl.dsp.global("quickshell:screenTranslate"), { description = "Translate on-screen text" })
hl.bind("SUPER + SHIFT + ALT + mouse:273", hl.dsp.exec_cmd("bash " .. hyprScripts .. "/ai/primary-buffer-query.sh"), { description = "Generate AI summary for selected text" })

-- Workspace Number Indicator Overlays
hl.bind("SUPER_L", hl.dsp.global("quickshell:workspaceNumber"), { ignore_mods = true, transparent = true })
hl.bind("SUPER_R", hl.dsp.global("quickshell:workspaceNumber"), { ignore_mods = true, transparent = true })
