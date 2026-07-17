export interface ParticipantRowProps {
name: string;
role?: string;
voteState?: 'waiting' | 'voted' | 'revealed';
voteValue?: string | number;
isYou?: boolean;
}
export function ParticipantRow(props: ParticipantRowProps): JSX.Element;
