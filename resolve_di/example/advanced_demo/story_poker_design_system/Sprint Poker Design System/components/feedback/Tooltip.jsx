import React,{useState} from 'react';
export function Tooltip({label,children}){
const [show,setShow]=useState(false);
return React.createElement('span',{style:{position:'relative',display:'inline-flex'},onMouseEnter:()=>setShow(true),onMouseLeave:()=>setShow(false)},
children,
show&&React.createElement('span',{style:{position:'absolute',bottom:'calc(100% + 6px)',left:'50%',transform:'translateX(-50%)',background:'var(--gray-4)',color:'var(--text-primary)',fontSize:'var(--text-caption)',padding:'5px 9px',borderRadius:'var(--radius-xs)',whiteSpace:'nowrap',border:'1px solid var(--border-strong)',zIndex:10}},label));
}
