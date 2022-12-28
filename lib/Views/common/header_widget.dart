import 'package:flutter/material.dart';
import 'package:grocery_user/Views/common/round_back_button.dart';

class Header extends StatelessWidget {
  final String title;
  final String subtitle;
  final TextStyle? subtitleStyle;

  const Header({super.key, required this.title, required this.subtitle, this.subtitleStyle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 30,
        ),
        const RoundBackButton(),
        const SizedBox(height: 48),
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(color:Colors.black ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          subtitle,
          style: subtitleStyle ??
              Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(color: Color(0xff7C7C7C) , fontWeight: FontWeight.normal),
        ),
      ],
    );
  }
}
