import React from 'react';
export function IconButton({icon,size=36,label,active=false,onClick,variant='ghost'}){
const variants={ghost:{background:active?'var(--bg-card-raised)':'transparent',border:'1px solid transparent',color:active?'var(--accent-6)':'var(--text-secondary)'},outline:{background:'var(--bg-card)',border:'1px solid var(--border-default)',color:'var(--text-primary)'}};
return React.createElement('button',{'aria-label':label,title:label,onClick,style:{width:size,height:size,borderRadius:'var(--radius-sm)',display:'inline-flex',alignItems:'center',justifyContent:'center',cursor:'pointer',transition:'background var(--duration-fast) var(--ease-out),color var(--duration-fast) var(--ease-out)',...variants[variant]}},
React.createElement('span',{className:'mono',style:{fontSize:size*0.42,lineHeight:1}},icon));
}
