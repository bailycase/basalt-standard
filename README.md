# Basalt

Basalt is a low-saturation dark and light theme standard built around layered mineral surfaces, warm focus states, muted natural accents, and monospace typography.

The repository keeps one canonical palette and the application ports that use it. Apps with native appearance switching should follow their dark or light setting automatically. Other apps may expose separate Basalt Dark and Basalt Light themes.

## Palette

| Variant | Backgrounds | Text | Accents |
| --- | --- | --- | --- |
| Dark | `#0D0E10` `#111215` `#161718` `#1A1B1D` | `#EDEDED` `#CDD0D7` `#ABAEB7` `#6F727F` | `#C18065` `#A1C592` `#CEB370` `#B87D6E` `#8892B5` |
| Light | `#E7E4DE` `#F3F1ED` `#ECE9E3` `#E1DED7` | `#242424` `#2E3032` `#4F5256` `#5D6065` | `#8F4E37` `#456536` `#7B5D16` `#94493F` `#526184` |

See [SPEC.md](SPEC.md) for semantic usage and [palette.json](palette.json) for machine-readable values.

## Ports

### Obsidian

The first port lives in [`ports/obsidian`](ports/obsidian).

Install it manually:

1. Create `<vault>/.obsidian/themes/Basalt/`.
2. Copy `ports/obsidian/manifest.json` and `ports/obsidian/theme.css` into it.
3. In Obsidian, open **Settings → Appearance → Themes** and select **Basalt**.

The Obsidian port follows Obsidian's dark or light appearance automatically.
