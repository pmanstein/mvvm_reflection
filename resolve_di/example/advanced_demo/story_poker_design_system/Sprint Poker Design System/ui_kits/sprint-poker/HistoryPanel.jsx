function HistoryPanel({rounds}){
const {Card,Badge}=window.SprintPokerDesignSystem_1cc025;
return React.createElement('div',{style:{flex:1,padding:'32px 40px',display:'flex',flexDirection:'column',gap:16}},
React.createElement('div',{style:{fontSize:'var(--text-h2)',fontWeight:600,color:'var(--text-primary)'}},'Round history'),
React.createElement('div',{style:{display:'flex',flexDirection:'column',gap:10}},rounds.map(r=>React.createElement(Card,{key:r.title,style:{display:'flex',justifyContent:'space-between',alignItems:'center'}},
React.createElement('div',null,
React.createElement('div',{style:{color:'var(--text-primary)',fontSize:'var(--text-body)'}},r.title),
React.createElement('div',{style:{color:'var(--text-tertiary)',fontSize:'var(--text-caption)',marginTop:2}},r.votes.join(', '))),
React.createElement('div',{style:{display:'flex',alignItems:'center',gap:10}},
React.createElement('div',{style:{fontFamily:'var(--font-mono)',fontWeight:700,color:'var(--accent-6)',fontSize:'var(--text-mono)'}},r.avg),
React.createElement(Badge,{tone:'neutral'},'AVG'))))));
}

window.HistoryPanel = HistoryPanel;
