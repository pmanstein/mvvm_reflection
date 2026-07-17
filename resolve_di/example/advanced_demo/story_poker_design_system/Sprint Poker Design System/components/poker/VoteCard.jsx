import React from 'react';
export function VoteCard({value,state='idle',size='md',onClick}){
const sizes={sm:{w:44,h:64,font:'var(--text-mono-sm)'},md:{w:64,h:92,font:'var(--text-mono-lg)'},lg:{w:88,h:128,font:'var(--text-display)'}};
const s=sizes[size];
const styles={
idle:{background:'var(--bg-card)',border:'1px solid var(--border-default)',color:'var(--text-primary)',boxShadow:'none'},
selected:{background:'var(--vote-selected-bg)',border:'1px solid var(--vote-selected-bg)',color:'var(--vote-selected-text)',boxShadow:'var(--glow-accent-strong)'},
facedown:{background:'var(--bg-card-raised)',border:'1px solid var(--border-strong)',color:'transparent',boxShadow:'none'},
revealed:{background:'var(--bg-card-raised)',border:'1px solid var(--border-default)',color:'var(--text-primary)',boxShadow:'none'}
};
return React.createElement('button',{onClick,style:{
width:s.w,height:s.h,borderRadius:'var(--radius-md)',display:'flex',alignItems:'center',justifyContent:'center',
fontFamily:'var(--font-mono)',fontWeight:700,fontSize:s.font,cursor:onClick?'pointer':'default',
transition:'transform var(--duration-fast) var(--ease-out),box-shadow var(--duration-base) var(--ease-out),background var(--duration-base) var(--ease-out)',
...styles[state]
},onMouseDown:e=>{if(onClick)e.currentTarget.style.transform='scale(0.96)'},onMouseUp:e=>{e.currentTarget.style.transform='scale(1)'},onMouseLeave:e=>{e.currentTarget.style.transform='scale(1)'}},
state==='facedown'?React.createElement('span',{style:{color:'var(--text-tertiary)',fontSize:s.font}},'?'):value);
}
