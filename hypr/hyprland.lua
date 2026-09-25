-- #######################################################################################
-- HYPRLAND LUA CONFIGURATION (OPTIMIZED & FULL SYSTEM)
-- #######################################################################################

-- Resolve user home directory safely for paths
local home = os.getenv("HOME")

-- Default application variables
local terminal = "kitty"
local fileManager = "nautilus"
local menu = "command -v hyprlauncher >/dev/null 2>&1 && hyprlauncher || wofi --show drun"
local mainMod = "SUPER"

-----------------------------------------------------------------------------------------
-- MONITORS
-----------------------------------------------------------------------------------------
hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = 1,
})

-----------------------------------------------------------------------------------------
-- ENVIRONMENT VARIABLES
-----------------------------------------------------------------------------------------
-- Wayland & Desktop Integration
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("CLUTTER_BACKEND", "wayland")

-- Cursor Settings
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-----------------------------------------------------------------------------------------
-- AUTOSTART SERVICES
-----------------------------------------------------------------------------------------
hl.on("hyprland.start", function()
	-- Synchronize Wayland environment for screen sharing, portals, and systemd services
	hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
	hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")

	-- Core background utilities and daemons (expanded home path prevents shell expansion errors)
	hl.exec_cmd(home .. "/.local/bin/matugen-watch.sh")
	hl.exec_cmd("nm-applet --indicator")
	hl.exec_cmd("blueman-applet")
	hl.exec_cmd("wl-paste --type text --watch cliphist store")
	hl.exec_cmd("wl-paste --type image --watch cliphist store")
	
	-- Polkit authentication agent
	hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
	
	-- Wallpaper daemon and Quickshell overview component
	hl.exec_cmd("skwd-daemon")
	hl.exec_cmd("qs -c " .. home .. "/.config/quickshell/overview")
end)

-----------------------------------------------------------------------------------------
-- LOOK & FEEL
-----------------------------------------------------------------------------------------
hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 20,
		border_size = 2,
		col = {
			active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
			inactive_border = "rgba(595959aa)",
		},
		resize_on_border = false,
		allow_tearing = false,
		layout = "scrolling", -- Default layout on launch
	},
})

hl.config({
	scrolling = {
		column_width = 0.85,
		direction = "right",
		focus_fit_method = 0,
		follow_focus = true,
		fullscreen_on_one_column = false,
		explicit_column_widths = "0.333, 0.5, 0.667, 1.0",
	},
})

hl.config({
	decoration = {
		rounding = 10,
		rounding_power = 2,
		active_opacity = 0.85,
		inactive_opacity = 0.75,
		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = "rgba(1a1a1aee)",
		},
		blur = {
			enabled = true,
			size = 6,
			passes = 3,
			new_optimizations = true,
			vibrancy = 0.1696,
		},
	},
})

-----------------------------------------------------------------------------------------
-- ANIMATIONS & BEZIER CURVES
-----------------------------------------------------------------------------------------
hl.config({ animations = { enabled = true } })

hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.7, 0.6 }, { 0.75, 1.05 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })
hl.curve("myBezier", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 6, bezier = "myBezier", style = "slide" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 4, bezier = "almostLinear", style = "slide" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 4, bezier = "almostLinear", style = "slide" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })

-----------------------------------------------------------------------------------------
-- LAYOUT DEFINITIONS (DWINDLE & MASTER CONFIGURATION)
-----------------------------------------------------------------------------------------
hl.config({
	dwindle = {
		preserve_split = true,
	},
	master = {
		new_status = "master",
		orientation = "center",              -- Centers master window with slave columns on both sides
		slave_count_for_center_master = 2,  -- Balances slave windows equally when 2 or more exist
		mfact = 0.50,                       -- 50% screen width allocated to the center master window
	},
})

-----------------------------------------------------------------------------------------
-- MISCELLANEOUS & INPUT
-----------------------------------------------------------------------------------------
hl.config({
	misc = {
		force_default_wallpaper = 0,
		disable_hyprland_logo = true,
	},
})

hl.config({
	input = {
		kb_layout = "us",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",
		follow_mouse = 1,
		sensitivity = 0,
		touchpad = { natural_scroll = false },
	},
})

-- Gestures and Devices
hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
hl.device({ name = "epic-mouse-v1", sensitivity = -0.5 })

-----------------------------------------------------------------------------------------
-- KEYBINDINGS
-----------------------------------------------------------------------------------------

-- --- MOUSE HARDWARE BUTTONS (wtype clipboard shortcuts) ---
hl.bind("mouse:276", hl.dsp.exec_cmd("wtype -M ctrl c -m ctrl"))
hl.bind("mouse:275", hl.dsp.exec_cmd("wtype -M ctrl v -m ctrl"))

-- --- SCREENSHOTS ---
hl.bind("SUPER + S", hl.dsp.exec_cmd('bash -c \'grim -g "$(slurp)" ~/Pictures/screenshot_$(date +%s).png\''))
hl.bind("SUPER + mouse:275", hl.dsp.exec_cmd('bash -c \'grim -g "$(slurp)" - | wl-copy\''))
hl.bind("Print", hl.dsp.exec_cmd('bash -c \'grim ~/Pictures/screenshot_$(date +%s).png\''))
hl.bind("SHIFT + Print", hl.dsp.exec_cmd('bash -c \'grim - | wl-copy\''))

-- --- WINDOW GROUPING ---
hl.bind(mainMod .. " + Tab", hl.dsp.group.next())
hl.bind(mainMod .. " + SHIFT + Tab", hl.dsp.group.prev())

-- --- CORE SYSTEM CONTROLS ---
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float())

