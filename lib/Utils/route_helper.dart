import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:grocery_user/Screens/login/location_screen.dart';

import 'package:grocery_user/Screens/login/login_form_screen.dart';
import 'package:grocery_user/Screens/login/otp_verification_screen.dart';
import 'package:grocery_user/Screens/login/intro_screen.dart';
import 'package:grocery_user/Screens/login/username_form_screen.dart';

class RouteHelper {
  static const homeScreen = "/";
  static const introScreen = "/intro";
  static const enterPhoneNumberScreen = "/login";
  static const verifyOtpScreen = "/login/verify-otp";
  static const userNameFormScreen = "/user/username";
  static const locationScreen = "/user/location";

  static getAppRoutes() => [
        GetPage(
          name: introScreen,
          page: () => const IntroScreen(),
          transition: Transition.rightToLeftWithFade,
        ),
        GetPage(
          name: enterPhoneNumberScreen,
          page: () => const LoginFormScreen(),
          transition: Transition.rightToLeftWithFade,
        ),
        GetPage(
          name: verifyOtpScreen,
          page: () => const OtpVerificationScreen(),
          transition: Transition.rightToLeftWithFade,
        ),
        GetPage(
          name: userNameFormScreen,
          page: () => const UserNameFormScreen(),
          transition: Transition.rightToLeftWithFade,
        ),
        GetPage(
          name: locationScreen,
          page: () => const LocationScreen(),
          transition: Transition.rightToLeftWithFade,
        ),
      ];
}
