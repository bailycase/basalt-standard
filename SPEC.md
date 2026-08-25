# Basalt specification

Basalt is a low-saturation theme family for interfaces that stay out of the way. Dark and light variants share the same semantic roles, warm focus color, natural accents, flat surfaces, and monospace typography.

`palette.json` is the source of truth. Ports may derive transparent fills from these colors, but should not introduce new solid colors unless the host application requires one.

## Principles

- Keep surfaces flat. Avoid gradients, translucency, and decorative shadows.
- Use surface contrast for hierarchy rather than large accent-colored areas.
- Use color to communicate meaning, not to decorate every element.
- Prefer square selections and thin borders.
- Use monospace type throughout when the host supports it. A port may preserve the host's content font if long-form readability suffers.
- Keep primary content readable. Muted text should remain secondary, not disappear.
- Treat light mode as its own palette, not an inverted dark mode.

## Surfaces

| Role | Token | Dark | Light |
| --- | --- | --- | --- |
| Sidebar or deepest application background | `ui.background` | `#0D0E10` | `#E7E4DE` |
| Main application surface | `ui.surface` | `#111215` | `#F3F1ED` |
| Raised or grouped surface | `ui.surfaceSubtle` | `#161718` | `#ECE9E3` |
| Selection and active row | `ui.surfaceRaised` | `#1A1B1D` | `#E1DED7` |
| Quiet frame or separator | `ui.border` | `#191A1D` | `#D4D0C9` |
| Visible structural border | `ui.borderStrong` | `#323337` | `#B8B2A8` |
| Form, menu, and modal outline | `ui.controlOutline` | `#6F727F` | `#6C6964` |

Dark surfaces progress from darkest to lightest. Light surfaces keep sidebars darker than the main content and use darker fills for raised or selected elements. Hover states may mix white in dark mode or primary text in light mode into transparency at roughly 4% instead of adding another solid color.

## Text

| Role | Token | Dark | Light |
| --- | --- | --- | --- |
| Strong UI text and selected labels | `ui.textPrimary` | `#EDEDED` | `#242424` |
| Secondary UI text | `ui.textSecondary` | `#ADADAE` | `#4F504F` |
| Tertiary UI text | `ui.textTertiary` | `#777879` | `#5D6065` |
| Dim UI text | `ui.textDim` | `#5D5D5F` | `#747570` |
| UI metadata | `ui.textMetadata` | `#565758` | `#656664` |
| Quiet UI hints | `ui.textHint` | `#4E4F51` | `#6C6964` |
| Primary content and terminal text | `content.text` | `#CDD0D7` | `#2E3032` |
| Secondary content text | `content.textSecondary` | `#ABAEB7` | `#4F5256` |
| Syntax comments | `content.comment` | `#ADADAE` | `#4F5256` |
| Muted content | `content.muted` | `#6F727F` | `#5D6065` |
| Disabled content | `content.dim` | `#51545E` | `#747570` |

## Semantic colors

| Meaning | Token | Dark | Light |
| --- | --- | --- | --- |
| Accent, focus, active control | `accent.orange` | `#C18065` | `#8F4E37` |
| Success and additions | `accent.green` | `#A1C592` | `#456536` |
| Warning | `accent.yellow` | `#CEB370` | `#7B5D16` |
| Error, deletion, destructive action | `accent.red` | `#B87D6E` | `#94493F` |
| Links and completed state | `accent.blue` | `#8892B5` | `#526184` |
| Information and secondary links | `accent.cyan` | `#8FB3AD` | `#3F655F` |
| Secondary accent and types | `accent.purple` | `#A38FB5` | `#6D587F` |
| Numbers and warm literals | `accent.coral` | `#C99284` | `#8E5146` |

Applications with live lifecycle states may also use the status contract:

| Status | Dark | Light |
| --- | --- | --- |
| Working | `#9DB56B` | `#456536` |
| Attention | `#C18065` | `#8F4E37` |
| Idle | `#3A3B3C` | `#928E87` |
| Done | `#8892B5` | `#526184` |

Do not use status colors for large backgrounds. Tint them over the base surfaces at low opacity.

## Syntax

Both variants use the same semantic mapping:

| Syntax role | Token |
| --- | --- |
| Comments | `content.comment` |
| Keywords | `accent.orange` |
| Functions | `accent.yellow` |
| Variables and plain code | `content.text` |
| Strings | `accent.green` |
| Numbers and constants | `accent.coral` |
| Types and classes | `accent.blue` |
| Operators | `content.textSecondary` |
| Punctuation | `content.textSecondary` |

## Terminal palettes

ANSI names below refer to terminal slots, not literal brightness. Light ports may map the white slots to dark foreground colors so text remains visible.

### Dark

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

Background is `#111215`, foreground and cursor are `#CDD0D7`, and selection is `#2B2D33` with `#EDEDED` text.

### Light

| Slot | Normal | Bright |
| --- | --- | --- |
| Black | `#2E3032` | `#747570` |
| Red | `#94493F` | `#A65E50` |
| Green | `#456536` | `#608250` |
| Yellow | `#7B5D16` | `#927326` |
| Blue | `#526184` | `#68769A` |
| Magenta | `#6D587F` | `#826D93` |
| Cyan | `#3F655F` | `#5B817B` |
| White | `#4F5256` | `#242424` |

Background is `#F3F1ED`, foreground is `#2E3032`, cursor is `#8F4E37`, and selection is `#D7D2C9` with `#242424` text.

## Port rules

Each port maps Basalt's semantic roles into the host application's native theme variables first. Apps with native appearance switching should map their dark and light modes automatically. Apps without automatic switching may ship separate `Basalt Dark` and `Basalt Light` entries. Add selectors only when native variables cannot express the design, and keep app-specific behavior inside its port.
