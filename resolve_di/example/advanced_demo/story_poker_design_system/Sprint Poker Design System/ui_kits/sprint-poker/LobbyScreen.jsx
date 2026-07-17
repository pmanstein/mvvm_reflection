function LobbyScreen({name,setName,code,setCode,onJoin,onCreate}){
const {Button,Input,Card}=window.SprintPokerDesignSystem_1cc025;
return React.createElement('div',{style:{minHeight:'100vh',background:'var(--bg-canvas)',display:'flex',alignItems:'center',justifyContent:'center',fontFamily:'var(--font-sans)'}},
React.createElement(Card,{style:{width:380,padding:'32px'}},
React.createElement('div',{style:{fontFamily:'var(--font-mono)',fontWeight:700,fontSize:22,color:'var(--accent-6)',marginBottom:4}},'Sprint',React.createElement('span',{style:{color:'var(--text-primary)'}},'Poker')),
React.createElement('div',{style:{color:'var(--text-tertiary)',fontSize:'var(--text-body-sm)',marginBottom:24}},'Real-time estimation for your team.'),
React.createElement('div',{style:{display:'flex',flexDirection:'column',gap:14}},
React.createElement(Input,{label:'Your name',placeholder:'Jordan',value:name,onChange:e=>setName(e.target.value)}),
React.createElement(Input,{label:'Session code',mono:true,placeholder:'SP-4821',value:code,onChange:e=>setCode(e.target.value)}),
React.createElement(Button,{variant:'primary',onClick:onJoin,disabled:!name||!code},'Join session'),
React.createElement('div',{style:{textAlign:'center',color:'var(--text-tertiary)',fontSize:'var(--text-caption)'}},'— or —'),
React.createElement(Button,{variant:'secondary',onClick:onCreate,disabled:!name},'Create new session'))));
}

window.LobbyScreen = LobbyScreen;
