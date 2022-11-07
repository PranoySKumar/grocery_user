import 'package:flutter/material.dart';

import 'package:grocery_user/Screens/common/icon_text_field.dart';
import 'package:grocery_user/Screens/common/header_widget.dart';

class EnterUserNameScreen extends StatelessWidget {
  const EnterUserNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Header(
              title: "What do we call you?",
              subtitle: "Fresh food is waiting to be delivered",
            ),
            SizedBox(
              height: 24,
            ),
            _FormView(),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}

class _FormView extends StatefulWidget {
  const _FormView({super.key});

  @override
  State<_FormView> createState() => _FormViewState();
}

class _FormViewState extends State<_FormView> {
  @override
  Widget build(BuildContext context) {
    var editTextController = TextEditingController();

    return IconTextField(
        prefixIcon: const Icon(
          Icons.circle_outlined,
          color: Colors.black,
        ),
        keyboardType: TextInputType.name,
        controller: editTextController,
        onChanged: (val) {},
        hint: "Name",
        onSubmitted: (val) {});
  }
}
