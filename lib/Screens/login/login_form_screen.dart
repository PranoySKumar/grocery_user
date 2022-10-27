import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_user/Screens/login/widgets/borderless_textfield_widget.dart';
import 'package:grocery_user/Screens/login/widgets/round_button_widget.dart';

import '../../Utils/router.dart';
import 'widgets/full_length_button_widget.dart';

class LoginFormScreen extends StatelessWidget {
  const LoginFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              "Enter your mobile number",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "We will send you a confirmation code",
              style: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(color: Theme.of(context).primaryColorLight),
            ),
            const SizedBox(
              height: 24,
            ),
            const EnterMobileNumberFormView(),
          ],
        ),
      ),
    );
  }
}

class EnterMobileNumberFormView extends StatefulWidget {
  const EnterMobileNumberFormView({super.key});

  @override
  State<EnterMobileNumberFormView> createState() => _EnterMobileNumberFormViewState();
}

class _EnterMobileNumberFormViewState extends State<EnterMobileNumberFormView> {
  final _phoneNumberTextController = TextEditingController();
  @override
  void dispose() {
    _phoneNumberTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "+91",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Expanded(
                child: Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: BorderlessTextField(
                        hint: "00000-00000",
                        autoFocus: true,
                        controller: _phoneNumberTextController,
                        onChanged: (value) {
                          if (value!.length > 5 && !value.contains("-")) {
                            setState(() {
                              var dashedValue =
                                  "${value.substring(0, 5)}-${value.substring(5, value.length)}";
                              _phoneNumberTextController.text = dashedValue;
                              _phoneNumberTextController.selection = TextSelection.fromPosition(
                                TextPosition(offset: _phoneNumberTextController.text.length),
                              );
                            });
                          }
                        })),
              )
            ],
          ),
          const SizedBox(
            height: 42,
          ),
          FullLengthButton(
              text: "Next",
              backgroundColor: Theme.of(context).primaryColor,
              textColor: Colors.white,
              onPressed: () {
                Get.toNamed(RouteHelper.verifyOtpScreen);
              })
        ],
      ),
    );
  }
}
