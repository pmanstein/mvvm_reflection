# Sprint Poker Design System

## Context
Sprint Poker is an agile estimation ("planning poker") app: teams join a live session over Firebase, each person privately picks an estimate card, then everyone reveals at once and the app tallies results. Built for engineers running sprint-planning/refinement calls — real-time, multiplayer, low-ceremony.

## Sources
- GitHub: [pmanstein/mvvm_reflection](https://github.com/pmanstein/mvvm_reflection) — attached as design-system input. On inspection this repo is a generic Flutter MVVM/dependency-injection reflection demo (a counter app) with no colors, typography, branding, or planning-poker UI. It contains no usable visual material, so this design system was authored from scratch based on the product brief (real-time planning poker over Firebase) and stated brand direction (dark, dev-tool feel; single bold accent; monospace-accented type). Explore that repo yourself for the DI/reflection architecture pattern it demonstrates — it's unrelated to the visuals here.
- No Figma, codebase, or brand assets were otherwise provided. No logo exists in the sources — none is included here; render the wordmark "Sprint Poker" in type wherever a mark would go (see Iconography).

## Products / surfaces in this system
- **Sprint Poker web app** (`ui_kits/sprint-poker/`) — the only product. Core screens: session lobby (join/create), voting screen, reveal/results screen, participant presence list, round history.

## Content fundamentals
- **Voice**: terse, confident, tool-like — written for engineers, not consumers. Short imperative labels ("Start round", "Reveal votes", "Copy invite link"), not marketing copy.
- **Person**: direct address ("You voted 8", "Waiting on 2 more") — second person for the active user, third person/name for others ("Priya voted").
- **Casing**: sentence case everywhere (buttons, headers, empty states). No ALL CAPS except small metadata labels (e.g. "ROUND 3", "AVG") set in caption size + wide tracking — a dev-tool convention, not shouting.
- **Numbers as content**: estimates, averages, and round counts are set in monospace — treat numbers as data, not prose.
- **Emoji**: none. This is a focused tool, not a social app.
- **Empty/system states**: plain and factual ("No one has voted yet", "Session ended"), never cutesy.
- **Errors**: specific and actionable ("Session not found — check the link", not "Oops!").

## Visual foundations
- **Palette**: near-black slate neutrals (`--gray-0` … `--gray-10`) with a single bold accent, signal lime-green (`--accent-6` `#9FEF00`), used sparingly for primary actions, the user's own vote, live/active indicators, and success states. Danger (red), warning (amber), info (blue) are semantic-only, never decorative. Max one accent color per screen otherwise — no gradients.
- **Type**: Inter for UI text/labels; JetBrains Mono for anything numeric or identity-like (vote values, averages, session codes, timestamps) — the mono/sans split is the core typographic motif, signaling "this is data."
- **Spacing**: 4px base unit (`--space-1` = 4px up through `--space-24` = 96px). Layouts are dense and grid-aligned, generous internal card padding (16–24px), tight gaps between related controls (8px).
- **Backgrounds**: flat, no imagery, no illustration, no texture/noise, no gradients. Depth comes from layered surface tones (`--bg-canvas` → `--bg-surface` → `--bg-card` → `--bg-card-raised`) plus 1px borders, not shadows or blur (blur reserved for modal backdrops only).
- **Animation**: fast and functional — 120–180ms ease-out for hover/press/reveal transitions (`--duration-fast/base`, `--ease-out`). Card reveal uses a quick flip/scale-in, not a bounce. No decorative motion, no parallax.
- **Hover states**: on dark surfaces, hover lightens one step (`--bg-card` → `--bg-card-raised`) or brightens the accent (`--accent-6` → `--accent-7`); never darkens.
- **Press states**: slight scale-down (0.97) plus a shift to `--accent-active` (a darker accent step) — tactile, like pressing a physical card.
- **Borders**: 1px hairlines everywhere (`--border-subtle/default/strong`), the primary way structure is communicated on a dark surface. Focus states are a 2px accent ring (`--focus-ring`), not a glow-blur.
- **Shadows**: minimal. Cards use borders, not drop shadows, at rest. A soft accent glow (`--glow-accent`) marks the current user's selected vote card and live/active session indicators — this is the one "glow" motif in the system, used deliberately and rarely.
- **Corner radii**: small-to-medium, tool-like — 6–10px for cards/inputs/buttons (`--radius-sm/md`), pill radius reserved for tags/badges/avatars only.
- **Cards**: `--bg-card` fill, 1px `--border-subtle`, `--radius-md`, no shadow at rest; raise to `--bg-card-raised` + `--border-default` on hover/selection. Vote cards specifically get the accent glow + border when selected.
- **Transparency/blur**: overlay scrims only (`--bg-overlay` + `--blur-overlay`) behind modals/dialogs. No blur or transparency in normal UI chrome.
- **Imagery**: none in this system — pure UI, no photography or illustration.

## Iconography
No icon set was provided in the source. This system uses **Lucide** (CDN, `unpkg.com/lucide-static`) as the substitute icon set — matched for its clean 1.5–2px stroke, geometric, no-fill style that fits a dev-tool aesthetic. Flag: if the real product uses a different icon system, swap this out. Icons are always monochrome (`currentColor`), sized at 16/20/24px steps, never filled, never colored decoratively. No emoji, no unicode glyphs as icons.

## Fonts
No font files were provided. Substituted **Inter** + **JetBrains Mono** (loaded via Google Fonts, see `tokens/typography.css`) as the nearest match to a "monospace-accented, dev-tool" brief. Flag: if the real product has licensed fonts, replace the `@import` in `tokens/typography.css` and swap in real font files under `assets/fonts/` with `@font-face` rules.

## Components
Standard set, sized to this product's needs (no source defined an inventory, so a standard set was authored — see `components/`):
- `components/forms/` — Button, IconButton, Input, Select, Checkbox, Switch
- `components/feedback/` — Badge, Tag, Tooltip, Dialog, Toast
- `components/data/` — Card, Avatar, ProgressBar
- `components/poker/` — VoteCard, ParticipantRow (intentional additions — see below)

### Intentional additions
- **VoteCard**: the estimation-card primitive (shows a value, face-down/face-up/selected states) — core to a planning-poker product, not a generic UI primitive, but needed everywhere in the kit.
- **ParticipantRow**: a presence-list row (avatar, name, vote status) — used across lobby, voting, and reveal screens.

## Index
- `styles.css` — root stylesheet, imports everything under `tokens/`
- `tokens/` — colors, typography, spacing, effects (radius/shadow/motion), base resets
- `components/forms/`, `components/feedback/`, `components/data/`, `components/poker/` — primitives, each with `.jsx` + `.d.ts` + `.prompt.md` + a card `.html`
- `ui_kits/sprint-poker/` — full click-through recreation: lobby, voting, reveal, history, participants
- `assets/` — empty (no logo/imagery in sources); see Iconography for the icon substitution
- `SKILL.md` — Claude Code–compatible skill wrapper for this design system
