import React from 'react';
export function Switch({checked,onChange,label}){
return React.createElement('label',{style:{display:'inline-flex',alignItems:'center',gap:'10px',cursor:'pointer'}},
React.createElement('span',{onClick:()=>onChange&&onChange(!checked),style:{
width:36,height:20,borderRadius:'var(--radius-pill)',background:checked?'var(--accent-6)':'var(--gray-5)',
position:'relative',transition:'background var(--duration-fast) var(--ease-out)',flexShrink:0
}},React.createElement('span',{style:{
position:'absolute',top:2,left:checked?18:2,width:16,height:16,borderRadius:'50%',background:'var(--gray-0)',
transition:'left var(--duration-fast) var(--ease-out)'
}})),
label&&React.createElement('span',{style:{fontSize:'var(--text-body)',color:'var(--text-primary)'}},label));
}
