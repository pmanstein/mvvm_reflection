function RevealPanel({participants,onNextRound}){
const {VoteCard,Button,Badge}=window.SprintPokerDesignSystem_1cc025;
const nums=participants.map(p=>Number(p.voteValue)).filter(n=>!isNaN(n));
const avg=nums.length?(nums.reduce((a,b)=>a+b,0)/nums.length).toFixed(1):'—';
const spread=nums.length?Math.max(...nums)-Math.min(...nums):0;
return React.createElement('div',{style:{flex:1,display:'flex',flexDirection:'column',padding:'32px 40px',gap:28}},
React.createElement('div',{style:{display:'flex',justifyContent:'space-between',alignItems:'center'}},
React.createElement('div',null,
React.createElement('div',{style:{fontSize:'var(--text-h2)',fontWeight:600,color:'var(--text-primary)'}},'Checkout flow refactor'),
React.createElement('div',{style:{color:'var(--text-tertiary)',fontSize:'var(--text-body-sm)',marginTop:4,display:'flex',gap:8,alignItems:'center'}},React.createElement(Badge,{tone:'neutral'},'Round 3 — revealed'))),
React.createElement(Button,{variant:'primary',onClick:onNextRound},'Start next round')),
React.createElement('div',{style:{display:'flex',gap:32}},
React.createElement('div',{style:{display:'flex',flexDirection:'column',gap:2}},
React.createElement('div',{style:{fontFamily:'var(--font-mono)',fontSize:'var(--text-mono-lg)',fontWeight:700,color:'var(--accent-6)'}},avg),
React.createElement('div',{style:{fontSize:'var(--text-caption)',color:'var(--text-tertiary)',textTransform:'uppercase',letterSpacing:'var(--tracking-widest)'}},'average')),
React.createElement('div',{style:{display:'flex',flexDirection:'column',gap:2}},
React.createElement('div',{style:{fontFamily:'var(--font-mono)',fontSize:'var(--text-mono-lg)',fontWeight:700,color:'var(--text-primary)'}},spread),
React.createElement('div',{style:{fontSize:'var(--text-caption)',color:'var(--text-tertiary)',textTransform:'uppercase',letterSpacing:'var(--tracking-widest)'}},'spread'))),
React.createElement('div',{style:{display:'flex',gap:20,flexWrap:'wrap'}},participants.map(p=>React.createElement('div',{key:p.name,style:{display:'flex',flexDirection:'column',alignItems:'center',gap:8}},
React.createElement(VoteCard,{value:p.voteValue,state:'revealed'}),
React.createElement('div',{style:{fontSize:'var(--text-caption)',color:'var(--text-secondary)'}},p.name)))));
}

window.RevealPanel = RevealPanel;
