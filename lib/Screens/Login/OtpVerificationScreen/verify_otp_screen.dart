import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_user/Screens/Login/OtpVerificationScreen/verify_otp_controller.dart';
import 'package:grocery_user/Screens/common/full_length_button_widget.dart';
import 'package:grocery_user/Screens/common/header_widget.dart';

import '../../common/borderless_textfield_widget.dart';

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
            Container(alignment: Alignment.center, child: _OtpTextFieldForm()),
          ],
        ),
      ),
    );
  }
}

class _OtpTextFieldForm extends StatelessWidget {
  final _controller = Get.find<VerifyOtpController>();

  _OtpTextFieldForm({super.key});
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      children: [
        SizedBox(
          width: 145,
          child: BorderlessTextField(
              autoFocus: true,
              hint: "0-0-0-0",
              controller: _controller.textEditingController,
              onChanged: (value) {},
              onSubmit: _controller.onSubmitHandler),
        ),
        const _ResendOptView(),
        const SizedBox(
          height: 16,
        ),
        FullLengthButton(
          text: "Verify",
          backgroundColor: theme.primaryColor,
          textColor: Colors.white,
          onPressed: () => _controller.onSubmitHandler(_controller.textEditingController.text),
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
