# Basalt specification

Basalt is a dark, low-saturation theme for interfaces that stay out of the way. It uses near-black layered surfaces, quiet text, and a small set of warm and natural accents.

`palette.json` is the source of truth. Ports may derive transparent fills from these colors, but should not introduce new solid colors unless the host application requires one.

## Principles

- Keep surfaces flat. Avoid gradients, translucency, and decorative shadows.
- Layer from `ui.background` through `ui.surfaceRaised`; do not lighten whole panels to create emphasis.
- Use color to communicate meaning, not to decorate every element.
- Prefer square selections and thin borders.
- Use monospace type throughout when the host supports it. A port may preserve the host's content font if long-form readability suffers.
- Keep primary content readable. Muted text should remain secondary, not disappear.

## Surfaces

| Role | Token | Value |
| --- | --- | --- |
| Deepest background and sidebars | `ui.background` | `#0D0E10` |
| Main application surface | `ui.surface` | `#111215` |
| Raised or grouped surface | `ui.surfaceSubtle` | `#161718` |
| Selection and active row | `ui.surfaceRaised` | `#1A1B1D` |
| Quiet frame or separator | `ui.border` | `#191A1D` |
| Visible structural border | `ui.borderStrong` | `#323337` |
| Form, menu, and modal outline | `ui.controlOutline` | `#6F727F` |

Surfaces should remain ordered from darkest to lightest. Hover states may use white at roughly 4% opacity instead of adding another solid color.

## Text

| Role | Token | Value |
| --- | --- | --- |
| Strong UI text and selected labels | `ui.textPrimary` | `#EDEDED` |
| Secondary UI text | `ui.textSecondary` | `#ADADAE` |
| Tertiary UI text | `ui.textTertiary` | `#777879` |
| Dim UI text | `ui.textDim` | `#5D5D5F` |
| UI metadata | `ui.textMetadata` | `#565758` |
| Quiet UI hints | `ui.textHint` | `#4E4F51` |
| Primary content and terminal text | `content.text` | `#CDD0D7` |
| Secondary content text | `content.textSecondary` | `#ABAEB7` |
| Comments and muted content | `content.muted` | `#6F727F` |
| Disabled content and punctuation | `content.dim` | `#51545E` |

## Semantic colors

| Meaning | Token | Value |
| --- | --- | --- |
| Accent, focus, active control | `accent.orange` | `#C18065` |
| Success and additions | `accent.green` | `#A1C592` |
| Warning | `accent.yellow` | `#CEB370` |
| Error, deletion, destructive action | `accent.red` | `#B87D6E` |
| Links and completed state | `accent.blue` | `#8892B5` |
| Information and secondary links | `accent.cyan` | `#8FB3AD` |
| Secondary accent and types | `accent.purple` | `#A38FB5` |
| Numbers and warm literals | `accent.coral` | `#C99284` |

Applications with live lifecycle states may also use the separate status contract: working `#9DB56B`, attention `#C18065`, idle `#3A3B3C`, and done `#8892B5`.

Do not use saturated status colors for large backgrounds. Tint them over the base surfaces at low opacity.

## Syntax

| Syntax role | Token |
| --- | --- |
| Comments | `content.textSecondary` |
| Keywords | `accent.orange` |
| Functions | `accent.yellow` |
| Variables and plain code | `content.text` |
| Strings | `accent.green` |
| Numbers and constants | `accent.coral` |
| Types and classes | `accent.blue` |
| Operators | `content.textSecondary` |
| Punctuation | `content.textSecondary` |

## Terminal palette

| Slot | Normal | Bright |
| --- | --- | --- |
| Black | `#1A1B1D` | `#565758` |
| Red | `#B87D6E` | `#C99284` |
| Green | `#A1C592` | `#B3D1A4` |
| Yellow | `#CEB370` | `#DCC48A` |
| Blue | `#8892B5` | `#9FA9C9` |
| Magenta | `#A38FB5` | `#B8A6C9` |
| Cyan | `#8FB3AD` | `#A4C7C1` |
| White | `#CDD0D7` | `#EDEDED` |

Terminal background is `#111215`, foreground and cursor are `#CDD0D7`, and selection is `#2B2D33` with `#EDEDED` text.

## Port rules

Each port maps Basalt's semantic roles into the host application's native theme variables first. Add selectors only when the native variables cannot express the design. Keep app-specific behavior inside its port.
