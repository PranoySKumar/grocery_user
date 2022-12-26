import 'package:get/get.dart';
import 'package:grocery_user/Model/Order/order_model.dart';
import 'package:grocery_user/Remote/APIs/orders_api.dart';
import 'package:grocery_user/Remote/graphql_client.dart';
import 'package:grocery_user/Views/Dashboard/HomeScreen/home_controller.dart';

class OrdersController extends GetxController {
  List<Order> _orders = [];
  var isloading = false.obs;

  List<Order> get orders => _orders; //gets all orders

  @override
  void onInit() async {
    await loadOrders();
    super.onInit();
  }

  Future<void> loadOrders() async {
    isloading.value = true;
    var homeController = Get.find<HomeScreenController>();
    var data = await GraphqlActions.query(
        api: OrdersApi.getAllOrdersList, variables: {"userId": homeController.user.value.id});

    var list = data?["userOrders"] as List<dynamic>;
    _orders = list.map((item) => Order.fromJson(item)).toList();
    isloading.value = false;
  }
}
