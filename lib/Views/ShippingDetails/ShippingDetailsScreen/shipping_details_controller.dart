import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grocery_user/Model/User/user_model.dart';
import 'package:grocery_user/Remote/APIs/user_api.dart';
import 'package:grocery_user/Remote/grapql_client.dart';
import 'package:grocery_user/Routes/route_helper.dart';
import 'package:grocery_user/Views/Dashboard/HomeScreen/home_controller.dart';
import 'package:grocery_user/Utils/snackbar.dart';

class ShippingDetailsController extends GetxController {
  final _details = <ShippingAddress>[].obs;

  RxList<ShippingAddress> get shippingDetails => _details;

  @override
  void onInit() {
    loadShippingDetails();
    super.onInit();
  }

  loadShippingDetails() {
    var userDetails = Get.find<HomeScreenController>().getUserDetails;
    if (userDetails.shippingAddresses != null || userDetails.shippingAddresses!.isNotEmpty) {
      _details.assignAll(userDetails.shippingAddresses!);
    }
    _details.refresh();
  }

  deleteAddressHandler(int addressIndex) async {
    var shippingAddress = _details[addressIndex];
    var homeController = Get.find<HomeScreenController>();

    _details.removeAt(addressIndex);
    _details.refresh();

    homeController.getUserDetails.shippingAddresses?.removeAt(addressIndex);
    try {
      var data = {
        "shippingAddresses": [..._details.map((element) => element.toJson)]
      };
      await GraphqlActions.mutate(
          api: UserApi.updateUserMutation,
          variables: {"id": homeController.user.value.id!, "data": data});
    } catch (e) {
      _details.add(shippingAddress);
      _details.refresh();
      homeController.getUserDetails.shippingAddresses?.add(shippingAddress);
      SnackBarDisplay.show();
      rethrow;
    }
  }
}
