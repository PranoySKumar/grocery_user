import 'package:get/get.dart';
import 'package:grocery_user/Views/Login/OtpVerificationScreen/verify_otp_controller.dart';

class VerifyOtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VerifyOtpController());
  }
}
