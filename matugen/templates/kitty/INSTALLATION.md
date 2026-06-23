# Kitty Terminal Matugen Guide

This template generates a color configuration for the Kitty terminal that updates instantly when your wallpaper changes.

## 📁 Files
1. `kitty-colors.conf`: The color configuration template.

## 🚀 How to Implement

### Step 1: Copy File
Copy the file to your Matugen templates folder:
`~/.config/matugen/templates/kitty-colors.conf`

### Step 2: Configure Matugen
Add this section to your `~/.config/matugen/config.toml`:

```toml
[templates.kitty]
input_path = '~/.config/matugen/templates/kitty-colors.conf'
output_path = '~/.config/kitty/matugen-colors.conf'
post_hook = 'killall -USR1 kitty || :'
```

### Step 3: Include in Kitty Config
Add this line to your `~/.config/kitty/kitty.conf`:
\`\`\`conf
include matugen-colors.conf
\`\`\`

---
**Tip**: The `killall -USR1 kitty` command in the `post_hook` tells all running Kitty windows to reload their configuration immediately without closing.
