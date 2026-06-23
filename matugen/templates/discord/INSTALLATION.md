# Discord (Vesktop) Matugen Guide

This template allows you to use your wallpaper colors inside Discord (specifically using the Midnight theme on Vesktop).

## 📁 Files
1. `midnight-discord.css`: The CSS template for the Midnight Discord theme.

## 🚀 How to Implement

### Step 1: Copy File
Copy the CSS file to your Matugen templates folder:
`~/.config/matugen/templates/midnight-discord.css`

### Step 2: Configure Matugen
Add this section to your `~/.config/matugen/config.toml`:

```toml
[templates.discord]
input_path = '~/.config/matugen/templates/midnight-discord.css'
output_path = '~/.config/vesktop/themes/midnight.theme.css'
```

---
**Tip**: This setup works best with the "Midnight" theme in Vesktop. Your accent colors will dynamically shift based on your wallpaper.
