import 'package:flutter/material.dart';

class FullLengthButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onPressed;
  const FullLengthButton(
      {super.key,
      required this.text,
      required this.backgroundColor,
      required this.textColor,
      required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          minimumSize: const Size(double.infinity, 20),
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 60),
        ),
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .labelMedium
              ?.copyWith(color: textColor, letterSpacing: 0, fontSize: 14),
        ));
  }
}
