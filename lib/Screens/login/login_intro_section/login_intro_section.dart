import 'package:flutter/material.dart';

import '../login_button/login_button.dart';

class LoginIntroSection extends StatelessWidget {
  const LoginIntroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Welcome to FoodDelivery App",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          "Enjoy delivery from a variety of sellers from Vizhinjam",
          style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.white),
        ),
        const SizedBox(
          height: 16.0,
        ),
        LoginButton(
            text: "Continue with Phone Number",
            backgroundColor: Theme.of(context).primaryColor,
            textColor: Colors.white,
            onPressed: () {}),
        const SizedBox(
          height: 16.0,
        ),
        LoginButton(
            text: "Continue as Guest",
            backgroundColor: Colors.white,
            textColor: Colors.black,
            onPressed: () {})
      ],
    );
  }
}
