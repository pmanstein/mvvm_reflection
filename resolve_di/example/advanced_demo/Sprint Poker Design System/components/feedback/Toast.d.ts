export interface ToastProps {
tone?: 'neutral' | 'success' | 'danger';
children?: React.ReactNode;
onClose?: () => void;
}
export function Toast(props: ToastProps): JSX.Element;
