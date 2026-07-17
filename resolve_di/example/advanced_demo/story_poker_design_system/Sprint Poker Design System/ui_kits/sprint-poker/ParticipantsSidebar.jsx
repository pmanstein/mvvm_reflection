function ParticipantsSidebar({participants,you}){
const {ParticipantRow,Avatar,Badge}=window.SprintPokerDesignSystem_1cc025;
return React.createElement('div',{style:{width:220,borderRight:'1px solid var(--border-subtle)',padding:'20px 16px',display:'flex',flexDirection:'column',gap:16,background:'var(--bg-surface)'}},
React.createElement('div',{style:{display:'flex',justifyContent:'space-between',alignItems:'center'}},
React.createElement('div',{style:{fontSize:'var(--text-caption)',color:'var(--text-tertiary)',textTransform:'uppercase',letterSpacing:'var(--tracking-wide)'}},'Participants'),
React.createElement(Badge,{tone:'neutral'},participants.length)),
React.createElement('div',null,participants.map(p=>React.createElement(ParticipantRow,{key:p.name,name:p.name,role:p.role,voteState:p.voteState,voteValue:p.voteValue,isYou:p.name===you}))));
}

window.ParticipantsSidebar = ParticipantsSidebar;
