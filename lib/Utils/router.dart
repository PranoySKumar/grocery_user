import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import 'package:grocery_user/Screens/login/login_form_screen.dart';
import 'package:grocery_user/Screens/login/otp_verification_screen.dart';
import 'package:grocery_user/Screens/login/welcome_screen.dart';

class RouteHelper {
  static const homeScreen = "/";
  static const welcomeScreen = "/welcome";
  static const enterPhoneNumberScreen = "/login";
  static const verifyOtpScreen = "/login/verify-otp";

  static getAppRoutes() => [
        GetPage(
          name: welcomeScreen,
          page: () => const WelcomeScreen(),
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
      ];
}
