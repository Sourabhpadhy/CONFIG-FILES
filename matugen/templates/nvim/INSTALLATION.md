# Neovim (Tokyonight) Matugen Guide

This template generates a Lua file for Neovim to override Tokyonight theme colors with your wallpaper accents.

## 📁 Files
1. `nvim-tokyonight.lua`: The Lua template for Neovim.

## 🚀 How to Implement

### Step 1: Copy File
Copy the file to your Matugen templates folder:
`~/.config/matugen/templates/nvim-tokyonight.lua`

### Step 2: Configure Matugen
Add this section to your `~/.config/matugen/config.toml`:

```toml
[templates.nvim]
input_path = '~/.config/matugen/templates/nvim-tokyonight.lua'
output_path = '~/.config/nvim/lua/plugins/matugen.lua'
```

### Step 3: Load in Neovim
Ensure your Neovim configuration (usually `init.lua`) loads this generated file or uses it to override your theme colors.

---
**Note**: This is configured to work specifically with the Tokyonight theme structure by overriding its highlight groups.
