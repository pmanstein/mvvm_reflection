import React from 'react';
export function ProgressBar({value=0,total=1,label}){
const pct=Math.round((value/Math.max(total,1))*100);
return React.createElement('div',{style:{display:'flex',flexDirection:'column',gap:'6px'}},
label&&React.createElement('div',{style:{display:'flex',justifyContent:'space-between',fontSize:'var(--text-caption)',color:'var(--text-secondary)'}},
React.createElement('span',null,label),React.createElement('span',{className:'mono',style:{fontFamily:'var(--font-mono)'}},`${value}/${total}`)),
React.createElement('div',{style:{height:6,borderRadius:'var(--radius-pill)',background:'var(--gray-3)',overflow:'hidden'}},
React.createElement('div',{style:{height:'100%',width:`${pct}%`,background:'var(--accent-6)',transition:'width var(--duration-base) var(--ease-out)'}})));
}
