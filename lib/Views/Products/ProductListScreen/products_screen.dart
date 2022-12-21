import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:grocery_user/Views/Products/ProductListScreen/products_controller.dart';
import 'package:grocery_user/Views/common/product_card_widget.dart';
import 'package:grocery_user/Views/common/progress_screen.dart';

import '../../../Model/Product/product_model.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productsController = Get.find<ProductsController>();

    return Obx(
      (() => productsController.isLoading.isTrue
          ? const ProgressScreen()
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
              body: productsController
                      .getProducts.isEmpty // If products are empty return out put a message.
                  ? Center(
                      child: Text(
                      "No products available",
                      style: Get.theme.textTheme.titleMedium,
                    ))
                  : _ProductList(productsController.getProducts),
            )),
    );
  }
}

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
