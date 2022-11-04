import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_user/Screens/login/widgets/borderless_textfield_widget.dart';
import 'package:grocery_user/Screens/login/widgets/header_widget.dart';

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
          children: const [
            Header(
                title: "Enter your mobile number",
                subtitle: "We will send you a confirmation code"),
            SizedBox(
              height: 24,
            ),
            _FormView(),
          ],
        ),
      ),
    );
  }
}

//Form for entering mobile number.
class _FormView extends StatefulWidget {
  const _FormView({super.key});

  @override
  State<_FormView> createState() => _FormViewState();
}

class _FormViewState extends State<_FormView> {
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
