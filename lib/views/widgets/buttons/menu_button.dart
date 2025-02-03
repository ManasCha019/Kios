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
    final buttonStyle = ElevatedButton.styleFrom(
      backgroundColor:
          widget.useGradient ? Colors.transparent : widget.backgroundColor,
      shadowColor: Colors.black,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(35),
      ),
    );

    final textStyle = TextStyle(
        color: widget.fontColor, fontSize: 48, fontWeight: FontWeight.w400);

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
                  borderRadius: BorderRadius.circular(35),
                  gradient: LinearGradient(
                    colors: [widget.backgroundColor, Colors.black],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    stops: [0.6, 1.0],
                  ),
                ),
                child: ElevatedButton(
                  onPressed: null,
                  style: buttonStyle,
                  child: buttonChild,
                ),
              )
            : Container(
                width: widget.width,
                height: widget.height,
                child: ElevatedButton(
                  onPressed: null,
                  style: buttonStyle,
                  child: buttonChild,
                ),
              ),
      ),
    );

    return button;
  }
}
