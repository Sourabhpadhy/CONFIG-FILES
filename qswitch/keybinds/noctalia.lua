-- #######################################################################################
-- NOCTALIA SHELL - HYPRLAND LUA MAPPINGS (QSWITCH PROFILE)
-- #######################################################################################

local ipc = "noctalia msg "

-- Free keybinds used by other shells
hl.unbind("SUPER + A")

-- --- CORE SHELL CONTROLS (Standardized across ii & caelestia) ---
-- App Launcher (Matches SUPER + R across all profiles)
hl.bind("SUPER + R", hl.dsp.exec_cmd(ipc .. "panel-toggle launcher"), { description = "Toggle Noctalia launcher" })

-- Left Sidebar / Control Center ("Home" card)
hl.bind("SUPER + X", hl.dsp.exec_cmd(ipc .. "panel-toggle control-center"), { description = "Toggle Control Center" })

-- Right Sidebar / Notification Center
hl.bind("SUPER + B", hl.dsp.exec_cmd(ipc .. "panel-toggle notifications"), { description = "Toggle notifications" })

-- Application / Window Switcher Overview
hl.bind("SUPER + A", hl.dsp.exec_cmd(ipc .. "window-switcher"), { description = "Toggle window switcher" })

-- Settings Menu (Matches SUPER + I)
hl.bind("SUPER + I", hl.dsp.exec_cmd(ipc .. "settings-toggle"), { description = "Toggle Noctalia settings" })

-- Lock Screen (PAM Session Lock)
hl.bind("SUPER + L", hl.dsp.exec_cmd(ipc .. "session lock"), { description = "Lock screen" })

-- Session / Power Menu
hl.bind("SUPER + M", hl.dsp.exec_cmd(ipc .. "panel-toggle session"), { description = "Toggle session menu" })

-- Desktop Canvas Widget Editor (Matches SUPER + P overlay toggle)
hl.bind("SUPER + P", hl.dsp.exec_cmd(ipc .. "desktop-widgets-toggle-edit"), { description = "Edit desktop widgets" })

-- Wallpaper Picker
hl.bind("SUPER + Z", hl.dsp.exec_cmd(ipc .. "panel-toggle wallpaper"), { description = "Toggle wallpaper picker" })

-- Clipboard Manager Panel
hl.bind("SUPER + SHIFT + D", hl.dsp.exec_cmd(ipc .. "panel-toggle clipboard"), { description = "Toggle clipboard panel" })

-- --- BAR VISIBILITY TOGGLES ---
hl.bind("SUPER + J", hl.dsp.exec_cmd(ipc .. "bar-toggle left_dock"), { description = "Toggle left dock" })
hl.bind("SUPER + SHIFT + J", hl.dsp.exec_cmd(ipc .. "bar-toggle bottom_bar"), { description = "Toggle bottom status bar" })

-- --- UTILITIES ---
hl.bind("SUPER + SHIFT + C", hl.dsp.exec_cmd("hyprpicker -a"), { description = "Pick color to clipboard" })
hl.bind("SUPER + ALT + Period", hl.dsp.exec_cmd(ipc .. "panel-toggle emoji"), { description = "Toggle emoji picker" })

-- Live Shell Reload (Hot-reloads Noctalia configs without restarting Hyprland)
hl.bind("CTRL + SUPER + R", hl.dsp.exec_cmd(ipc .. "config-reload"), { description = "Reload Noctalia shell" })

-- Media Key Passthrough
hl.bind("CTRL + SUPER + Space", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("CTRL + SUPER + Equal", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("CTRL + SUPER + Minus", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
