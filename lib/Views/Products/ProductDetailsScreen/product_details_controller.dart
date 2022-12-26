import 'package:get/get.dart';
import 'package:grocery_user/Remote/APIs/product_api.dart';
import 'package:grocery_user/Remote/APIs/user_api.dart';
import 'package:grocery_user/Remote/graphql_client.dart';
import 'package:grocery_user/Views/Dashboard/HomeScreen/home_controller.dart';

import '../../../Model/Product/product_model.dart';

class ProductDetialsController extends GetxController {
  //states
  final _loadingDetails = true.obs;
  final _isFavourite = false.obs;

  //fields
  late final Product _product;

  //getters
  Product get product => _product;
  RxBool get loadingDetails => _loadingDetails;
  RxBool get isFavourite => _isFavourite;

  final _homecontroller = Get.find<HomeScreenController>();

  @override
  void onInit() async {
    await loadingProductDetails();
    super.onInit();
  }

  void _setIsFavourite() {
    if (_homecontroller.user.value.favourites?.firstWhereOrNull((item) => item.id == _product.id) !=
        null) {
      _isFavourite.value = true;
    }
  }

  //loads current product details.
  Future<void> loadingProductDetails() async {
    _loadingDetails.value = true;
    var productArg = Get.arguments["product"] as Product;
    var variables = {"id": productArg.id};

    var result =
        await GraphqlActions.query(api: ProductApi.singleProductQuery, variables: variables);
    _product = Product.fromJson(result?["product"]);
    _setIsFavourite();
    _loadingDetails.value = false;
  }

  //toggle favourite
  void toggleFavourite() async {
    var listOfFavourites = _homecontroller.user.value.favourites != null
        ? [..._homecontroller.user.value.favourites!]
        : [];

    switch (isFavourite.value) {
      case false: //if False
        _isFavourite.value = true;
        listOfFavourites.add(Product(id: _product.id));
        var variables = {
          "id": _homecontroller.user.value.id,
          "data": {"favourites": listOfFavourites.map((item) => item.id).toList()},
        };
        try {
          await GraphqlActions.mutate(api: UserApi.updateUserMutation, variables: variables);
          _homecontroller.user.value.favourites?.add(_product);
          _homecontroller.update();
        } catch (e) {
          print(e);
          _isFavourite.value = false;
        }
        break;

      case true: //if True
        _isFavourite.value = false;

        listOfFavourites.removeWhere((item) => item.id == _product.id);

        var variables = {
          "id": _homecontroller.user.value.id,
          "data": {"favourites": listOfFavourites.map((item) => item.id).toList()},
        };
        try {
          await GraphqlActions.mutate(api: UserApi.updateUserMutation, variables: variables);
          _homecontroller.user.value.favourites?.removeWhere((item) => item.id == _product.id);
          _homecontroller.update();
        } catch (e) {
          print(e);
          _isFavourite.value = true;
        }
        break;
    }
  }
}
