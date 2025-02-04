import 'package:Kios/views/widgets/buttons/menu_button.dart';
import 'package:Kios/views/widgets/colors/basicflutter_colors.dart';
import 'package:flutter/material.dart';

class SideMenuButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;
  final bool isSelected;
  final BorderRadius? borderRadius;

  const SideMenuButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
    this.isSelected = false,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return MenuButton(
      text: text,
      onPressed: onPressed,
      backgroundColor: isSelected ? Kios_colorsColors.red : Colors.white,
      width: double.infinity,
      height: 55,
      elevation: 0,
      fontSize: 16,
      fontColor: isSelected ? Colors.white : Colors.black,
      icon: Icon(
        icon,
        color: isSelected ? Colors.white : Colors.black,
        size: 24,
      ),
      customStyle: borderRadius != null
          ? WidgetStateProperty.all(
              RoundedRectangleBorder(borderRadius: borderRadius!))
          : null,
    );
  }
}
