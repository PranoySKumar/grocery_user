import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:grocery_user/Views/Categories/category_controller.dart';

import '../common/category_list_item_widget.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categoriesController = Get.find<CategoryController>();

    return Obx(
      (() => categoriesController.isLoading.isTrue
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
                    "Categories",
                    style: Get.theme.textTheme.titleMedium,
                  ),
                  backgroundColor: Get.theme.scaffoldBackgroundColor),
              body: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 100.0,
                        mainAxisSpacing: 5.0,
                        crossAxisSpacing: 5.0,
                        childAspectRatio: 1,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        var categories = categoriesController.getCategories;
                        return GestureDetector(
                          onTap: (() =>
                              categoriesController.navigateToProducts(categories[index].id!)),
                          child: CategoryListItemWidget(
                              imageUrl: categories[index].imageUrl!,
                              title: categories[index].name!),
                        );
                      },
                      itemCount: categoriesController.getCategories.length,
                    ),
                  ),
                ],
              ),
            )),
    );
  }
}
