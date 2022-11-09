import 'package:get/get.dart';
import 'package:grocery_user/Remote/Providers/user_provider.dart';

class HomeScreenController extends GetxController {
  @override
  void onReady() {
    var arg = Get.arguments as LoginResponse;
    print(arg.token);
    super.onReady();
  }
}
