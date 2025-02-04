import 'package:flutter/material.dart';
import 'package:Kios/views/widgets/colors/basicflutter_colors.dart';

class BadgeIcon extends StatelessWidget {
  final String count;
  final IconData? icon;
  final bool showBorder;
  final double? iconSize;
  final Color? iconColor;
  final Color? badgeColor;
  final Color? textColor;
  final double spacing;

  const BadgeIcon({
    Key? key,
    required this.count,
    this.icon,
    this.showBorder = true,
    this.iconSize = 50,
    this.iconColor = Kios_colorsColors.black,
    this.badgeColor = Colors.yellow,
    this.textColor = Kios_colorsColors.black,
    this.spacing = 4,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        if (icon != null)
          Icon(
            icon,
            size: iconSize,
            color: iconColor,
          ),
        if (count.isNotEmpty)
          Positioned(
            right: -10,
            top: -8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: badgeColor,
                borderRadius: showBorder ? BorderRadius.circular(50) : null,
              ),
              constraints: const BoxConstraints(
                minWidth: 25,
                minHeight: 25,
              ),
              child: Center(
                child: Text(
                  count,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
