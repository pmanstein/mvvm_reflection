import React from 'react';
export function Input({label,placeholder,value,onChange,mono=false,error,size='md'}){
return React.createElement('div',{style:{display:'flex',flexDirection:'column',gap:'6px'}},
label&&React.createElement('label',{style:{fontSize:'var(--text-caption)',color:'var(--text-secondary)',fontWeight:'var(--weight-medium)'}},label),
React.createElement('input',{value,placeholder,onChange,style:{
background:'var(--bg-card)',border:`1px solid ${error?'var(--danger)':'var(--border-default)'}`,borderRadius:'var(--radius-sm)',
color:'var(--text-primary)',padding:size==='sm'?'6px 10px':'10px 12px',fontSize:'var(--text-body)',fontFamily:mono?'var(--font-mono)':'var(--font-sans)',outline:'none',
transition:'border-color var(--duration-fast) var(--ease-out)'
},onFocus:e=>e.currentTarget.style.borderColor='var(--focus-ring)',onBlur:e=>e.currentTarget.style.borderColor=error?'var(--danger)':'var(--border-default)'}),
error&&React.createElement('span',{style:{fontSize:'var(--text-caption)',color:'var(--danger)'}},error)
);
}
