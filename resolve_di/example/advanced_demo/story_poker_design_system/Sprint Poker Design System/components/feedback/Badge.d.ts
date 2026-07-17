export interface BadgeProps {
tone?: 'neutral' | 'accent' | 'success' | 'danger' | 'warning';
children?: React.ReactNode;
}
export function Badge(props: BadgeProps): JSX.Element;
