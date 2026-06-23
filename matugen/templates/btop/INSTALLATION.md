# btop Matugen Guide

This template creates a custom theme for btop that matches your system-wide wallpaper colors.

## 📁 Files
1. `btop.theme`: The theme template for btop.

## 🚀 How to Implement

### Step 1: Copy File
Copy the theme file to your Matugen templates folder:
`~/.config/matugen/templates/btop.theme`

### Step 2: Configure Matugen
Add this section to your `~/.config/matugen/config.toml`:

```toml
[templates.btop]
input_path = '~/.config/matugen/templates/btop.theme'
output_path = '~/.config/btop/themes/matugen.theme'
```

### Step 3: Select Theme in btop
1. Open `btop`.
2. Press `M` for Menu.
3. Go to **Options** -> **Color Theme**.
4. Select **"matugen"**.

---
**Tip**: Your system monitor will now have the same "Ethereal" color palette as your desktop!
