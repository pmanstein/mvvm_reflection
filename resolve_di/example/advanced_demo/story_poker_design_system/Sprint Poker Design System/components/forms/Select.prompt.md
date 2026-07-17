Dropdown select. Used for estimation deck choice (Fibonacci / T-shirt / powers of 2).

```jsx
<Select label="Deck" value={deck} onChange={e=>setDeck(e.target.value)} options={[{value:'fib',label:'Fibonacci'}]} />
```
