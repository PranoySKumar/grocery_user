import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_user/Screens/login/widgets/full_length_button_widget.dart';

import 'package:grocery_user/Screens/login/widgets/round_button_widget.dart';

import 'widgets/borderless_textfield_widget.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            RoundButton(
              icon: Icons.arrow_back,
              onPressed: () => Get.back(),
            ),
            const SizedBox(height: 48),
            Text(
              "Enter OTP sent to your number",
              style: _theme.textTheme.titleLarge,
            ),
            const SizedBox(height: 48),
            const SizedBox(
              height: 8,
            ),
            Text(
              "Waiting to auto detect confirmation code",
              style:
                  Theme.of(context).textTheme.labelLarge?.copyWith(color: _theme.primaryColorLight),
            ),
            Text(
              "...",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(height: 0.5, color: _theme.primaryColorLight),
            ),
            const SizedBox(
              height: 3,
            ),
            Container(alignment: Alignment.center, child: const OtpTextFieldForm()),
            const ResendOptView(),
            const SizedBox(
              height: 16,
            ),
            FullLengthButton(
                text: "Next",
                backgroundColor: _theme.primaryColor,
                textColor: Colors.white,
                onPressed: () {})
          ],
        ),
      ),
    );
  }
}

class OtpTextFieldForm extends StatefulWidget {
  const OtpTextFieldForm({super.key});

  @override
  State<OtpTextFieldForm> createState() => _OtpTextFieldFormState();
}

class _OtpTextFieldFormState extends State<OtpTextFieldForm> {
  final _otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 145,
        child: BorderlessTextField(
            autoFocus: true, hint: "0-0-0-0", controller: _otpController, onChanged: (value) {}));
  }
}

class ResendOptView extends StatelessWidget {
  const ResendOptView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Did not recieve OTP?",
          style: theme.textTheme.labelSmall,
        ),
        const SizedBox(
          width: 2,
        ),
        Text(
          "Resend",
          style: theme.textTheme.labelSmall?.copyWith(color: theme.highlightColor),
        )
      ],
    );
  }
}
