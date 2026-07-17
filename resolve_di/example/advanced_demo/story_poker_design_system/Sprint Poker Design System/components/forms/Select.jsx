import React from 'react';
export function Select({label,value,onChange,options=[]}){
return React.createElement('div',{style:{display:'flex',flexDirection:'column',gap:'6px'}},
label&&React.createElement('label',{style:{fontSize:'var(--text-caption)',color:'var(--text-secondary)',fontWeight:'var(--weight-medium)'}},label),
React.createElement('select',{value,onChange,style:{
background:'var(--bg-card)',border:'1px solid var(--border-default)',borderRadius:'var(--radius-sm)',color:'var(--text-primary)',
padding:'9px 12px',fontSize:'var(--text-body)',fontFamily:'var(--font-sans)',outline:'none',appearance:'none'
}},options.map(o=>React.createElement('option',{key:o.value,value:o.value},o.label)))
);
}
