Modal dialog with dark scrim + blur backdrop. Use for session settings, end-round confirmation.

```jsx
<Dialog open={open} title="End round?" onClose={close} footer={<><Button variant="ghost" onClick={close}>Cancel</Button><Button variant="danger" onClick={end}>End round</Button></>}>
  This clears current votes for everyone.
</Dialog>
```
