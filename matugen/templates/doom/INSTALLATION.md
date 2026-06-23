# Doom Emacs Matugen Guide

This template allows you to use your wallpaper colors as a custom theme in Doom Emacs.

## 📁 Files
1. `doom-matugen-theme.el`: The Emacs Lisp theme template.

## 🚀 How to Implement

### Step 1: Copy File
Copy the `.el` file to your Matugen templates folder:
`~/.config/matugen/templates/doom-matugen-theme.el`

### Step 2: Configure Matugen
Add this section to your `~/.config/matugen/config.toml`:

```toml
[templates.doom]
input_path = '~/.config/matugen/templates/doom-matugen-theme.el'
output_path = '~/.config/doom/themes/doom-matugen-theme.el'
post_hook = 'emacsclient -e "(load-theme '\''doom-matugen t)" || :'
```

### Step 3: Load Theme in Doom
In your `config.el`, make sure you are loading the theme:
\`\`\`elisp
(setq doom-theme 'doom-matugen)
\`\`\`

---
**Tip**: The `post_hook` will attempt to reload the theme in your active Emacs session via `emacsclient`.
