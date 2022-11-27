import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:grocery_user/Screens/Products/products_controller.dart';
import 'package:grocery_user/Screens/common/product_card_widget.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productsController = Get.find<ProductsController>();

    return Obx(
      (() => productsController.isLoading.isTrue
          ? const Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              ),
            )
          : Scaffold(
              appBar: AppBar(
                  leading: const BackButton(
                    color: Colors.black,
                  ),
                  centerTitle: true,
                  elevation: 0,
                  title: Text(
                    "Products",
                    style: Get.theme.textTheme.titleMedium,
                  ),
                  backgroundColor: Get.theme.scaffoldBackgroundColor),
              body: Column(
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
                            product: productsController.getProducts[index],
                          );
                        },
                        itemCount: productsController.getProducts.length,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                ],
              ),
            )),
    );
  }
}
