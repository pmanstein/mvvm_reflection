import React from 'react';
const COLORS=['#9FEF00','#3D9CF5','#F5A623','#F0435E','#B8FF33','#7A8496'];
function hash(s){let h=0;for(let i=0;i<s.length;i++)h=(h*31+s.charCodeAt(i))|0;return Math.abs(h);}
export function Avatar({name='',size=32,online=false}){
const initials=name.split(' ').map(p=>p[0]).slice(0,2).join('').toUpperCase();
const color=COLORS[hash(name)%COLORS.length];
return React.createElement('span',{style:{position:'relative',display:'inline-flex'}},
React.createElement('span',{style:{width:size,height:size,borderRadius:'50%',background:'var(--gray-3)',border:`1.5px solid ${color}`,color,display:'inline-flex',alignItems:'center',justifyContent:'center',fontFamily:'var(--font-mono)',fontWeight:600,fontSize:size*0.36}},initials),
online&&React.createElement('span',{style:{position:'absolute',bottom:-1,right:-1,width:size*0.3,height:size*0.3,borderRadius:'50%',background:'var(--accent-6)',border:'2px solid var(--bg-canvas)'}}));
}
