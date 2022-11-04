import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_user/Screens/login/widgets/full_length_button_widget.dart';
import 'package:grocery_user/Screens/login/widgets/header_widget.dart';

import 'package:grocery_user/Screens/login/widgets/round_button_widget.dart';
import 'package:grocery_user/Utils/route_helper.dart';

import 'widgets/borderless_textfield_widget.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header(
                title: "Enter OTP sent to your number",
                subtitle: "Waiting to auto detect confirmation code"),
            Text(
              "...",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(height: 0.5, color: theme.primaryColorLight),
            ),
            const SizedBox(
              height: 3,
            ),
            Container(alignment: Alignment.center, child: const _OtpTextFieldForm()),
          ],
        ),
      ),
    );
  }
}

class _OtpTextFieldForm extends StatefulWidget {
  const _OtpTextFieldForm({super.key});

  @override
  State<_OtpTextFieldForm> createState() => _OtpTextFieldFormState();
}

class _OtpTextFieldFormState extends State<_OtpTextFieldForm> {
  final _otpController = TextEditingController();

  //form submit handler
  _onSubmitHandler(String? val) {
    Get.toNamed(RouteHelper.locationScreen);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        SizedBox(
          width: 145,
          child: BorderlessTextField(
              autoFocus: true,
              hint: "0-0-0-0",
              controller: _otpController,
              onChanged: (value) {},
              onSubmit: _onSubmitHandler),
        ),
        const _ResendOptView(),
        const SizedBox(
          height: 16,
        ),
        FullLengthButton(
          text: "Next",
          backgroundColor: theme.primaryColor,
          textColor: Colors.white,
          onPressed: () => _onSubmitHandler(_otpController.text),
        )
      ],
    );
  }
}

class _ResendOptView extends StatelessWidget {
  const _ResendOptView({super.key});

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
