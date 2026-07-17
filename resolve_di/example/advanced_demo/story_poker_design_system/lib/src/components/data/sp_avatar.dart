import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

import '../../tokens/sp_colors.dart';
import '../../tokens/sp_typography.dart';

@Preview(name: 'SpAvatar')
Widget spAvatarPreview() => SpAvatar(name: 'Name');

const List<Color> _avatarColors = [
  SpColors.accent6,
  SpColors.blue6,
  SpColors.amber6,
  SpColors.red6,
  SpColors.accent7,
  SpColors.gray7,
];

int _hash(String s) {
  var h = 0;
  for (final code in s.codeUnits) {
    h = (h * 31 + code) & 0x7FFFFFFF;
  }
  return h;
}

/// Initials avatar with a name-derived ring color and optional
/// online indicator (accent dot).
class SpAvatar extends StatelessWidget {
  const SpAvatar({
    super.key,
    required this.name,
    this.size = 32,
    this.online = false,
  });

  final String name;
  final double size;
  final bool online;

  String get _initials {
    final parts = name.trim().split(RegExp(r'\s+')).where((p) => p.isNotEmpty);
    return parts.take(2).map((p) => p[0]).join().toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final color = _avatarColors[_hash(name) % _avatarColors.length];

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: SpColors.gray3,
            shape: BoxShape.circle,
            border: Border.all(color: color, width: 1.5),
          ),
          alignment: Alignment.center,
          child: Text(
            _initials,
            style: TextStyle(
              fontFamily: SpFonts.mono,
              fontWeight: FontWeight.w600,
              fontSize: size * 0.36,
              height: 1,
              color: color,
            ),
          ),
        ),
        if (online)
          Positioned(
            bottom: -1,
            right: -1,
            child: Container(
              width: size * 0.3,
              height: size * 0.3,
              decoration: BoxDecoration(
                color: SpColors.accent,
                shape: BoxShape.circle,
                border: Border.all(color: SpColors.bgCanvas, width: 2),
              ),
            ),
          ),
      ],
    );
  }
}
