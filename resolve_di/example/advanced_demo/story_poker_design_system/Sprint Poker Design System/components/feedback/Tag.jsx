import React from 'react';
export function Tag({children,onRemove}){
return React.createElement('span',{style:{display:'inline-flex',alignItems:'center',gap:'6px',background:'var(--bg-card-raised)',border:'1px solid var(--border-default)',color:'var(--text-primary)',fontSize:'var(--text-body-sm)',padding:'4px 6px 4px 10px',borderRadius:'var(--radius-pill)'}},
children,onRemove&&React.createElement('button',{onClick:onRemove,style:{background:'transparent',border:'none',color:'var(--text-tertiary)',cursor:'pointer',fontSize:14,padding:'0 4px',lineHeight:1}},'✕'));
}
