Primary action button — use `primary` for the single main action per screen (Start round, Reveal votes), `secondary` for supporting actions, `ghost` for low-emphasis/inline actions, `danger` for destructive ones (Leave session, End round).

```jsx
<Button variant="primary" size="md" onClick={startRound}>Start round</Button>
```

Variants: primary (accent fill), secondary (bordered surface), ghost (text-only), danger (red outline). Sizes: sm/md/lg. Supports `disabled`.
