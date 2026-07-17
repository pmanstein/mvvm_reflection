import React from 'react';
export function Checkbox({checked,onChange,label}){
return React.createElement('label',{style:{display:'inline-flex',alignItems:'center',gap:'8px',cursor:'pointer',fontSize:'var(--text-body)',color:'var(--text-primary)'}},
React.createElement('span',{onClick:()=>onChange&&onChange(!checked),style:{
width:18,height:18,borderRadius:'4px',border:`1px solid ${checked?'var(--accent-6)':'var(--border-strong)'}`,
background:checked?'var(--accent-6)':'transparent',display:'inline-flex',alignItems:'center',justifyContent:'center',
transition:'background var(--duration-fast) var(--ease-out),border-color var(--duration-fast) var(--ease-out)'
}},checked&&React.createElement('span',{style:{color:'var(--text-on-accent)',fontSize:12,fontWeight:700}},'✓')),
label);
}
