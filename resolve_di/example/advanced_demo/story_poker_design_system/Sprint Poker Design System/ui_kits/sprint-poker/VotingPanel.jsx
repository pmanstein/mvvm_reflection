function VotingPanel({deck,selected,onSelect,participants,onReveal,allVoted}){
const {VoteCard,Button,ProgressBar,Badge}=window.SprintPokerDesignSystem_1cc025;
const votedCount=participants.filter(p=>p.voteState!=='waiting').length;
return React.createElement('div',{style:{flex:1,display:'flex',flexDirection:'column',padding:'32px 40px',gap:28}},
React.createElement('div',{style:{display:'flex',justifyContent:'space-between',alignItems:'center'}},
React.createElement('div',null,
React.createElement('div',{style:{fontSize:'var(--text-h2)',fontWeight:600,color:'var(--text-primary)'}},'Checkout flow refactor'),
React.createElement('div',{style:{color:'var(--text-tertiary)',fontSize:'var(--text-body-sm)',marginTop:4,display:'flex',gap:8,alignItems:'center'}},React.createElement(Badge,{tone:'success'},'LIVE'),'Round 3')),
React.createElement(Button,{variant:'primary',onClick:onReveal,disabled:!allVoted},'Reveal votes')),
React.createElement(ProgressBar,{value:votedCount,total:participants.length,label:'Votes in'}),
React.createElement('div',null,
React.createElement('div',{style:{color:'var(--text-secondary)',fontSize:'var(--text-body-sm)',marginBottom:12}},'Pick your estimate'),
React.createElement('div',{style:{display:'flex',gap:14,flexWrap:'wrap'}},deck.map(v=>React.createElement(VoteCard,{key:v,value:v,state:selected===v?'selected':'idle',onClick:()=>onSelect(v)})))));
}

window.VotingPanel = VotingPanel;
