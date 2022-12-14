import 'package:flutter/material.dart';

class BorderlessTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String?) onChanged;
  final String hint;
  final bool? autoFocus;
  final Function(String?)? onSubmit;

  const BorderlessTextField(
      {super.key,
      required this.controller,
      required this.onChanged,
      required this.hint,
      this.autoFocus,
      this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLength: 11,
      autofocus: autoFocus ?? false,
      onChanged: onChanged,
      onSubmitted: onSubmit,
      cursorColor: Colors.black,
      keyboardType: TextInputType.number,
      style: Theme.of(context).textTheme.titleLarge,
      decoration: InputDecoration(
        border: InputBorder.none,
        counterText: "",
        hintText: hint,
        hintStyle: Theme.of(context)
            .textTheme
            .titleLarge
            ?.copyWith(color: Theme.of(context).primaryColorLight),
      ),
    );
  }
}
