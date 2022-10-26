import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_user/Screens/login/login_intro_section/login_intro_section.dart';
import 'package:grocery_user/Utils/asset_repo.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
