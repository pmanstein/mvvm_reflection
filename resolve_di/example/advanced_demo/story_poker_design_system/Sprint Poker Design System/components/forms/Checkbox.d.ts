export interface CheckboxProps {
checked: boolean;
onChange?: (checked: boolean) => void;
label?: string;
}
export function Checkbox(props: CheckboxProps): JSX.Element;
