-- #######################################################################################
-- QSWITCH PROFILE: ILLOGICAL-IMPULSE / END4-PC
-- (All overwrites executed via hl.unbind; hyprland.lua left completely untouched)
-- #######################################################################################

local home = os.getenv("HOME")
local qsScripts = home .. "/.config/quickshell/ii/scripts"
local hyprScripts = home .. "/.config/hypr/hyprland/scripts"

-- ---------------------------------------------------------------------------------------
-- OVERWRITE SHARED KEYBINDS (Strips hyprland.lua actions on matching keys)
-- ---------------------------------------------------------------------------------------
hl.unbind("SUPER + R")          -- Clears menu fallback from hyprland.lua
hl.unbind("SUPER + A")          -- Clears standalone overview from hyprland.lua
hl.unbind("SUPER + I")          -- Clears gnome-control-center from hyprland.lua
hl.unbind("SUPER + M")          -- Clears hyprshutdown from hyprland.lua
hl.unbind("SUPER + L")          -- Clears default lock from hyprland.lua
hl.unbind("SUPER + SHIFT + T")  -- Clears special workspace move from hyprland.lua
hl.unbind("Print")              -- Clears default grim print from hyprland.lua

-- ---------------------------------------------------------------------------------------
-- YOUR CUSTOM MAPPINGS (Preserved exactly as requested)
-- ---------------------------------------------------------------------------------------
hl.bind("SUPER + R", hl.dsp.global("quickshell:searchToggleRelease"), { description = "Toggle search" })
hl.bind("SUPER + A", hl.dsp.global("quickshell:overviewWorkspacesToggle"), { description = "Toggle overview" })
hl.bind("SUPER + P", hl.dsp.global("quickshell:overlayToggle"), { description = "Toggle widget overlay" })
hl.bind("SUPER + SHIFT + D", hl.dsp.global("quickshell:overviewClipboardToggle"), { description = "Clipboard history" })
hl.bind("SUPER + Z", hl.dsp.global("quickshell:wallpaperSelectorToggle"), { description = "Toggle wallpaper selector" })
hl.bind("SUPER + X", hl.dsp.global("quickshell:sidebarLeftToggle"), { description = "Toggle left sidebar" })
hl.bind("SUPER + B", hl.dsp.global("quickshell:sidebarRightToggle"), { description = "Toggle right sidebar" })

-- Fixed settings toggle syntax while preserving SUPER + I
hl.bind("SUPER + I", hl.dsp.global("quickshell:settingsToggle"), { description = "Toggle settings overlay" })

hl.bind("SUPER + M", hl.dsp.global("quickshell:sessionToggle"), { description = "Toggle session menu" })
hl.bind("SUPER + L", hl.dsp.exec_cmd("loginctl lock-session || hyprlock"), { description = "Lock" })

-- ---------------------------------------------------------------------------------------
-- CONFLICT RESOLUTIONS & SIDEBAR BINDS
-- ---------------------------------------------------------------------------------------
hl.bind("SUPER + ALT + Period", hl.dsp.global("quickshell:overviewEmojiToggle"), { description = "Emoji >> clipboard" })
hl.bind("SUPER + SHIFT + M", hl.dsp.global("quickshell:mediaControlsToggle"), { description = "Toggle media controls" })
hl.bind("SUPER + ALT + B", hl.dsp.global("quickshell:sidebarLeftToggle"))

-- ---------------------------------------------------------------------------------------
-- ORIGINAL II & END4-PC BINDS
-- ---------------------------------------------------------------------------------------
hl.bind("SUPER_L", hl.dsp.global("quickshell:workspaceNumber"), { ignore_mods = true, transparent = true })
hl.bind("SUPER_R", hl.dsp.global("quickshell:workspaceNumber"), { ignore_mods = true, transparent = true })
hl.bind("SUPER + ALT + A", hl.dsp.global("quickshell:sidebarLeftToggleDetach"))
hl.bind("SUPER + O", hl.dsp.global("quickshell:sidebarLeftToggle"))
hl.bind("SUPER + N", hl.dsp.global("quickshell:sidebarRightToggle"), { description = "Toggle right sidebar" })
hl.bind("SUPER + Slash", hl.dsp.global("quickshell:cheatsheetToggle"), { description = "Toggle cheatsheet" })
hl.bind("SUPER + K", hl.dsp.global("quickshell:oskToggle"), { description = "Toggle on-screen keyboard" })
hl.bind("SUPER + G", hl.dsp.global("quickshell:overlayToggle"), { description = "Toggle widget overlay" })
hl.bind("SUPER + J", hl.dsp.global("quickshell:barToggle"), { description = "Toggle bar" })
hl.bind("SHIFT + SUPER + ALT + Slash", hl.dsp.exec_cmd("qs -p " .. home .. "/.config/quickshell/ii/welcome.qml"))
hl.bind("CTRL + SUPER + ALT + T", hl.dsp.global("quickshell:wallpaperSelectorRandom"), { description = "Select random wallpaper" })
hl.bind("CTRL + SUPER + R", hl.dsp.exec_cmd("killall ydotool qs quickshell 2>/dev/null; qs -c ii &"), { description = "Restart widgets" })
hl.bind("CTRL + SUPER + P", hl.dsp.global("quickshell:panelFamilyCycle"), { description = "Cycle panel family" })

