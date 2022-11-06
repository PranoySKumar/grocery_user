import 'package:get/get.dart';

import 'package:grocery_user/Repo/user_repo.dart';

class LoginController extends GetxController {
  RxString phoneNumber = "".obs;

  // loginUser() async {
  //   var response = await UserRepo.login(user);
  //   user = response.user;
  //   GetStorage().write("token", response.token);
  //   update();
  // }

  verifyPhoneNumber(String phoneNumber) async {
    var res = await UserRepo.verifyPhoneNumber(phoneNumber);
    print("verify Otp controller");
    print(res);
  }

  verifyOtp(String code) async {
    var res = await UserRepo.verifyOtp(phoneNumber.value, code);
    print("verify Otp controller");
    print(res);
  }
}
