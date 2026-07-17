# Sprint Poker — UI kit

Interactive click-through of the Sprint Poker app: join/create a session, pick an estimate, watch votes come in, reveal, and check round history. Built from the design system's `components/` primitives (Button, Input, VoteCard, ParticipantRow, ProgressBar, Badge, IconButton, Card).

Open `index.html`. Enter a name + code (or "Create new session"), vote on the deck, reveal, then check the History tab.

Files: `LobbyScreen.jsx`, `ParticipantsSidebar.jsx`, `VotingPanel.jsx`, `RevealPanel.jsx`, `HistoryPanel.jsx` — plain window-global React components (not design-system-bundled; loaded directly by `index.html` via Babel).
