# nightTab Dynamic Matugen Guide

This guide explains how to set up nightTab as a custom extension with real-time wallpaper color syncing.

## 📁 Included in this folder
- `nighttab.json`: The Matugen template that generates the color data.
- `/extension-source`: The full nightTab source code with the Matugen injector pre-installed.

---

## 🛠️ Step 1: Install the Custom Extension

To use the dynamic colors, you must load the provided source as an "Unpacked Extension."

### For Chrome / Brave / Edge (Chromium):
1. Open your browser and go to `chrome://extensions/`.
2. Enable **"Developer mode"** (toggle in the top right).
3. Click **"Load unpacked"**.
4. Select the `extension-source` folder from this directory.
5. nightTab is now installed!

### For Firefox:
1. Open `about:debugging#/runtime/this-firefox`.
2. Click **"Load Temporary Add-on..."**.
3. Select any file inside the `extension-source` folder.
*Note: Firefox temporary extensions are removed when the browser closes. To make it permanent, you would need to use a "New Tab Override" extension and point it to the local `index.html` file.*

---

## 🚀 Step 2: Set as Startup Page

### For Chrome:
1. Go to `chrome://settings/onStartup`.
2. Select **"Open a specific page or set of pages"**.
3. Click **"Add a new page"**.
4. Enter the local path to the `index.html` file (e.g., `file:///path/to/nighttab/extension-source/index.html`).
*Note: In many browsers, loading the extension as a "New Tab" page is automatic once installed.*

### For Other Browsers:
Most modern browsers allow you to set a custom URL for the "Home" button or "On Startup" page in their respective Settings menus. Look for "Home Page" or "New Tab" sections.

---

## 🎨 Step 3: Combine with Matugen

This is where the magic happens. We need Matugen to generate a `colors.json` file inside the extension folder so the injector can read it.

### 1. Copy the Template
Copy `nighttab.json` to your Matugen templates folder:
`~/.config/matugen/templates/nighttab.json`

### 2. Configure Matugen
Add this to your `~/.config/matugen/config.toml`:

```toml
[templates.nighttab]
input_path = '~/.config/matugen/templates/nighttab.json'
output_path = '/path/to/your/extension-source/colors.json'
```
*(Replace `/path/to/your/` with the actual absolute path where you kept the extension-source folder).*

### 3. How it Works
1. When you run Matugen, it generates a fresh `colors.json` inside the extension folder.
2. The `matugen_injector.js` (already inside the source) automatically detects the new colors.
3. Your nightTab UI updates **instantly** to match your wallpaper!

---
**Troubleshooting**: If colors don't update, ensure the `output_path` in your `config.toml` points exactly to the `colors.json` file **inside** the extension folder.
