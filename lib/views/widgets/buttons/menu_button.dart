import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final double width;
  final double height;
  final Widget? icon;
  final Color? fontColor;

  const MenuButton(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.backgroundColor,
      this.width = 400,
      this.height = 150,
      this.icon,
      this.fontColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    if (icon != null) {
      return Container(
        width: width,
        height: height,
        child: ElevatedButton.icon(
          onPressed: onPressed,
          icon: icon!,
          label: Text(text,
              style: TextStyle(
                  color: fontColor, fontSize: 48, fontWeight: FontWeight.w400)),
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35),
            ),
            elevation: 5,
          ),
        ),
      );
    }

    return Container(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35),
          ),
          elevation: 5,
        ),
        child: Text(text,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 48,
                fontWeight: FontWeight.w400)),
      ),
    );
  }
}
