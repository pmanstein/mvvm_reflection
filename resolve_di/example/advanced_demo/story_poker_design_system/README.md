# design_system

Flutter-Port des **Sprint Poker Design Systems** (Quelle: `../advanced_demo/Sprint Poker Design System/`). Dunkles Dev-Tool-Design: Slate-Neutrals, ein einziger Lime-Akzent (`#9FEF00`), Inter für UI-Text, JetBrains Mono für Daten/Zahlen. Struktur über 1px-Hairlines statt Schatten, Hover hellt auf, Press skaliert auf 0.97, keine Ripples.

## Setup

Fonts einmalig herunterladen (werden als Package-Assets gebündelt):

```bash
bash tool/download_fonts.sh
```

Ohne diesen Schritt schlägt der Build mit "unable to locate asset entry" fehl.

## Nutzung

Das Package ist Teil des Pub-Workspace; `advanced_demo` referenziert es per Pfad.

```dart
import 'package:story_poker_design_system/design_system.dart';

MaterialApp(
  theme: SpTheme.dark(),
  home: const SpGallery(), // Komponenten-Showcase
);
```

## Inhalt

- `SpColors`, `SpTypography`/`SpFonts`, `SpSpacing`/`SpRadius`, `SpDurations`/`SpCurves`/`SpShadows`/`SpEffects` — Tokens (1:1 aus `tokens/*.css`)
- `SpTheme.dark()` — ThemeData (dark-only)
- Forms: `SpButton`, `SpIconButton`, `SpInput`, `SpSelect`, `SpCheckbox`, `SpSwitch`
- Feedback: `SpBadge`, `SpTag`, `SpTooltip`, `SpDialog`/`showSpDialog`, `SpToast`/`showSpToast`
- Data: `SpCard`, `SpAvatar`, `SpProgressBar`
- Poker: `SpVoteCard`, `SpParticipantRow`
- `SpGallery` — Showcase aller Komponenten (als Dev-Route mountbar)
