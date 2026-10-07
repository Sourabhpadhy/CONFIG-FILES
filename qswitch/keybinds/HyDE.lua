-- #######################################################################################
-- QSWITCH PROFILE: HYDE
-- #######################################################################################

local home = os.getenv("HOME")
local hyprScripts = home .. "/.config/hypr/scripts"

-----------------------------------------------------------------------------------------
-- 1. UNBIND OVERRIDDEN SHELL KEYS
-----------------------------------------------------------------------------------------
local unbinds = {
	"SUPER + R", "SUPER + Space", "SUPER + A", "SUPER + P",
	"SUPER + I", "SUPER + escape", "SUPER + M", "SUPER + L",
	"SUPER + SHIFT + D", "SUPER + SHIFT + V", "SUPER + ALT + V",
	"SUPER + Z", "SUPER + W", "SUPER + ALT + W", "CTRL + SUPER + ALT + T",
	"SUPER + B", "SUPER + N", "SUPER + X", "SUPER + J", "SUPER + Slash",
	"SUPER + SHIFT + C", "SUPER + Period", "SUPER + ALT + Period",
	"Print", "CTRL + Print", "SUPER + SHIFT + S", "SUPER + SHIFT + ALT + S",
	"SUPER + SHIFT + R", "SUPER + ALT + R", "CTRL + ALT + R", "SUPER + SHIFT + ALT + R",
	"CTRL + SUPER + R", "SUPER + CTRL + ALT + U"
}

for _, key in ipairs(unbinds) do
	pcall(hl.unbind, key)
end

-----------------------------------------------------------------------------------------
-- 2. LAYER RULES (HyDE Surface Namespace)
-----------------------------------------------------------------------------------------
hl.layer_rule({ target = "waybar", blur = true, ignore_zero = true })
hl.layer_rule({ target = "rofi", blur = true, ignore_zero = true })
hl.layer_rule({ target = "swaync-control-center", blur = true, ignore_zero = true })
hl.layer_rule({ target = "swaync-notification-window", blur = true, ignore_zero = true })
hl.layer_rule({ target = "logout_dialog", blur = true })

-----------------------------------------------------------------------------------------
-- 3. DAEMON LIFECYCLE (Ensure HyDE daemons run when switched)
-----------------------------------------------------------------------------------------
hl.exec_cmd("killall qs quickshell 2>/dev/null || true")
hl.exec_cmd("pgrep -x waybar >/dev/null || waybar &")
hl.exec_cmd("pgrep -x swaync >/dev/null || swaync &")
hl.exec_cmd("pgrep -x swww-daemon >/dev/null || swww-daemon &")

-----------------------------------------------------------------------------------------
-- 4. QSWITCH SWITCHER
-----------------------------------------------------------------------------------------
hl.bind("SUPER + ALT + V", hl.dsp.exec_cmd(home .. "/.local/bin/switch.sh"), { description = "QSwitch shell profile switcher" })
hl.bind("SUPER + CTRL + ALT + U", hl.dsp.exec_cmd(home .. "/.local/bin/switch.sh"), { description = "QSwitch launcher alias" })

-----------------------------------------------------------------------------------------
-- 5. SHELL UI BINDINGS
-----------------------------------------------------------------------------------------
-- Launcher & Overview
local rofi_launcher = "test -f " .. hyprScripts .. "/rofilauncher.sh && " .. hyprScripts .. "/rofilauncher.sh || rofi -show drun"
local rofi_window = "test -f " .. hyprScripts .. "/rofilauncher.sh && " .. hyprScripts .. "/rofilauncher.sh -w || rofi -show window"

hl.bind("SUPER + R", hl.dsp.exec_cmd(rofi_launcher), { description = "Application launcher" })
hl.bind("SUPER + Space", hl.dsp.exec_cmd(rofi_launcher), { description = "Application launcher" })
hl.bind("SUPER + A", hl.dsp.exec_cmd(rofi_window), { description = "Window overview" })
hl.bind("SUPER + P", hl.dsp.exec_cmd(rofi_window), { description = "Window overview" })

-- System Settings & Session
local logout_menu = "test -f " .. hyprScripts .. "/logoutlaunch.sh && " .. hyprScripts .. "/logoutlaunch.sh || wlogout"
hl.bind("SUPER + I", hl.dsp.exec_cmd("gnome-control-center"), { description = "System settings" })
hl.bind("SUPER + escape", hl.dsp.exec_cmd("gnome-control-center"), { description = "System settings" })
hl.bind("SUPER + M", hl.dsp.exec_cmd(logout_menu), { description = "Power / session menu" })
hl.bind("SUPER + L", hl.dsp.exec_cmd("hyprlock"), { description = "Lock session" })

-- Clipboard Manager
local cliphist_menu = "test -f " .. hyprScripts .. "/cliphist.sh && " .. hyprScripts .. "/cliphist.sh -c || (cliphist list | rofi -dmenu | cliphist decode | wl-copy)"
hl.bind("SUPER + SHIFT + D", hl.dsp.exec_cmd(cliphist_menu), { description = "Clipboard history" })
hl.bind("SUPER + SHIFT + V", hl.dsp.exec_cmd(cliphist_menu), { description = "Clipboard history" })

