/* @ds-bundle: {"format":4,"namespace":"SprintPokerDesignSystem_1cc025","components":[{"name":"Avatar","sourcePath":"components/data/Avatar.jsx"},{"name":"Card","sourcePath":"components/data/Card.jsx"},{"name":"ProgressBar","sourcePath":"components/data/ProgressBar.jsx"},{"name":"Badge","sourcePath":"components/feedback/Badge.jsx"},{"name":"Dialog","sourcePath":"components/feedback/Dialog.jsx"},{"name":"Tag","sourcePath":"components/feedback/Tag.jsx"},{"name":"Toast","sourcePath":"components/feedback/Toast.jsx"},{"name":"Tooltip","sourcePath":"components/feedback/Tooltip.jsx"},{"name":"Button","sourcePath":"components/forms/Button.jsx"},{"name":"Checkbox","sourcePath":"components/forms/Checkbox.jsx"},{"name":"IconButton","sourcePath":"components/forms/IconButton.jsx"},{"name":"Input","sourcePath":"components/forms/Input.jsx"},{"name":"Select","sourcePath":"components/forms/Select.jsx"},{"name":"Switch","sourcePath":"components/forms/Switch.jsx"},{"name":"ParticipantRow","sourcePath":"components/poker/ParticipantRow.jsx"},{"name":"VoteCard","sourcePath":"components/poker/VoteCard.jsx"}],"sourceHashes":{"components/data/Avatar.jsx":"8b5c81d54025","components/data/Card.jsx":"072e6f19260d","components/data/ProgressBar.jsx":"89138e70bf4b","components/feedback/Badge.jsx":"783ea57df674","components/feedback/Dialog.jsx":"c4be22577d61","components/feedback/Tag.jsx":"1064b41bf8fe","components/feedback/Toast.jsx":"551245f717ee","components/feedback/Tooltip.jsx":"59f2f1dda389","components/forms/Button.jsx":"d24bf2df9309","components/forms/Checkbox.jsx":"96049ad94f56","components/forms/IconButton.jsx":"c8eeb9f5589b","components/forms/Input.jsx":"b099d7a5d15d","components/forms/Select.jsx":"7cae3177c6fa","components/forms/Switch.jsx":"104bf67a2d79","components/poker/ParticipantRow.jsx":"81482462ba5e","components/poker/VoteCard.jsx":"9ca7cf4cabb7","ui_kits/sprint-poker/HistoryPanel.jsx":"46c319242925","ui_kits/sprint-poker/LobbyScreen.jsx":"aeca92e4dbc1","ui_kits/sprint-poker/ParticipantsSidebar.jsx":"64288509af60","ui_kits/sprint-poker/RevealPanel.jsx":"829ff3c4492d","ui_kits/sprint-poker/VotingPanel.jsx":"cc30bfe215af"},"inlinedExternals":[],"unexposedExports":[]} */

