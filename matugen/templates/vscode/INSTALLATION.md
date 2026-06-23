# VS Code Matugen Implementation Guide

This folder contains the two essential files needed to enable the dynamic, instant-update "Premium" theme in VS Code.

## 📁 Files Included
1. **`dankshell.json`**: The base theme definition.
2. **`vscode-premium.json.tpl`**: The settings template that handles instant color injection and transparency.

---

## 🚀 How to Implement

### Step 1: Copy Files to Matugen
Copy both files into your Matugen templates directory (usually `~/.config/matugen/templates/vscode/`).

### Step 2: Configure Matugen (`config.toml`)
Add these two sections to your `~/.config/matugen/config.toml`. **Note**: The second section is what makes the theme "Premium" by directly updating your VS Code settings.

```toml
[templates.vscode]
input_path = '~/.config/matugen/templates/vscode/dankshell.json'
output_path = '~/.vscode/extensions/matugen-theme/themes/matugen-color-theme.json'

[templates.vscode_settings]
input_path = '~/.config/matugen/templates/vscode/vscode-premium.json.tpl'
output_path = '~/.config/Code/User/settings.json'
```

### Step 3: Apply the Theme inside VS Code
**This step is critical to make the theme visible:**
1. Open VS Code.
2. Ensure you have the **"Matugen Dynamic Theme"** extension installed.
3. Press `Ctrl + Shift + P` and search for **"Color Theme"**.
4. Select **"Matugen Dynamic Theme"**.

### Step 4: Generate the Colors
Run Matugen with your wallpaper to apply the colors:
```bash
matugen image /path/to/your/wallpaper.png
```

---

## ✨ Features of this Setup
*   **Instant Updates**: Because we update `settings.json` directly, colors change the moment you swap wallpapers, no window reload required!
*   **Unified Transparency**: Both the editor and sidebar are set to a glassy, consistent opacity (controlled via the `CC` hex suffix in the template).
*   **Ethereal Aesthetics**: Custom syntax highlighting mapped to Matugen accents for high readability.
