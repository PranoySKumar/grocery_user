import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String?)? onChanged;
  final Function(String?) onSubmitted;
  final String hint;
  final bool? autoFocus;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final double? borderSize;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? textStyle;
  final TextStyle? hintTextStyle;
  final TextAlign? textAlign;
  final FocusNode? focusNode;
  final int? min;
  final int? max;

  const CustomTextField(
      {super.key,
      required this.controller,
      this.onChanged,
      required this.hint,
      required this.onSubmitted,
      this.suffixIcon,
      this.autoFocus,
      this.prefixIcon,
      this.keyboardType,
      this.textStyle,
      this.borderSize,
      this.contentPadding,
      this.textAlign,
      this.hintTextStyle,
      this.focusNode,
      this.min,
      this.max});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return TextField(
      minLines: min,
      maxLines: max,
      focusNode: focusNode,
      onSubmitted: onSubmitted,
      controller: controller,
      autofocus: autoFocus ?? false,
      onChanged: onChanged,
      cursorColor: Colors.black,
      keyboardType: keyboardType,
      textAlign: textAlign ?? TextAlign.start,
      style: textStyle ?? Theme.of(context).textTheme.labelMedium,
      decoration: InputDecoration(
        contentPadding: contentPadding,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(4),
          ),
          borderSide: BorderSide(
              width: borderSize ?? 1, color: const Color(0xffDDDDDD), style: BorderStyle.solid),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(4),
          ),
          borderSide:
              BorderSide(width: borderSize ?? 1, color: Colors.black, style: BorderStyle.solid),
        ),
        counterText: "",
        hintText: hint,
        hintStyle: hintTextStyle ?? theme.textTheme.labelMedium,
      ),
    );
  }
}
