import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_user/Screens/Dashboard/HomeScreen/widgets/home_app_bar_widget.dart';
import 'package:grocery_user/Screens/Dashboard/HomeScreen/widgets/onsale_products_list_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [const HomeAppbarWidget(), OnSaleProductsListWidget()],
    );
  }
}
