import 'package:get/get.dart';
import 'package:grocery_user/Views/Cart/cart_controller.dart';
import 'package:grocery_user/Views/Cart/cart_screen.dart';
import 'package:grocery_user/Views/Cart/checkout_screen.dart';
import 'package:grocery_user/Views/Cart/order_status_screen.dart';
import 'package:grocery_user/Views/Categories/category_screen.dart';
import 'package:grocery_user/Views/Categories/category_screen_binding.dart';
import 'package:grocery_user/Views/Dashboard/dashboard_binding.dart';
import 'package:grocery_user/Views/Dashboard/dashboard_screen.dart';
import 'package:grocery_user/Views/Login/EnterLocationScreen/enter_location_binding.dart';
import 'package:grocery_user/Views/Login/EnterUserNameScreen/enter_username_binding.dart';
import 'package:grocery_user/Views/Login/WelcomeScreen/welcome_binding.dart';
import 'package:grocery_user/Views/Login/WelcomeScreen/welcome_screen.dart';
import 'package:grocery_user/Views/Orders/orders_controller.dart';
import 'package:grocery_user/Views/Orders/orders_list_screen.dart';
import 'package:grocery_user/Views/Products/ProductDetailsScreen/product_details_controller.dart';
import 'package:grocery_user/Views/Products/ProductDetailsScreen/product_details_screen.dart';
import 'package:grocery_user/Views/Profile/profile_screen.dart';
import 'package:grocery_user/Views/ShippingDetails/EditShippingDetailsScreen/edit_shipping_details_controller.dart';
import 'package:grocery_user/Views/ShippingDetails/EditShippingDetailsScreen/edit_shipping_details_screen.dart';

import '../Views/Login/EnterLocationScreen/enter_location_screen.dart';
import '../Views/Login/EnterPhoneNumberScreen/verify_number_binding.dart';
import '../Views/Login/EnterPhoneNumberScreen/verify_number_screen.dart';
import '../Views/Login/EnterUserNameScreen/enter_username_screen.dart';
import '../Views/Login/IntroScreen/intro_screen.dart';
import '../Views/Login/OtpVerificationScreen/verify_otp_binding.dart';
import '../Views/Login/OtpVerificationScreen/verify_otp_screen.dart';
import '../Views/Products/ProductListScreen/products_binding.dart';
import '../Views/Products/ProductListScreen/products_screen.dart';
import '../Views/ShippingDetails/ShippingDetailsScreen/shipping_details_binding.dart';
import '../Views/ShippingDetails/ShippingDetailsScreen/shipping_details_screen.dart';

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
  static const productDetailsScreen = "/product-details";
  static const shippingDetailsScreen = "/shipping-details";
  static const editShippingAddressScreen = "/edit-address-details";
  static const cartScreen = "/cart";
  static const checkoutScreen = "/check-out";
  static const orderStatusScreen = "/order-status";
  static const orderListScreen = "/order-list";
  static const profileScreen = "/profile";

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
          name: productDetailsScreen,
          page: () => ProductDetailsScreen(),
          binding: BindingsBuilder(() => Get.lazyPut(() => ProductDetialsController())),
          transition: Transition.rightToLeftWithFade,
        ),
        GetPage(
          name: shippingDetailsScreen,
          page: () => const ShippingDetailsScreen(),
          binding: ShippingDetailsBinding(),
          transition: Transition.rightToLeftWithFade,
        ),
        GetPage(
          name: editShippingAddressScreen,
          page: () => const EditShippingAddressScreen(),
          binding: BindingsBuilder(() => Get.lazyPut(() => EditShippingDetailsController())),
          transition: Transition.rightToLeftWithFade,
        ),
        GetPage(
          name: cartScreen,
          page: () => const CartScreen(),
          transition: Transition.rightToLeftWithFade,
        ),
        GetPage(
          name: checkoutScreen,
          page: () => const CheckoutScreen(),
          transition: Transition.rightToLeftWithFade,
        ),
        GetPage(
          name: orderStatusScreen,
          page: () => const OrderStatusScreen(),
          transition: Transition.rightToLeftWithFade,
        ),
        GetPage(
          name: orderListScreen,
          page: () => const OrdersListScreen(),
          binding: BindingsBuilder(
            (() => Get.lazyPut(() => OrdersController())),
          ),
          transition: Transition.rightToLeftWithFade,
        ),
        GetPage(
          name: profileScreen,
          page: () => const ProfileScreen(),
          binding: BindingsBuilder(
            (() => Get.lazyPut(() => CartController())),
          ),
          transition: Transition.rightToLeftWithFade,
        )
      ];
}
