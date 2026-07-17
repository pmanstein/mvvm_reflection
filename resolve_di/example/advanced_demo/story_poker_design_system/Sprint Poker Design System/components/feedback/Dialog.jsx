import React from 'react';
export function Dialog({open,title,children,onClose,footer}){
if(!open)return null;
return React.createElement('div',{style:{position:'fixed',inset:0,background:'var(--bg-overlay)',backdropFilter:'var(--blur-overlay)',display:'flex',alignItems:'center',justifyContent:'center',zIndex:100}},
React.createElement('div',{style:{background:'var(--bg-card)',border:'1px solid var(--border-default)',borderRadius:'var(--radius-lg)',boxShadow:'var(--shadow-overlay)',width:420,maxWidth:'90vw',padding:'var(--space-6)'}},
React.createElement('div',{style:{display:'flex',justifyContent:'space-between',alignItems:'center',marginBottom:'var(--space-4)'}},
React.createElement('h3',{style:{margin:0,fontSize:'var(--text-h3)',color:'var(--text-primary)'}},title),
React.createElement('button',{onClick:onClose,style:{background:'transparent',border:'none',color:'var(--text-tertiary)',cursor:'pointer',fontSize:18}},'✕')),
React.createElement('div',{style:{color:'var(--text-secondary)',fontSize:'var(--text-body)'}},children),
footer&&React.createElement('div',{style:{display:'flex',justifyContent:'flex-end',gap:'var(--space-3)',marginTop:'var(--space-6)'}},footer)));
}
