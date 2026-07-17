import React from 'react';
export function Button({variant='primary',size='md',disabled=false,children,onClick,type='button'}){
const sizes={sm:{padding:'6px 12px',fontSize:'var(--text-body-sm)'},md:{padding:'9px 16px',fontSize:'var(--text-body)'},lg:{padding:'12px 20px',fontSize:'var(--text-body-lg)'}};
const variants={
primary:{background:'var(--accent-6)',color:'var(--text-on-accent)',border:'1px solid var(--accent-6)'},
secondary:{background:'var(--bg-card-raised)',color:'var(--text-primary)',border:'1px solid var(--border-default)'},
ghost:{background:'transparent',color:'var(--text-secondary)',border:'1px solid transparent'},
danger:{background:'transparent',color:'var(--danger)',border:'1px solid var(--danger)'}
};
const base={fontFamily:'var(--font-sans)',fontWeight:'var(--weight-semibold)',borderRadius:'var(--radius-sm)',cursor:disabled?'not-allowed':'pointer',opacity:disabled?0.45:1,transition:'background var(--duration-fast) var(--ease-out),transform var(--duration-fast) var(--ease-out),color var(--duration-fast) var(--ease-out)',display:'inline-flex',alignItems:'center',gap:'8px',...sizes[size],...variants[variant]};
return React.createElement('button',{type,disabled,onClick,style:base,onMouseDown:e=>{if(!disabled)e.currentTarget.style.transform='scale(0.97)'},onMouseUp:e=>{e.currentTarget.style.transform='scale(1)'},onMouseLeave:e=>{e.currentTarget.style.transform='scale(1)'}},children);
}