-- Wallpapers
local wall_selector = "test -f " .. hyprScripts .. "/swwwallselect.sh && " .. hyprScripts .. "/swwwallselect.sh || " .. hyprScripts .. "/wallpaper.sh -s"
local wall_random = "test -f " .. hyprScripts .. "/swwwallpaper.sh && " .. hyprScripts .. "/swwwallpaper.sh -n || " .. hyprScripts .. "/wallpaper.sh -r"

hl.bind("SUPER + Z", hl.dsp.exec_cmd(wall_selector), { description = "Wallpaper selector" })
hl.bind("SUPER + W", hl.dsp.exec_cmd(wall_selector), { description = "Wallpaper selector" })
hl.bind("SUPER + ALT + W", hl.dsp.exec_cmd(wall_random), { description = "Randomize wallpaper" })
hl.bind("CTRL + SUPER + ALT + T", hl.dsp.exec_cmd(wall_random), { description = "Randomize wallpaper" })

-- Notification Center & Drawer
hl.bind("SUPER + B", hl.dsp.exec_cmd("swaync-client -t -sw"), { description = "Toggle notification center" })
hl.bind("SUPER + N", hl.dsp.exec_cmd("swaync-client -t -sw"), { description = "Toggle notification center" })
hl.bind("SUPER + X", hl.dsp.exec_cmd(rofi_launcher), { description = "Toggle side drawer" })

-- Bar Toggle & Cheatsheet
hl.bind("SUPER + J", hl.dsp.exec_cmd("killall -SIGUSR1 waybar || waybar &"), { description = "Toggle Waybar" })
hl.bind("SUPER + Slash", hl.dsp.exec_cmd("test -f " .. hyprScripts .. "/keybinds_hint.sh && " .. hyprScripts .. "/keybinds_hint.sh || notify-send 'Keybinds' 'SUPER+R: Launcher | SUPER+A: Overview | SUPER+ALT+V: QSwitch'"))

-- Pickers
local rofi_emoji = "test -f " .. hyprScripts .. "/emoji.sh && " .. hyprScripts .. "/emoji.sh || rofi -show emoji"
hl.bind("SUPER + Period", hl.dsp.exec_cmd(rofi_emoji), { description = "Emoji picker" })
hl.bind("SUPER + ALT + Period", hl.dsp.exec_cmd(rofi_emoji), { description = "Emoji picker" })
hl.bind("SUPER + SHIFT + C", hl.dsp.exec_cmd("hyprpicker -a"), { description = "Color picker" })

-- Screenshots
local shot = hyprScripts .. "/screenshot.sh"
hl.bind("Print", hl.dsp.exec_cmd("test -f " .. shot .. " && " .. shot .. " --now || (grim - | wl-copy)"), { locked = true, description = "Screenshot >> clipboard" })
hl.bind("CTRL + Print", hl.dsp.exec_cmd("test -f " .. shot .. " && " .. shot .. " --now || (grim ~/Pictures/screenshot_$(date +%s).png)"), { locked = true, description = "Screenshot >> file" })
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd("test -f " .. shot .. " && " .. shot .. " --area || (grim -g \"$(slurp)\" - | wl-copy)"), { description = "Screen snip" })
hl.bind("SUPER + SHIFT + ALT + S", hl.dsp.exec_cmd("test -f " .. shot .. " && " .. shot .. " --win || (grim -g \"$(slurp)\" ~/Pictures/screenshot_$(date +%s).png)"), { description = "Window snip" })

-- Screen Recording
local screencast = hyprScripts .. "/screencast.sh"
hl.bind("SUPER + SHIFT + R", hl.dsp.exec_cmd("test -f " .. screencast .. " && " .. screencast .. " --area || notify-send 'Record' 'HyDE screencast script not found'"), { locked = true, description = "Record area" })
hl.bind("SUPER + ALT + R", hl.dsp.exec_cmd("test -f " .. screencast .. " && " .. screencast .. " --area || notify-send 'Record' 'HyDE screencast script not found'"), { locked = true, description = "Record area" })
hl.bind("CTRL + ALT + R", hl.dsp.exec_cmd("test -f " .. screencast .. " && " .. screencast .. " || notify-send 'Record' 'HyDE screencast script not found'"), { locked = true, description = "Record display" })
hl.bind("SUPER + SHIFT + ALT + R", hl.dsp.exec_cmd("test -f " .. screencast .. " && " .. screencast .. " --sound || notify-send 'Record' 'HyDE screencast script not found'"), { locked = true, description = "Record display with audio" })

-- Shell Reload
hl.bind("CTRL + SUPER + R", hl.dsp.exec_cmd("killall waybar swaync 2>/dev/null; waybar & swaync &"), { description = "Restart HyDE Waybar & SwayNC" })