-- --- SHELL, OVERVIEW & WALLPAPER ---
hl.bind("SUPER + A", hl.dsp.exec_cmd("qs ipc -c " .. home .. "/.config/quickshell/overview call overview toggle"), {
	description = "Toggle Quickshell Overview",
})
hl.bind(mainMod .. " + W", function()
	hl.exec_cmd("skwd wall toggle")
end)

-- --- FALLBACK BINDS ---
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit"))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + I", hl.dsp.exec_cmd("XDG_CURRENT_DESKTOP=GNOME gnome-control-center"))
hl.bind(mainMod .. " + SHIFT + V", hl.dsp.exec_cmd("cliphist list | wofi -dmenu | cliphist decode | wl-copy"))

-- --- GLOBAL LAYOUT SWITCHERS (In-memory Lua switches, no subshell overhead) ---
hl.bind(mainMod .. " + CTRL + D", function()
	hl.config({ general = { layout = "dwindle" } })
end)

hl.bind(mainMod .. " + CTRL + S", function()
	hl.config({ general = { layout = "scrolling" } })
end)

hl.bind(mainMod .. " + CTRL + M", function()
	hl.config({ general = { layout = "master" } })
end)

-- Scrolling layout directions
hl.bind(mainMod .. " + CTRL + H", function()
	hl.config({ scrolling = { direction = "right" } })
end)

hl.bind(mainMod .. " + CTRL + V", function()
	hl.config({ scrolling = { direction = "down" } })
end)

-- --- MASTER LAYOUT CONTROLS (Only a-z and arrow keys) ---
-- Switch between orientations shown in the video
hl.bind(mainMod .. " + CTRL + C", hl.dsp.layout("orientationcenter")) -- Center master (3-column layout)
hl.bind(mainMod .. " + CTRL + Up", hl.dsp.layout("orientationtop"))    -- Master on top, slaves arranged below
hl.bind(mainMod .. " + CTRL + Left", hl.dsp.layout("orientationleft"))  -- Master on left, slaves arranged right
hl.bind(mainMod .. " + CTRL + Right", hl.dsp.layout("orientationright"))-- Master on right, slaves arranged left
hl.bind(mainMod .. " + CTRL + Down", hl.dsp.layout("orientationbottom"))-- Master on bottom, slaves arranged top

-- Master window operations (Clean alphabetical keys)
hl.bind(mainMod .. " + CTRL + X", hl.dsp.layout("swapwithmaster master")) -- Swap active window with master
hl.bind(mainMod .. " + CTRL + Z", hl.dsp.layout("addmaster"))              -- Increase master window count
hl.bind(mainMod .. " + CTRL + Y", hl.dsp.layout("removemaster"))           -- Decrease master window count

-- --- SCROLLING LAYOUT CONTROLS ---
hl.bind(mainMod .. " + CTRL + period", hl.dsp.layout("move +col"))
hl.bind(mainMod .. " + CTRL + comma", hl.dsp.layout("move -col"))
hl.bind(mainMod .. " + CTRL + SHIFT + period", hl.dsp.layout("swapcol r"))
hl.bind(mainMod .. " + CTRL + SHIFT + comma", hl.dsp.layout("swapcol l"))
hl.bind(mainMod .. " + CTRL + bracketright", hl.dsp.layout("colresize +conf"))
hl.bind(mainMod .. " + CTRL + bracketleft", hl.dsp.layout("colresize -conf"))
hl.bind(mainMod .. " + CTRL + F", hl.dsp.layout("fit active"))

-- --- DWINDLE LAYOUT CONTROLS ---
hl.bind(mainMod .. " + CTRL + J", hl.dsp.layout("togglesplit"))

-- --- WINDOW FOCUS & MOVEMENT ---
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "d" }))

-- Workspace Navigation (1-10)
for i = 1, 10 do
	local key = i == 10 and "0" or tostring(i)
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = tostring(i) }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = tostring(i) }))
end

-- Special Workspace (Scratchpad)
hl.bind(mainMod .. " + T", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + T", hl.dsp.window.move({ workspace = "special:magic" }))

-- Mouse Workspace Switching & Manipulation
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- --- MEDIA & HARDWARE KEYS ---
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { repeating = true })

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-----------------------------------------------------------------------------------------
-- WINDOW RULES
-----------------------------------------------------------------------------------------
hl.window_rule({
	name = "suppress-maximize-events",
	match = { class = ".*" },
	suppress_event = "maximize",
})

hl.window_rule({
	name = "fix-xwayland-drags",
	match = { class = "^$", title = "^$", xwayland = true, float = true, fullscreen = false, pin = false },
	no_focus = true,
})

hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },
	move = { 20, "monitor_h-120" },
	float = true,
})

-----------------------------------------------------------------------------------------
-- SAFE EXTERNAL FILE LOADER (QSwitch & Theme Integration)
-----------------------------------------------------------------------------------------
-- Prevents Hyprland crashes if dynamic cache or theme files do not exist yet
local function safe_load(relative_or_full_path)
	local full_path = relative_or_full_path:sub(1, 1) == "/" and relative_or_full_path or (home .. "/" .. relative_or_full_path)
	local f = io.open(full_path, "r")
	if f then
		f:close()
		local ok, err = pcall(dofile, full_path)
		if not ok then
			print("[Hyprland Lua Error]: Failed to load " .. full_path .. ": " .. tostring(err))
		end
	end
end

-- End-4 / Illogical Impulse rules & Matugen dynamic colors
safe_load(".config/hypr/hyprland/colors.lua")
safe_load(".config/hypr/hyprland/ii-rules.lua")

-- QSwitch shell switch bindings (safe single load)
safe_load(".cache/qswitch/qswitch.lua")
