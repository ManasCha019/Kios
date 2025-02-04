import 'package:flutter/material.dart';

class MenuButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final double width;
  final double height;
  final Widget? icon;
  final Color? fontColor;
  final bool useGradient;
  final double fontSize;
  final double elevation;
  final WidgetStateProperty<OutlinedBorder>? customStyle;

  const MenuButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.backgroundColor,
    this.width = 400,
    this.height = 150,
    this.icon,
    this.fontColor = Colors.white,
    this.useGradient = false,
    this.fontSize = 48,
    this.customStyle,
    this.elevation = 5,
  });

  @override
  _MenuButtonState createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
    widget.onPressed();
  }

  void _onTapCancel() {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final BorderRadius buttonRadius = widget.customStyle != null
        ? BorderRadius.only(bottomRight: Radius.circular(8))
        : BorderRadius.circular(35);

    final textStyle = TextStyle(
        color: widget.fontColor,
        fontSize: widget.fontSize,
        fontWeight: FontWeight.w400);

    Widget buttonChild = Text(widget.text, style: textStyle);

    if (widget.icon != null) {
      buttonChild = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          widget.icon!,
          const SizedBox(width: 10),
          buttonChild,
        ],
      );
    }

    Widget button = GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: widget.useGradient
            ? Container(
                width: widget.width,
                height: widget.height,
                decoration: BoxDecoration(
                  borderRadius: buttonRadius,
                  gradient: LinearGradient(
                    colors: [widget.backgroundColor, Colors.black],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    stops: const [0.6, 1.0],
                  ),
                ),
                child: Material(
                  color: Colors.transparent,
                  borderRadius: buttonRadius,
                  child: Center(child: buttonChild),
                ),
              )
            : Container(
                width: widget.width,
                height: widget.height,
                child: Material(
                  color: widget.backgroundColor,
                  borderRadius: buttonRadius,
                  elevation: widget.elevation,
                  child: Center(child: buttonChild),
                ),
              ),
      ),
    );

    return button;
  }
}
