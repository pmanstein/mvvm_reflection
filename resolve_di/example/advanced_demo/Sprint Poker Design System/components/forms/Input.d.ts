export interface InputProps {
label?: string;
placeholder?: string;
value?: string;
onChange?: (e: React.ChangeEvent<HTMLInputElement>) => void;
/** Use monospace for codes/IDs (e.g. session code) */
mono?: boolean;
error?: string;
size?: 'sm' | 'md';
}
export function Input(props: InputProps): JSX.Element;
