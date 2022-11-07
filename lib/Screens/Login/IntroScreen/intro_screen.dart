import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:grocery_user/Utils/asset_repo.dart';

import '../../../Utils/route_helper.dart';
import '../../common/full_length_button_widget.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AssetRepo.coverImage),
              fit: BoxFit.fitHeight,
              alignment: Alignment.center),
        ),
        child: Container(
          margin: const EdgeInsets.all(16),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                height: 20,
              ),
              SvgPicture.asset(
                AssetRepo.logoSvg,
                alignment: Alignment.center,
              ),
              const LoginIntroSection()
            ],
          ),
        ),
      ),
    );
  }
}

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
        FullLengthButton(
          text: "Continue with Phone Number",
          backgroundColor: Theme.of(context).primaryColor,
          textColor: Colors.white,
          onPressed: () => Get.toNamed(RouteHelper.enterPhoneNumberScreen),
        ),
        const SizedBox(
          height: 16.0,
        ),
        FullLengthButton(
          text: "Continue as Guest",
          backgroundColor: Colors.white,
          textColor: Colors.black,
          onPressed: () {},
        )
      ],
    );
  }
}
