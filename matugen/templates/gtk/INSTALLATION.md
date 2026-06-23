# GTK 3 & 4 Matugen Guide

This folder contains templates to theme your GTK applications (like File Managers, Control Centers, etc.) based on your wallpaper colors.

## 📁 Files
1. `gtk3.css`: CSS template for GTK 3.0.
2. `gtk4.css`: CSS template for GTK 4.0.

## 🚀 How to Implement

### Step 1: Copy Files
Copy the files to their respective template folders:
- `~/.config/matugen/templates/gtk-3.0/gtk.css`
- `~/.config/matugen/templates/gtk-4.0/gtk.css`

### Step 2: Configure Matugen
Add these sections to your `~/.config/matugen/config.toml`:

```toml
[templates.gtk3]
input_path = '~/.config/matugen/templates/gtk-3.0/gtk.css'
output_path = '~/.config/gtk-3.0/gtk.css'

[templates.gtk4]
input_path = '~/.config/matugen/templates/gtk-4.0/gtk.css'
output_path = '~/.config/gtk-4.0/gtk.css'
```

---
**Tip**: These templates will automatically override your system's GTK theme colors to match your wallpaper accents.
