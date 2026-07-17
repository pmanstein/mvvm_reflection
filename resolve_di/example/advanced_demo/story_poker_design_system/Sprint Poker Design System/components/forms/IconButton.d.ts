export interface IconButtonProps {
/** Glyph/character to render (this system substitutes Lucide icons via CDN in real usage; pass any single glyph here for the primitive) */
icon: string;
size?: number;
label: string;
active?: boolean;
variant?: 'ghost' | 'outline';
onClick?: () => void;
}
export function IconButton(props: IconButtonProps): JSX.Element;
