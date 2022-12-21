import 'package:get/get.dart';
import 'package:grocery_user/Remote/APIs/product_api.dart';
import 'package:grocery_user/Remote/grapql_client.dart';

import '../../../Model/Product/product_model.dart';

class ProductDetialsController extends GetxController {
  var loadingDetails = true.obs;

  late final Product product;

  @override
  void onInit() {
    loadingProductDetails();

    super.onInit();
  }

  void loadingProductDetails() async {
    loadingDetails.value = true;
    var productArg = Get.arguments["product"] as Product;
    var variables = {"id": productArg.id};

    var result =
        await GraphqlActions.query(api: ProductApi.singleProductQuery, variables: variables);
    product = Product.fromJson(result?["product"]);

    loadingDetails.value = false;
  }
}
