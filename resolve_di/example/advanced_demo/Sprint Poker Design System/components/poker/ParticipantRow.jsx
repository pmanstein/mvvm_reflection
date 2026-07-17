import React from 'react';
export function ParticipantRow({name,role,voteState='waiting',voteValue,isYou=false}){
const stateLabel={waiting:'Waiting',voted:'Voted',revealed:voteValue};
const stateColor={waiting:'var(--text-tertiary)',voted:'var(--accent-6)',revealed:'var(--text-primary)'};
return React.createElement('div',{style:{display:'flex',alignItems:'center',gap:'12px',padding:'8px 4px'}},
React.createElement('span',{style:{width:8,height:8,borderRadius:'50%',background:voteState==='waiting'?'var(--gray-5)':'var(--accent-6)',flexShrink:0}}),
React.createElement('span',{style:{flex:1,fontSize:'var(--text-body)',color:'var(--text-primary)',fontWeight:isYou?'var(--weight-semibold)':'var(--weight-regular)'}},name,isYou?' (you)':'',role&&React.createElement('span',{key:'role',style:{color:'var(--text-tertiary)',fontSize:'var(--text-caption)',marginLeft:'8px'}},role)),
React.createElement('span',{style:{fontFamily:'var(--font-mono)',fontSize:'var(--text-body-sm)',color:stateColor[voteState],minWidth:36,textAlign:'right'}},stateLabel[voteState]));
}
