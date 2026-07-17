import React from 'react';
export function Card({children,padding='var(--space-6)',raised=false,accent=false,style}){
return React.createElement('div',{style:{
background:raised?'var(--bg-card-raised)':'var(--bg-card)',
border:`1px solid ${accent?'var(--accent-border)':'var(--border-subtle)'}`,
borderRadius:'var(--radius-card)',padding,...style}},children);
}
