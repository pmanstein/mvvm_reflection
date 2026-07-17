export interface VoteCardProps {
value?: string | number;
/** idle = selectable in deck; selected = user's active pick (accent glow); facedown = someone voted, hidden; revealed = shown after reveal */
state?: 'idle' | 'selected' | 'facedown' | 'revealed';
size?: 'sm' | 'md' | 'lg';
onClick?: () => void;
}
export function VoteCard(props: VoteCardProps): JSX.Element;