(() => {

const __ds_ns = (window.SprintPokerDesignSystem_1cc025 = window.SprintPokerDesignSystem_1cc025 || {});

const __ds_scope = {};

(__ds_ns.__errors = __ds_ns.__errors || []);

// components/data/Avatar.jsx
try { (() => {
const COLORS = ['#9FEF00', '#3D9CF5', '#F5A623', '#F0435E', '#B8FF33', '#7A8496'];
function hash(s) {
  let h = 0;
  for (let i = 0; i < s.length; i++) h = h * 31 + s.charCodeAt(i) | 0;
  return Math.abs(h);
}
function Avatar({
  name = '',
  size = 32,
  online = false
}) {
  const initials = name.split(' ').map(p => p[0]).slice(0, 2).join('').toUpperCase();
  const color = COLORS[hash(name) % COLORS.length];
  return React.createElement('span', {
    style: {
      position: 'relative',
      display: 'inline-flex'
    }
  }, React.createElement('span', {
    style: {
      width: size,
      height: size,
      borderRadius: '50%',
      background: 'var(--gray-3)',
      border: `1.5px solid ${color}`,
      color,
      display: 'inline-flex',
      alignItems: 'center',
      justifyContent: 'center',
      fontFamily: 'var(--font-mono)',
      fontWeight: 600,
      fontSize: size * 0.36
    }
  }, initials), online && React.createElement('span', {
    style: {
      position: 'absolute',
      bottom: -1,
      right: -1,
      width: size * 0.3,
      height: size * 0.3,
      borderRadius: '50%',
      background: 'var(--accent-6)',
      border: '2px solid var(--bg-canvas)'
    }
  }));
}
Object.assign(__ds_scope, { Avatar });
})(); } catch (e) { __ds_ns.__errors.push({ path: "components/data/Avatar.jsx", error: String((e && e.message) || e) }); }

// components/data/Card.jsx
try { (() => {
function Card({
  children,
  padding = 'var(--space-6)',
  raised = false,
  accent = false,
  style
}) {
  return React.createElement('div', {
    style: {
      background: raised ? 'var(--bg-card-raised)' : 'var(--bg-card)',
      border: `1px solid ${accent ? 'var(--accent-border)' : 'var(--border-subtle)'}`,
      borderRadius: 'var(--radius-card)',
      padding,
      ...style
    }
  }, children);
}
Object.assign(__ds_scope, { Card });
})(); } catch (e) { __ds_ns.__errors.push({ path: "components/data/Card.jsx", error: String((e && e.message) || e) }); }

// components/data/ProgressBar.jsx
try { (() => {
function ProgressBar({
  value = 0,
  total = 1,
  label
}) {
  const pct = Math.round(value / Math.max(total, 1) * 100);
  return React.createElement('div', {
    style: {
      display: 'flex',
      flexDirection: 'column',
      gap: '6px'
    }
  }, label && React.createElement('div', {
    style: {
      display: 'flex',
      justifyContent: 'space-between',
      fontSize: 'var(--text-caption)',
      color: 'var(--text-secondary)'
    }
  }, React.createElement('span', null, label), React.createElement('span', {
    className: 'mono',
    style: {
      fontFamily: 'var(--font-mono)'
    }
  }, `${value}/${total}`)), React.createElement('div', {
    style: {
      height: 6,
      borderRadius: 'var(--radius-pill)',
      background: 'var(--gray-3)',
      overflow: 'hidden'
    }
  }, React.createElement('div', {
    style: {
      height: '100%',
      width: `${pct}%`,
      background: 'var(--accent-6)',
      transition: 'width var(--duration-base) var(--ease-out)'
    }
  })));
}
Object.assign(__ds_scope, { ProgressBar });
})(); } catch (e) { __ds_ns.__errors.push({ path: "components/data/ProgressBar.jsx", error: String((e && e.message) || e) }); }

// components/feedback/Badge.jsx
try { (() => {
function Badge({
  children,
  tone = 'neutral'
}) {
  const tones = {
    neutral: {
      background: 'var(--gray-4)',
      color: 'var(--text-secondary)'
    },
    accent: {
      background: 'var(--accent-muted)',
      color: 'var(--accent-8)'
    },
    success: {
      background: 'var(--accent-muted)',
      color: 'var(--accent-7)'
    },
    danger: {
      background: 'var(--danger-muted)',
      color: 'var(--red-8)'
    },
    warning: {
      background: '#3A2A0C',
      color: 'var(--amber-8)'
    }
  };
  return React.createElement('span', {
    style: {
      ...tones[tone],
      fontFamily: 'var(--font-mono)',
      fontSize: 'var(--text-caption)',
      fontWeight: 'var(--weight-medium)',
      letterSpacing: 'var(--tracking-wide)',
      textTransform: 'uppercase',
      padding: '3px 8px',
      borderRadius: 'var(--radius-pill)',
      display: 'inline-flex',
      alignItems: 'center'
    }
  }, children);
}
Object.assign(__ds_scope, { Badge });
})(); } catch (e) { __ds_ns.__errors.push({ path: "components/feedback/Badge.jsx", error: String((e && e.message) || e) }); }

// components/feedback/Dialog.jsx
try { (() => {
function Dialog({
  open,
  title,
  children,
  onClose,
  footer
}) {
  if (!open) return null;
  return React.createElement('div', {
    style: {
      position: 'fixed',
      inset: 0,
      background: 'var(--bg-overlay)',
      backdropFilter: 'var(--blur-overlay)',
      display: 'flex',
      alignItems: 'center',
      justifyContent: 'center',
      zIndex: 100
    }
  }, React.createElement('div', {
    style: {
      background: 'var(--bg-card)',
      border: '1px solid var(--border-default)',
      borderRadius: 'var(--radius-lg)',
      boxShadow: 'var(--shadow-overlay)',
      width: 420,
      maxWidth: '90vw',
      padding: 'var(--space-6)'
    }
  }, React.createElement('div', {
    style: {
      display: 'flex',
      justifyContent: 'space-between',
      alignItems: 'center',
      marginBottom: 'var(--space-4)'
    }
  }, React.createElement('h3', {
    style: {
      margin: 0,
      fontSize: 'var(--text-h3)',
      color: 'var(--text-primary)'
    }
  }, title), React.createElement('button', {
    onClick: onClose,
    style: {
      background: 'transparent',
      border: 'none',
      color: 'var(--text-tertiary)',
      cursor: 'pointer',
      fontSize: 18
    }
  }, '✕')), React.createElement('div', {
    style: {
      color: 'var(--text-secondary)',
      fontSize: 'var(--text-body)'
    }
  }, children), footer && React.createElement('div', {
    style: {
      display: 'flex',
      justifyContent: 'flex-end',
      gap: 'var(--space-3)',
      marginTop: 'var(--space-6)'
    }
  }, footer)));
}
Object.assign(__ds_scope, { Dialog });
})(); } catch (e) { __ds_ns.__errors.push({ path: "components/feedback/Dialog.jsx", error: String((e && e.message) || e) }); }

// components/feedback/Tag.jsx
try { (() => {
function Tag({
  children,
  onRemove
}) {
  return React.createElement('span', {
    style: {
      display: 'inline-flex',
      alignItems: 'center',
      gap: '6px',
      background: 'var(--bg-card-raised)',
      border: '1px solid var(--border-default)',
      color: 'var(--text-primary)',
      fontSize: 'var(--text-body-sm)',
      padding: '4px 6px 4px 10px',
      borderRadius: 'var(--radius-pill)'
    }
  }, children, onRemove && React.createElement('button', {
    onClick: onRemove,
    style: {
      background: 'transparent',
      border: 'none',
      color: 'var(--text-tertiary)',
      cursor: 'pointer',
      fontSize: 14,
      padding: '0 4px',
      lineHeight: 1
    }
  }, '✕'));
}
Object.assign(__ds_scope, { Tag });
})(); } catch (e) { __ds_ns.__errors.push({ path: "components/feedback/Tag.jsx", error: String((e && e.message) || e) }); }

// components/feedback/Toast.jsx
try { (() => {
function Toast({
  tone = 'neutral',
  children,
  onClose
}) {
  const tones = {
    neutral: {
      border: 'var(--border-default)',
      icon: '●',
      color: 'var(--text-primary)'
    },
    success: {
      border: 'var(--accent-6)',
      icon: '●',
      color: 'var(--accent-7)'
    },
    danger: {
      border: 'var(--danger)',
      icon: '●',
      color: 'var(--red-8)'
    }
  };
  const t = tones[tone];
  return React.createElement('div', {
    style: {
      display: 'flex',
      alignItems: 'center',
      gap: '10px',
      background: 'var(--bg-card-raised)',
      border: `1px solid ${t.border}`,
      borderRadius: 'var(--radius-sm)',
      padding: '10px 14px',
      boxShadow: 'var(--shadow-md)',
      fontSize: 'var(--text-body-sm)',
      color: 'var(--text-primary)'
    }
  }, React.createElement('span', {
    style: {
      color: t.color,
      fontSize: 10
    }
  }, t.icon), React.createElement('span', null, children), onClose && React.createElement('button', {
    onClick: onClose,
    style: {
      marginLeft: '8px',
      background: 'transparent',
      border: 'none',
      color: 'var(--text-tertiary)',
      cursor: 'pointer'
    }
  }, '✕'));
}
Object.assign(__ds_scope, { Toast });
})(); } catch (e) { __ds_ns.__errors.push({ path: "components/feedback/Toast.jsx", error: String((e && e.message) || e) }); }

// components/feedback/Tooltip.jsx
try { (() => {
const {
  useState
} = React;
function Tooltip({
  label,
  children
}) {
  const [show, setShow] = useState(false);
  return React.createElement('span', {
    style: {
      position: 'relative',
      display: 'inline-flex'
    },
    onMouseEnter: () => setShow(true),
    onMouseLeave: () => setShow(false)
  }, children, show && React.createElement('span', {
    style: {
      position: 'absolute',
      bottom: 'calc(100% + 6px)',
      left: '50%',
      transform: 'translateX(-50%)',
      background: 'var(--gray-4)',
      color: 'var(--text-primary)',
      fontSize: 'var(--text-caption)',
      padding: '5px 9px',
      borderRadius: 'var(--radius-xs)',
      whiteSpace: 'nowrap',
      border: '1px solid var(--border-strong)',
      zIndex: 10
    }
  }, label));
}
Object.assign(__ds_scope, { Tooltip });
})(); } catch (e) { __ds_ns.__errors.push({ path: "components/feedback/Tooltip.jsx", error: String((e && e.message) || e) }); }

// components/forms/Button.jsx
try { (() => {
function Button({
  variant = 'primary',
  size = 'md',
  disabled = false,
  children,
  onClick,
  type = 'button'
}) {
  const sizes = {
    sm: {
      padding: '6px 12px',
      fontSize: 'var(--text-body-sm)'
    },
    md: {
      padding: '9px 16px',
      fontSize: 'var(--text-body)'
    },
    lg: {
      padding: '12px 20px',
      fontSize: 'var(--text-body-lg)'
    }
  };
  const variants = {
    primary: {
      background: 'var(--accent-6)',
      color: 'var(--text-on-accent)',
      border: '1px solid var(--accent-6)'
    },
    secondary: {
      background: 'var(--bg-card-raised)',
      color: 'var(--text-primary)',
      border: '1px solid var(--border-default)'
    },
    ghost: {
      background: 'transparent',
      color: 'var(--text-secondary)',
      border: '1px solid transparent'
    },
    danger: {
      background: 'transparent',
      color: 'var(--danger)',
      border: '1px solid var(--danger)'
    }
  };
  const base = {
    fontFamily: 'var(--font-sans)',
    fontWeight: 'var(--weight-semibold)',
    borderRadius: 'var(--radius-sm)',
    cursor: disabled ? 'not-allowed' : 'pointer',
    opacity: disabled ? 0.45 : 1,
    transition: 'background var(--duration-fast) var(--ease-out),transform var(--duration-fast) var(--ease-out),color var(--duration-fast) var(--ease-out)',
    display: 'inline-flex',
    alignItems: 'center',
    gap: '8px',
    ...sizes[size],
    ...variants[variant]
  };
  return React.createElement('button', {
    type,
    disabled,
    onClick,
    style: base,
    onMouseDown: e => {
      if (!disabled) e.currentTarget.style.transform = 'scale(0.97)';
    },
    onMouseUp: e => {
      e.currentTarget.style.transform = 'scale(1)';
    },
    onMouseLeave: e => {
      e.currentTarget.style.transform = 'scale(1)';
    }
  }, children);
}
Object.assign(__ds_scope, { Button });
})(); } catch (e) { __ds_ns.__errors.push({ path: "components/forms/Button.jsx", error: String((e && e.message) || e) }); }

// components/forms/Checkbox.jsx
try { (() => {
function Checkbox({
  checked,
  onChange,
  label
}) {
  return React.createElement('label', {
    style: {
      display: 'inline-flex',
      alignItems: 'center',
      gap: '8px',
      cursor: 'pointer',
      fontSize: 'var(--text-body)',
      color: 'var(--text-primary)'
    }
  }, React.createElement('span', {
    onClick: () => onChange && onChange(!checked),
    style: {
      width: 18,
      height: 18,
      borderRadius: '4px',
      border: `1px solid ${checked ? 'var(--accent-6)' : 'var(--border-strong)'}`,
      background: checked ? 'var(--accent-6)' : 'transparent',
      display: 'inline-flex',
      alignItems: 'center',
      justifyContent: 'center',
      transition: 'background var(--duration-fast) var(--ease-out),border-color var(--duration-fast) var(--ease-out)'
    }
  }, checked && React.createElement('span', {
    style: {
      color: 'var(--text-on-accent)',
      fontSize: 12,
      fontWeight: 700
    }
  }, '✓')), label);
}
Object.assign(__ds_scope, { Checkbox });
})(); } catch (e) { __ds_ns.__errors.push({ path: "components/forms/Checkbox.jsx", error: String((e && e.message) || e) }); }

// components/forms/IconButton.jsx
try { (() => {
function IconButton({
  icon,
  size = 36,
  label,
  active = false,
  onClick,
  variant = 'ghost'
}) {
  const variants = {
    ghost: {
      background: active ? 'var(--bg-card-raised)' : 'transparent',
      border: '1px solid transparent',
      color: active ? 'var(--accent-6)' : 'var(--text-secondary)'
    },
    outline: {
      background: 'var(--bg-card)',
      border: '1px solid var(--border-default)',
      color: 'var(--text-primary)'
    }
  };
  return React.createElement('button', {
    'aria-label': label,
    title: label,
    onClick,
    style: {
      width: size,
      height: size,
      borderRadius: 'var(--radius-sm)',
      display: 'inline-flex',
      alignItems: 'center',
      justifyContent: 'center',
      cursor: 'pointer',
      transition: 'background var(--duration-fast) var(--ease-out),color var(--duration-fast) var(--ease-out)',
      ...variants[variant]
    }
  }, React.createElement('span', {
    className: 'mono',
    style: {
      fontSize: size * 0.42,
      lineHeight: 1
    }
  }, icon));
}
Object.assign(__ds_scope, { IconButton });
})(); } catch (e) { __ds_ns.__errors.push({ path: "components/forms/IconButton.jsx", error: String((e && e.message) || e) }); }

// components/forms/Input.jsx
try { (() => {
function Input({
  label,
  placeholder,
  value,
  onChange,
  mono = false,
  error,
  size = 'md'
}) {
  return React.createElement('div', {
    style: {
      display: 'flex',
      flexDirection: 'column',
      gap: '6px'
    }
  }, label && React.createElement('label', {
    style: {
      fontSize: 'var(--text-caption)',
      color: 'var(--text-secondary)',
      fontWeight: 'var(--weight-medium)'
    }
  }, label), React.createElement('input', {
    value,
    placeholder,
    onChange,
    style: {
      background: 'var(--bg-card)',
      border: `1px solid ${error ? 'var(--danger)' : 'var(--border-default)'}`,
      borderRadius: 'var(--radius-sm)',
      color: 'var(--text-primary)',
      padding: size === 'sm' ? '6px 10px' : '10px 12px',
      fontSize: 'var(--text-body)',
      fontFamily: mono ? 'var(--font-mono)' : 'var(--font-sans)',
      outline: 'none',
      transition: 'border-color var(--duration-fast) var(--ease-out)'
    },
    onFocus: e => e.currentTarget.style.borderColor = 'var(--focus-ring)',
    onBlur: e => e.currentTarget.style.borderColor = error ? 'var(--danger)' : 'var(--border-default)'
  }), error && React.createElement('span', {
    style: {
      fontSize: 'var(--text-caption)',
      color: 'var(--danger)'
    }
  }, error));
}
Object.assign(__ds_scope, { Input });
})(); } catch (e) { __ds_ns.__errors.push({ path: "components/forms/Input.jsx", error: String((e && e.message) || e) }); }

// components/forms/Select.jsx
try { (() => {
function Select({
  label,
  value,
  onChange,
  options = []
}) {
  return React.createElement('div', {
    style: {
      display: 'flex',
      flexDirection: 'column',
      gap: '6px'
    }
  }, label && React.createElement('label', {
    style: {
      fontSize: 'var(--text-caption)',
      color: 'var(--text-secondary)',
      fontWeight: 'var(--weight-medium)'
    }
  }, label), React.createElement('select', {
    value,
    onChange,
    style: {
      background: 'var(--bg-card)',
      border: '1px solid var(--border-default)',
      borderRadius: 'var(--radius-sm)',
      color: 'var(--text-primary)',
      padding: '9px 12px',
      fontSize: 'var(--text-body)',
      fontFamily: 'var(--font-sans)',
      outline: 'none',
      appearance: 'none'
    }
  }, options.map(o => React.createElement('option', {
    key: o.value,
    value: o.value
  }, o.label))));
}
Object.assign(__ds_scope, { Select });
})(); } catch (e) { __ds_ns.__errors.push({ path: "components/forms/Select.jsx", error: String((e && e.message) || e) }); }

// components/forms/Switch.jsx
try { (() => {
function Switch({
  checked,
  onChange,
  label
}) {
  return React.createElement('label', {
    style: {
      display: 'inline-flex',
      alignItems: 'center',
      gap: '10px',
      cursor: 'pointer'
    }
  }, React.createElement('span', {
    onClick: () => onChange && onChange(!checked),
    style: {
      width: 36,
      height: 20,
      borderRadius: 'var(--radius-pill)',
      background: checked ? 'var(--accent-6)' : 'var(--gray-5)',
      position: 'relative',
      transition: 'background var(--duration-fast) var(--ease-out)',
      flexShrink: 0
    }
  }, React.createElement('span', {
    style: {
      position: 'absolute',
      top: 2,
      left: checked ? 18 : 2,
      width: 16,
      height: 16,
      borderRadius: '50%',
      background: 'var(--gray-0)',
      transition: 'left var(--duration-fast) var(--ease-out)'
    }
  })), label && React.createElement('span', {
    style: {
      fontSize: 'var(--text-body)',
      color: 'var(--text-primary)'
    }
  }, label));
}
Object.assign(__ds_scope, { Switch });
})(); } catch (e) { __ds_ns.__errors.push({ path: "components/forms/Switch.jsx", error: String((e && e.message) || e) }); }

// components/poker/ParticipantRow.jsx
try { (() => {
function ParticipantRow({
  name,
  role,
  voteState = 'waiting',
  voteValue,
  isYou = false
}) {
  const stateLabel = {
    waiting: 'Waiting',
    voted: 'Voted',
    revealed: voteValue
  };
  const stateColor = {
    waiting: 'var(--text-tertiary)',
    voted: 'var(--accent-6)',
    revealed: 'var(--text-primary)'
  };
  return React.createElement('div', {
    style: {
      display: 'flex',
      alignItems: 'center',
      gap: '12px',
      padding: '8px 4px'
    }
  }, React.createElement('span', {
    style: {
      width: 8,
      height: 8,
      borderRadius: '50%',
      background: voteState === 'waiting' ? 'var(--gray-5)' : 'var(--accent-6)',
      flexShrink: 0
    }
  }), React.createElement('span', {
    style: {
      flex: 1,
      fontSize: 'var(--text-body)',
      color: 'var(--text-primary)',
      fontWeight: isYou ? 'var(--weight-semibold)' : 'var(--weight-regular)'
    }
  }, name, isYou ? ' (you)' : '', role && React.createElement('span', {
    key: 'role',
    style: {
      color: 'var(--text-tertiary)',
      fontSize: 'var(--text-caption)',
      marginLeft: '8px'
    }
  }, role)), React.createElement('span', {
    style: {
      fontFamily: 'var(--font-mono)',
      fontSize: 'var(--text-body-sm)',
      color: stateColor[voteState],
      minWidth: 36,
      textAlign: 'right'
    }
  }, stateLabel[voteState]));
}
Object.assign(__ds_scope, { ParticipantRow });
})(); } catch (e) { __ds_ns.__errors.push({ path: "components/poker/ParticipantRow.jsx", error: String((e && e.message) || e) }); }

// components/poker/VoteCard.jsx
try { (() => {
function VoteCard({
  value,
  state = 'idle',
  size = 'md',
  onClick
}) {
  const sizes = {
    sm: {
      w: 44,
      h: 64,
      font: 'var(--text-mono-sm)'
    },
    md: {
      w: 64,
      h: 92,
      font: 'var(--text-mono-lg)'
    },
    lg: {
      w: 88,
      h: 128,
      font: 'var(--text-display)'
    }
  };
  const s = sizes[size];
  const styles = {
    idle: {
      background: 'var(--bg-card)',
      border: '1px solid var(--border-default)',
      color: 'var(--text-primary)',
      boxShadow: 'none'
    },
    selected: {
      background: 'var(--vote-selected-bg)',
      border: '1px solid var(--vote-selected-bg)',
      color: 'var(--vote-selected-text)',
      boxShadow: 'var(--glow-accent-strong)'
    },
    facedown: {
      background: 'var(--bg-card-raised)',
      border: '1px solid var(--border-strong)',
      color: 'transparent',
      boxShadow: 'none'
    },
    revealed: {
      background: 'var(--bg-card-raised)',
      border: '1px solid var(--border-default)',
      color: 'var(--text-primary)',
      boxShadow: 'none'
    }
  };
  return React.createElement('button', {
    onClick,
    style: {
      width: s.w,
      height: s.h,
      borderRadius: 'var(--radius-md)',
      display: 'flex',
      alignItems: 'center',
      justifyContent: 'center',
      fontFamily: 'var(--font-mono)',
      fontWeight: 700,
      fontSize: s.font,
      cursor: onClick ? 'pointer' : 'default',
      transition: 'transform var(--duration-fast) var(--ease-out),box-shadow var(--duration-base) var(--ease-out),background var(--duration-base) var(--ease-out)',
      ...styles[state]
    },
    onMouseDown: e => {
      if (onClick) e.currentTarget.style.transform = 'scale(0.96)';
    },
    onMouseUp: e => {
      e.currentTarget.style.transform = 'scale(1)';
    },
    onMouseLeave: e => {
      e.currentTarget.style.transform = 'scale(1)';
    }
  }, state === 'facedown' ? React.createElement('span', {
    style: {
      color: 'var(--text-tertiary)',
      fontSize: s.font
    }
  }, '?') : value);
}
Object.assign(__ds_scope, { VoteCard });
})(); } catch (e) { __ds_ns.__errors.push({ path: "components/poker/VoteCard.jsx", error: String((e && e.message) || e) }); }

// ui_kits/sprint-poker/HistoryPanel.jsx
try { (() => {
function HistoryPanel({
  rounds
}) {
  const {
    Card,
    Badge
  } = window.SprintPokerDesignSystem_1cc025;
  return React.createElement('div', {
    style: {
      flex: 1,
      padding: '32px 40px',
      display: 'flex',
      flexDirection: 'column',
      gap: 16
    }
  }, React.createElement('div', {
    style: {
      fontSize: 'var(--text-h2)',
      fontWeight: 600,
      color: 'var(--text-primary)'
    }
  }, 'Round history'), React.createElement('div', {
    style: {
      display: 'flex',
      flexDirection: 'column',
      gap: 10
    }
  }, rounds.map(r => React.createElement(Card, {
    key: r.title,
    style: {
      display: 'flex',
      justifyContent: 'space-between',
      alignItems: 'center'
    }
  }, React.createElement('div', null, React.createElement('div', {
    style: {
      color: 'var(--text-primary)',
      fontSize: 'var(--text-body)'
    }
  }, r.title), React.createElement('div', {
    style: {
      color: 'var(--text-tertiary)',
      fontSize: 'var(--text-caption)',
      marginTop: 2
    }
  }, r.votes.join(', '))), React.createElement('div', {
    style: {
      display: 'flex',
      alignItems: 'center',
      gap: 10
    }
  }, React.createElement('div', {
    style: {
      fontFamily: 'var(--font-mono)',
      fontWeight: 700,
      color: 'var(--accent-6)',
      fontSize: 'var(--text-mono)'
    }
  }, r.avg), React.createElement(Badge, {
    tone: 'neutral'
  }, 'AVG'))))));
}
window.HistoryPanel = HistoryPanel;
})(); } catch (e) { __ds_ns.__errors.push({ path: "ui_kits/sprint-poker/HistoryPanel.jsx", error: String((e && e.message) || e) }); }

// ui_kits/sprint-poker/LobbyScreen.jsx
try { (() => {
function LobbyScreen({
  name,
  setName,
  code,
  setCode,
  onJoin,
  onCreate
}) {
  const {
    Button,
    Input,
    Card
  } = window.SprintPokerDesignSystem_1cc025;
  return React.createElement('div', {
    style: {
      minHeight: '100vh',
      background: 'var(--bg-canvas)',
      display: 'flex',
      alignItems: 'center',
      justifyContent: 'center',
      fontFamily: 'var(--font-sans)'
    }
  }, React.createElement(Card, {
    style: {
      width: 380,
      padding: '32px'
    }
  }, React.createElement('div', {
    style: {
      fontFamily: 'var(--font-mono)',
      fontWeight: 700,
      fontSize: 22,
      color: 'var(--accent-6)',
      marginBottom: 4
    }
  }, 'Sprint', React.createElement('span', {
    style: {
      color: 'var(--text-primary)'
    }
  }, 'Poker')), React.createElement('div', {
    style: {
      color: 'var(--text-tertiary)',
      fontSize: 'var(--text-body-sm)',
      marginBottom: 24
    }
  }, 'Real-time estimation for your team.'), React.createElement('div', {
    style: {
      display: 'flex',
      flexDirection: 'column',
      gap: 14
    }
  }, React.createElement(Input, {
    label: 'Your name',
    placeholder: 'Jordan',
    value: name,
    onChange: e => setName(e.target.value)
  }), React.createElement(Input, {
    label: 'Session code',
    mono: true,
    placeholder: 'SP-4821',
    value: code,
    onChange: e => setCode(e.target.value)
  }), React.createElement(Button, {
    variant: 'primary',
    onClick: onJoin,
    disabled: !name || !code
  }, 'Join session'), React.createElement('div', {
    style: {
      textAlign: 'center',
      color: 'var(--text-tertiary)',
      fontSize: 'var(--text-caption)'
    }
  }, '— or —'), React.createElement(Button, {
    variant: 'secondary',
    onClick: onCreate,
    disabled: !name
  }, 'Create new session'))));
}
window.LobbyScreen = LobbyScreen;
})(); } catch (e) { __ds_ns.__errors.push({ path: "ui_kits/sprint-poker/LobbyScreen.jsx", error: String((e && e.message) || e) }); }

// ui_kits/sprint-poker/ParticipantsSidebar.jsx
try { (() => {
function ParticipantsSidebar({
  participants,
  you
}) {
  const {
    ParticipantRow,
    Avatar,
    Badge
  } = window.SprintPokerDesignSystem_1cc025;
  return React.createElement('div', {
    style: {
      width: 220,
      borderRight: '1px solid var(--border-subtle)',
      padding: '20px 16px',
      display: 'flex',
      flexDirection: 'column',
      gap: 16,
      background: 'var(--bg-surface)'
    }
  }, React.createElement('div', {
    style: {
      display: 'flex',
      justifyContent: 'space-between',
      alignItems: 'center'
    }
  }, React.createElement('div', {
    style: {
      fontSize: 'var(--text-caption)',
      color: 'var(--text-tertiary)',
      textTransform: 'uppercase',
      letterSpacing: 'var(--tracking-wide)'
    }
  }, 'Participants'), React.createElement(Badge, {
    tone: 'neutral'
  }, participants.length)), React.createElement('div', null, participants.map(p => React.createElement(ParticipantRow, {
    key: p.name,
    name: p.name,
    role: p.role,
    voteState: p.voteState,
    voteValue: p.voteValue,
    isYou: p.name === you
  }))));
}
window.ParticipantsSidebar = ParticipantsSidebar;
})(); } catch (e) { __ds_ns.__errors.push({ path: "ui_kits/sprint-poker/ParticipantsSidebar.jsx", error: String((e && e.message) || e) }); }

// ui_kits/sprint-poker/RevealPanel.jsx
try { (() => {
function RevealPanel({
  participants,
  onNextRound
}) {
  const {
    VoteCard,
    Button,
    Badge
  } = window.SprintPokerDesignSystem_1cc025;
  const nums = participants.map(p => Number(p.voteValue)).filter(n => !isNaN(n));
  const avg = nums.length ? (nums.reduce((a, b) => a + b, 0) / nums.length).toFixed(1) : '—';
  const spread = nums.length ? Math.max(...nums) - Math.min(...nums) : 0;
  return React.createElement('div', {
    style: {
      flex: 1,
      display: 'flex',
      flexDirection: 'column',
      padding: '32px 40px',
      gap: 28
    }
  }, React.createElement('div', {
    style: {
      display: 'flex',
      justifyContent: 'space-between',
      alignItems: 'center'
    }
  }, React.createElement('div', null, React.createElement('div', {
    style: {
      fontSize: 'var(--text-h2)',
      fontWeight: 600,
      color: 'var(--text-primary)'
    }
  }, 'Checkout flow refactor'), React.createElement('div', {
    style: {
      color: 'var(--text-tertiary)',
      fontSize: 'var(--text-body-sm)',
      marginTop: 4,
      display: 'flex',
      gap: 8,
      alignItems: 'center'
    }
  }, React.createElement(Badge, {
    tone: 'neutral'
  }, 'Round 3 — revealed'))), React.createElement(Button, {
    variant: 'primary',
    onClick: onNextRound
  }, 'Start next round')), React.createElement('div', {
    style: {
      display: 'flex',
      gap: 32
    }
  }, React.createElement('div', {
    style: {
      display: 'flex',
      flexDirection: 'column',
      gap: 2
    }
  }, React.createElement('div', {
    style: {
      fontFamily: 'var(--font-mono)',
      fontSize: 'var(--text-mono-lg)',
      fontWeight: 700,
      color: 'var(--accent-6)'
    }
  }, avg), React.createElement('div', {
    style: {
      fontSize: 'var(--text-caption)',
      color: 'var(--text-tertiary)',
      textTransform: 'uppercase',
      letterSpacing: 'var(--tracking-widest)'
    }
  }, 'average')), React.createElement('div', {
    style: {
      display: 'flex',
      flexDirection: 'column',
      gap: 2
    }
  }, React.createElement('div', {
    style: {
      fontFamily: 'var(--font-mono)',
      fontSize: 'var(--text-mono-lg)',
      fontWeight: 700,
      color: 'var(--text-primary)'
    }
  }, spread), React.createElement('div', {
    style: {
      fontSize: 'var(--text-caption)',
      color: 'var(--text-tertiary)',
      textTransform: 'uppercase',
      letterSpacing: 'var(--tracking-widest)'
    }
  }, 'spread'))), React.createElement('div', {
    style: {
      display: 'flex',
      gap: 20,
      flexWrap: 'wrap'
    }
  }, participants.map(p => React.createElement('div', {
    key: p.name,
    style: {
      display: 'flex',
      flexDirection: 'column',
      alignItems: 'center',
      gap: 8
    }
  }, React.createElement(VoteCard, {
    value: p.voteValue,
    state: 'revealed'
  }), React.createElement('div', {
    style: {
      fontSize: 'var(--text-caption)',
      color: 'var(--text-secondary)'
    }
  }, p.name)))));
}
window.RevealPanel = RevealPanel;
})(); } catch (e) { __ds_ns.__errors.push({ path: "ui_kits/sprint-poker/RevealPanel.jsx", error: String((e && e.message) || e) }); }

// ui_kits/sprint-poker/VotingPanel.jsx
try { (() => {
function VotingPanel({
  deck,
  selected,
  onSelect,
  participants,
  onReveal,
  allVoted
}) {
  const {
    VoteCard,
    Button,
    ProgressBar,
    Badge
  } = window.SprintPokerDesignSystem_1cc025;
  const votedCount = participants.filter(p => p.voteState !== 'waiting').length;
  return React.createElement('div', {
    style: {
      flex: 1,
      display: 'flex',
      flexDirection: 'column',
      padding: '32px 40px',
      gap: 28
    }
  }, React.createElement('div', {
    style: {
      display: 'flex',
      justifyContent: 'space-between',
      alignItems: 'center'
    }
  }, React.createElement('div', null, React.createElement('div', {
    style: {
      fontSize: 'var(--text-h2)',
      fontWeight: 600,
      color: 'var(--text-primary)'
    }
  }, 'Checkout flow refactor'), React.createElement('div', {
    style: {
      color: 'var(--text-tertiary)',
      fontSize: 'var(--text-body-sm)',
      marginTop: 4,
      display: 'flex',
      gap: 8,
      alignItems: 'center'
    }
  }, React.createElement(Badge, {
    tone: 'success'
  }, 'LIVE'), 'Round 3')), React.createElement(Button, {
    variant: 'primary',
    onClick: onReveal,
    disabled: !allVoted
  }, 'Reveal votes')), React.createElement(ProgressBar, {
    value: votedCount,
    total: participants.length,
    label: 'Votes in'
  }), React.createElement('div', null, React.createElement('div', {
    style: {
      color: 'var(--text-secondary)',
      fontSize: 'var(--text-body-sm)',
      marginBottom: 12
    }
  }, 'Pick your estimate'), React.createElement('div', {
    style: {
      display: 'flex',
      gap: 14,
      flexWrap: 'wrap'
    }
  }, deck.map(v => React.createElement(VoteCard, {
    key: v,
    value: v,
    state: selected === v ? 'selected' : 'idle',
    onClick: () => onSelect(v)
  })))));
}
window.VotingPanel = VotingPanel;
})(); } catch (e) { __ds_ns.__errors.push({ path: "ui_kits/sprint-poker/VotingPanel.jsx", error: String((e && e.message) || e) }); }

__ds_ns.Avatar = __ds_scope.Avatar;

__ds_ns.Card = __ds_scope.Card;

__ds_ns.ProgressBar = __ds_scope.ProgressBar;

__ds_ns.Badge = __ds_scope.Badge;

__ds_ns.Dialog = __ds_scope.Dialog;

__ds_ns.Tag = __ds_scope.Tag;

__ds_ns.Toast = __ds_scope.Toast;

__ds_ns.Tooltip = __ds_scope.Tooltip;

__ds_ns.Button = __ds_scope.Button;

__ds_ns.Checkbox = __ds_scope.Checkbox;

__ds_ns.IconButton = __ds_scope.IconButton;

__ds_ns.Input = __ds_scope.Input;

__ds_ns.Select = __ds_scope.Select;

__ds_ns.Switch = __ds_scope.Switch;

__ds_ns.ParticipantRow = __ds_scope.ParticipantRow;

__ds_ns.VoteCard = __ds_scope.VoteCard;

})();
