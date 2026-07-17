import React from 'react';
export function Toast({tone='neutral',children,onClose}){
const tones={neutral:{border:'var(--border-default)',icon:'●',color:'var(--text-primary)'},success:{border:'var(--accent-6)',icon:'●',color:'var(--accent-7)'},danger:{border:'var(--danger)',icon:'●',color:'var(--red-8)'}};
const t=tones[tone];
return React.createElement('div',{style:{display:'flex',alignItems:'center',gap:'10px',background:'var(--bg-card-raised)',border:`1px solid ${t.border}`,borderRadius:'var(--radius-sm)',padding:'10px 14px',boxShadow:'var(--shadow-md)',fontSize:'var(--text-body-sm)',color:'var(--text-primary)'}},
React.createElement('span',{style:{color:t.color,fontSize:10}},t.icon),
React.createElement('span',null,children),
onClose&&React.createElement('button',{onClick:onClose,style:{marginLeft:'8px',background:'transparent',border:'none',color:'var(--text-tertiary)',cursor:'pointer'}},'✕'));
}
