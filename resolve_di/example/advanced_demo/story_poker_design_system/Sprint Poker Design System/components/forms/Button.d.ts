export interface ButtonProps {
/** Visual style */
variant?: 'primary' | 'secondary' | 'ghost' | 'danger';
size?: 'sm' | 'md' | 'lg';
disabled?: boolean;
onClick?: () => void;
type?: 'button' | 'submit';
children?: React.ReactNode;
}
export function Button(props: ButtonProps): JSX.Element;
