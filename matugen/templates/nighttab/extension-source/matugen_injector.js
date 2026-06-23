(function() {
  let activeColors = null;

  function hexToRgb(hex) {
    const r = parseInt(hex.slice(1, 3), 16);
    const g = parseInt(hex.slice(3, 5), 16);
    const b = parseInt(hex.slice(5, 7), 16);
    return { r, g, b };
  }

  function hexToHsl(hex) {
    let { r, g, b } = hexToRgb(hex);
    r /= 255; g /= 255; b /= 255;
    const max = Math.max(r, g, b), min = Math.min(r, g, b);
    let h, s, l = (max + min) / 2;
    if (max === min) {
      h = s = 0;
    } else {
      const d = max - min;
      s = l > 0.5 ? d / (2 - max - min) : d / (max + min);
      switch (max) {
        case r: h = (g - b) / d + (g < b ? 6 : 0); break;
        case g: h = (b - r) / d + 2; break;
        case b: h = (r - g) / d + 4; break;
      }
      h /= 6;
    }
    return { h: Math.round(h * 360), s: Math.round(s * 100), l: Math.round(l * 100) };
  }

  function applyColors() {
    if (!activeColors) return;
    
    const root = document.documentElement;
    const mappings = {
      'primary': ['--theme-accent', '--theme-primary-1'],
      'surface': ['--theme-background-color'],
      'surface_container': ['--theme-layout-color'],
      'surface_container_high': ['--theme-header-color'],
      'secondary_container': ['--theme-bookmark-color']
    };

    // Temporarily disconnect observer to prevent infinite loop during our own updates
    if (observer) observer.disconnect();

    for (const [key, vars] of Object.entries(mappings)) {
      if (activeColors[key]) {
        const rgb = hexToRgb(activeColors[key]);
        vars.forEach(v => {
          root.style.setProperty(v + '-rgb-r', rgb.r, 'important');
          root.style.setProperty(v + '-rgb-g', rgb.g, 'important');
          root.style.setProperty(v + '-rgb-b', rgb.b, 'important');
        });
        
        if (key === 'primary') {
          const hsl = hexToHsl(activeColors[key]);
          for (let i = 1; i <= 20; i++) {
            root.style.setProperty('--theme-primary-' + i + '-h', hsl.h, 'important');
            let padded = i.toString().padStart(3, '0');
            root.style.setProperty('--theme-primary-' + padded + '-h', hsl.h, 'important');
          }
        }
      }
    }
    root.style.setProperty('--theme-layout-color-opacity', '50', 'important');

    // Reconnect observer
    if (observer) observer.observe(root, { attributes: true, attributeFilter: ['style'] });
  }

  // Set up the observer to watch for theme changes from the extension
  const observer = new MutationObserver((mutations) => {
    applyColors();
  });

  // Initial fetch
  fetch('./colors.json')
    .then(r => r.json())
    .then(colors => {
      activeColors = colors;
      applyColors();
      // Start observing once we have colors to enforce
      observer.observe(document.documentElement, { attributes: true, attributeFilter: ['style'] });
    })
    .catch(e => console.log('Matugen Integration: colors.json not found yet.'));
})();
