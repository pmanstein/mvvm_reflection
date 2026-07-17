import React from 'react';
export function Badge({children,tone='neutral'}){
const tones={neutral:{background:'var(--gray-4)',color:'var(--text-secondary)'},accent:{background:'var(--accent-muted)',color:'var(--accent-8)'},success:{background:'var(--accent-muted)',color:'var(--accent-7)'},danger:{background:'var(--danger-muted)',color:'var(--red-8)'},warning:{background:'#3A2A0C',color:'var(--amber-8)'}};
return React.createElement('span',{style:{...tones[tone],fontFamily:'var(--font-mono)',fontSize:'var(--text-caption)',fontWeight:'var(--weight-medium)',letterSpacing:'var(--tracking-wide)',textTransform:'uppercase',padding:'3px 8px',borderRadius:'var(--radius-pill)',display:'inline-flex',alignItems:'center'}},children);
}
