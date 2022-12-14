import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final IconData icon;
  final Color? backgroundColor;
  final Color? iconColor;
  final VoidCallback onPressed;
  const RoundButton(
      {super.key,
      required this.icon,
      required this.onPressed,
      this.backgroundColor,
      this.iconColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: const Size(0, 0),
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(10),
        backgroundColor: backgroundColor ?? Colors.white,
      ),
      child: Icon(
        icon,
        color: iconColor ?? Colors.black,
      ),
    );
  }
}
