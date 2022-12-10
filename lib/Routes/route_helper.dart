import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:grocery_user/Screens/Categories/category_screen.dart';
import 'package:grocery_user/Screens/Categories/category_screen_binding.dart';
import 'package:grocery_user/Screens/Dashboard/dashboard_binding.dart';
import 'package:grocery_user/Screens/Dashboard/dashboard_screen.dart';
import 'package:grocery_user/Screens/Login/EnterLocationScreen/enter_location_binding.dart';
import 'package:grocery_user/Screens/Login/EnterUserNameScreen/enter_username_binding.dart';
import 'package:grocery_user/Screens/Login/WelcomeScreen/welcome_binding.dart';
import 'package:grocery_user/Screens/Login/WelcomeScreen/welcome_screen.dart';
import 'package:grocery_user/Screens/Products/products_binding.dart';
import 'package:grocery_user/Screens/Products/products_screen.dart';

import '../Screens/Login/EnterLocationScreen/enter_location_screen.dart';
import '../Screens/Login/EnterPhoneNumberScreen/verify_number_binding.dart';
import '../Screens/Login/EnterPhoneNumberScreen/verify_number_screen.dart';
import '../Screens/Login/EnterUserNameScreen/enter_username_screen.dart';
import '../Screens/Login/IntroScreen/intro_screen.dart';
import '../Screens/Login/OtpVerificationScreen/verify_otp_binding.dart';
import '../Screens/Login/OtpVerificationScreen/verify_otp_screen.dart';
import '../Screens/ShippingDetails/ShippingDetailsScreen/shipping_details_binding.dart';
import '../Screens/ShippingDetails/ShippingDetailsScreen/shipping_details_screen.dart';

class RouteHelper {
  static const introScreen = "/intro";
  static const enterPhoneNumberScreen = "/login";
  static const verifyOtpScreen = "/login/verify-otp";
  static const userNameFormScreen = "/user/username";
  static const locationScreen = "/user/location";
  static const welcomeScreen = "/welcome";
  static const dashboardScreen = "/dashboard";
  static const categoriesScreen = "/categories";
  static const productsScreen = "/products";
  static const shippingDetailsScreen = "/shipping-details";

  static getAppRoutes() => [
        GetPage(
          name: introScreen,
          page: () => const IntroScreen(),
          transition: Transition.rightToLeftWithFade,
        ),
        GetPage(
            name: enterPhoneNumberScreen,
            page: () => const VerifyNumberScreen(),
            transition: Transition.rightToLeftWithFade,
            binding: VerifyNumberBinding()),
        GetPage(
            name: verifyOtpScreen,
            page: () => const OtpVerificationScreen(),
            transition: Transition.rightToLeftWithFade,
            binding: VerifyOtpBinding()),
        GetPage(
            name: userNameFormScreen,
            page: () => const EnterUserNameScreen(),
            transition: Transition.rightToLeftWithFade,
            binding: EnterUserNameBinding()),
        GetPage(
            name: locationScreen,
            page: () => const EnterLocationScreen(),
            transition: Transition.rightToLeftWithFade,
            binding: EnterLocationBinding()),
        GetPage(
          name: welcomeScreen,
          page: () => WelcomeScreen(),
          transition: Transition.rightToLeftWithFade,
          binding: WelcomeBinding(),
        ),
        GetPage(
          name: dashboardScreen,
          page: () => DashboardScreen(),
          binding: DashboardBinding(),
          transition: Transition.rightToLeftWithFade,
        ),
        GetPage(
          name: categoriesScreen,
          page: () => const CategoriesScreen(),
          binding: CategoryBinding(),
          transition: Transition.rightToLeftWithFade,
        ),
        GetPage(
          name: productsScreen,
          page: () => const ProductsScreen(),
          binding: ProductsBinding(),
          transition: Transition.rightToLeftWithFade,
        ),
        GetPage(
          name: shippingDetailsScreen,
          page: () => const ShippingDetailsScreen(),
          binding: ShippingDetailsBinding(),
          transition: Transition.rightToLeftWithFade,
        ),
      ];
}