-- ---------------------------------------------------------------------------------------
-- UTILITIES & TOOLS (Preserving SUPER + SHIFT + T for screen translation)
-- ---------------------------------------------------------------------------------------
hl.bind("SUPER + SHIFT + S", hl.dsp.global("quickshell:regionScreenshot"), { description = "Screen snip" })
hl.bind("SUPER + SHIFT + A", hl.dsp.global("quickshell:regionSearch"), { description = "Google Lens" })
hl.bind("SUPER + SHIFT + X", hl.dsp.global("quickshell:regionOcr"), { description = "Character recognition >> clipboard" })
hl.bind("SUPER + SHIFT + T", hl.dsp.global("quickshell:screenTranslate"), { description = "Translate screen content" })
hl.bind("SUPER + SHIFT + C", hl.dsp.exec_cmd("hyprpicker -a"), { description = "Pick color #RRGGBB >> clipboard" })

-- Recording
hl.bind("SUPER + SHIFT + R", hl.dsp.global("quickshell:regionRecord"), { locked = true, description = "Record region (no sound)" })
hl.bind("SUPER + ALT + R", hl.dsp.global("quickshell:regionRecord"), { locked = true })
hl.bind("CTRL + ALT + R", hl.dsp.exec_cmd("bash " .. qsScripts .. "/videos/record.sh --fullscreen"), { locked = true })
hl.bind("SUPER + SHIFT + ALT + R", hl.dsp.exec_cmd("bash " .. qsScripts .. "/videos/record.sh --fullscreen --sound"), { locked = true, description = "Record screen (with sound)" })

-- Cleaned Fullscreen Screenshots
local grimhyprctl = "grim -o \"$(hyprctl activeworkspace -j | jq -r '.monitor')\""
hl.bind("Print", hl.dsp.exec_cmd("bash -c '" .. grimhyprctl .. " - | wl-copy'"), { locked = true, description = "Screenshot >> clipboard" })
hl.bind("CTRL + Print", hl.dsp.exec_cmd("bash -c 'mkdir -p $(xdg-user-dir PICTURES)/Screenshots && " .. grimhyprctl .. " - | tee $(xdg-user-dir PICTURES)/Screenshots/Screenshot_$(date +%Y-%m-%d_%H.%M.%S).png | wl-copy'"), { locked = true, description = "Screenshot >> clipboard & file" })

-- AI Summary
hl.bind("SUPER + SHIFT + ALT + mouse:273", hl.dsp.exec_cmd("bash " .. hyprScripts .. "/ai/primary-buffer-query.sh"), { description = "Generate AI summary for selected text" })

-- Virtual Machine Submap
hl.define_submap("virtual-machine", function()
	hl.bind("SUPER + ALT + F1", function()
		local currentsubmap = hl.get_current_submap()
		if currentsubmap == "virtual-machine" then
			hl.dispatch(hl.dsp.exec_cmd("notify-send 'Exited Virtual Machine submap' 'Keybinds re-enabled' -a 'Hyprland'"))
			hl.dispatch(hl.dsp.submap("reset"))
		elseif currentsubmap == "" then
			hl.dispatch(hl.dsp.exec_cmd("notify-send 'Entered Virtual Machine submap' 'Keybinds disabled. hit SUPER+ALT+F1 to escape' -a 'Hyprland'"))
			hl.dispatch(hl.dsp.submap("virtual-machine"))
		end
	end, { submap_universal = true })
end)

-- Session Suspend
hl.bind("SUPER + SHIFT + L", hl.dsp.exec_cmd("systemctl suspend || loginctl suspend"), { locked = true, description = "Suspend system" })

-- ---------------------------------------------------------------------------------------
-- SCREEN ZOOM (Nil-Guarded)
-- ---------------------------------------------------------------------------------------
local function zoomfunction(value)
	local zoomvalue = tonumber(hl.get_config("cursor:zoom_factor")) or 1.0
	local newzoom = zoomvalue + value
	if newzoom > 3.0 then
		hl.config({ cursor = { zoom_factor = 3.0 } })
	elseif newzoom < 1.0 then
		hl.config({ cursor = { zoom_factor = 1.0 } })
	else
		hl.config({ cursor = { zoom_factor = newzoom } })
	end
end

hl.bind("SUPER + Minus", function() zoomfunction(-0.3) end, { repeating = true, description = "Zoom out" })
hl.bind("SUPER + Equal", function() zoomfunction(0.3) end, { repeating = true, description = "Zoom in" })
hl.bind("SUPER + code:82", function() zoomfunction(-0.3) end, { repeating = true })
hl.bind("SUPER + code:86", function() zoomfunction(0.3) end, { repeating = true })

-- Window Resize
hl.bind("CTRL + SUPER + Backslash", hl.dsp.window.resize({ x = 640, y = 480, "exact" }))