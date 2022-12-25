import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:grocery_user/Views/Dashboard/HomeScreen/home_controller.dart';
import 'package:grocery_user/Views/common/product_card_widget.dart';

import '../../../Model/Product/product_model.dart';
import '../../common/progress_screen.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var homeController = Get.find<HomeScreenController>();
    return Obx(
      (() => homeController.isLoading.isTrue
          ? const ProgressScreen()
          : Scaffold(
              appBar: AppBar(
                  centerTitle: true,
                  elevation: 0,
                  title: Text(
                    "Favourites",
                    style: Get.theme.textTheme.titleMedium,
                  ),
                  backgroundColor: Get.theme.scaffoldBackgroundColor),
              body: GetBuilder<HomeScreenController>(
                builder: ((controller) => controller.user.value.favourites != null &&
                        controller.user.value.favourites!
                            .isEmpty // If products are empty return out put a message.
                    ? Center(
                        child: Text(
                        "No Favourites Available",
                        style: Get.theme.textTheme.titleMedium,
                      ))
                    : _ProductList(controller.user.value.favourites!)),
              ),
            )),
    );
  }
}

// Product List
class _ProductList extends StatelessWidget {
  final List<Product> products;
  const _ProductList(this.products);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
                childAspectRatio: 2 / 3,
              ),
              itemBuilder: (BuildContext context, int index) {
                return ProductCardWidget(
                  product: products[index],
                );
              },
              itemCount: products.length,
            ),
          ),
        ),
        const SizedBox(
          height: 3,
        ),
      ],
    );
  }
}
