# Antigravity Matugen Implementation Guide

This folder contains the files needed to enable the dynamic, "Premium" theme in the Antigravity application (VS Code fork).

## 📁 Files Included
1. **`dankshell.json`**: The base theme definition for Antigravity.
2. **`antigravity-premium.json.tpl`**: The settings template for Antigravity.

---

## 🚀 How to Implement

### Step 1: Copy Files to Matugen
Copy both files into your Matugen templates directory (e.g., `~/.config/matugen/templates/antigravity/`).

### Step 2: Configure Matugen (`config.toml`)
Add these two sections to your `~/.config/matugen/config.toml`. This ensures Antigravity's settings are updated independently of your main VS Code.

```toml
[templates.antigravity]
input_path = '~/.config/matugen/templates/antigravity/dankshell.json'
output_path = '~/.antigravity/extensions/matugen-theme/themes/matugen-color-theme.json'

[templates.antigravity_settings]
input_path = '~/.config/matugen/templates/antigravity/antigravity-premium.json.tpl'
output_path = '~/.config/Antigravity/User/settings.json'
```

### Step 3: Apply the Theme inside Antigravity
**This step is critical to make the theme visible:**
1. Open Antigravity.
2. Ensure you have the **"Matugen Dynamic Theme"** extension installed in `~/.antigravity/extensions/`.
3. Press `Ctrl + Shift + P` and search for **"Color Theme"**.
4. Select **"Matugen Dynamic Theme"**.

### Step 4: Generate the Colors
Run Matugen with your wallpaper to apply the colors:
```bash
matugen image /path/to/your/wallpaper.png
```

---

## ✨ Features of this Setup
*   **Independent Theming**: Keeps your Antigravity fork separate from standard VS Code.
*   **Instant Real-time Sync**: Colors shift automatically with your wallpaper change.
*   **Premium Glass Look**: Uses high-contrast backgrounds with custom transparency for a sleek, modern aesthetic.
