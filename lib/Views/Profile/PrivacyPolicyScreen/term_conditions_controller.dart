import 'package:get/get.dart';

class TermsAndConditionsController extends GetxController {
  var content = "".obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    loadContent();
    super.onInit();
  }

  void loadContent() {
    isLoading.value = true;
  }
}
