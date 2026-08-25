# Basalt

Basalt is a dark, low-saturation theme standard built around near-black surfaces, warm focus states, muted natural accents, and monospace typography.

The repository keeps one canonical palette and the application ports that use it.

## Palette

| | Backgrounds | Text | Accents |
| --- | --- | --- | --- |
| Core | `#0D0E10` `#111215` `#161718` `#1A1B1D` | `#EDEDED` `#CDD0D7` `#ABAEB7` `#6F727F` | `#C18065` `#A1C592` `#CEB370` `#B87D6E` `#8892B5` |

See [SPEC.md](SPEC.md) for semantic usage and [palette.json](palette.json) for machine-readable values.

## Ports

### Obsidian

The first port lives in [`ports/obsidian`](ports/obsidian).

Install it manually:

1. Create `<vault>/.obsidian/themes/Basalt/`.
2. Copy `ports/obsidian/manifest.json` and `ports/obsidian/theme.css` into it.
3. In Obsidian, open **Settings → Appearance → Themes** and select **Basalt**.

The Obsidian port is dark-only. It intentionally applies the same palette when Obsidian follows a light system appearance.

