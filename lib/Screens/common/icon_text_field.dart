import 'package:flutter/material.dart';

class IconTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String?)? onChanged;
  final Function(String?) onSubmitted;
  final String hint;
  final bool? autoFocus;
  final Icon? prefixIcon;
  final TextInputType? keyboardType;

  const IconTextField({
    super.key,
    required this.controller,
    this.onChanged,
    required this.hint,
    required this.onSubmitted,
    this.autoFocus,
    this.prefixIcon,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return TextField(
      onSubmitted: onSubmitted,
      controller: controller,
      autofocus: autoFocus ?? false,
      onChanged: onChanged,
      cursorColor: Colors.black,
      keyboardType: keyboardType,
      style: Theme.of(context).textTheme.labelMedium,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
          borderSide: BorderSide(width: 1, color: Color(0xffDDDDDD), style: BorderStyle.solid),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
          borderSide: BorderSide(width: 1, color: Color(0xffDDDDDD), style: BorderStyle.solid),
        ),
        counterText: "",
        hintText: hint,
        hintStyle: theme.textTheme.labelMedium,
      ),
    );
  }
}
