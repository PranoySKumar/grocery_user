import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_user/Screens/Dashboard/HomeScreen/home_controller.dart';
import 'package:grocery_user/Screens/Dashboard/HomeScreen/widgets/categories_list_strip.dart';
import 'package:grocery_user/Screens/Dashboard/HomeScreen/widgets/category_list_view.dart';
import 'package:grocery_user/Screens/Dashboard/HomeScreen/widgets/home_app_bar_view.dart';
import 'package:grocery_user/Screens/common/products_list_section_widget.dart';

import '../../../Model/Category/category_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var homeScreenController = Get.find<HomeScreenController>();

    return Obx(
      (() => homeScreenController.isLoading.isTrue
          ? const Center(
              child: CircularProgressIndicator(
              color: Colors.black,
            ))
          : CustomScrollView(
              slivers: [
                const HomeAppbarView(),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 8,
                  ),
                ),
                CategoriesListStripe(
                    onTapCategory: homeScreenController.navigateToCategoryProductsScreen,
                    categoryList: homeScreenController.getCategories),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 12,
                  ),
                ),
                const _GreetingsWidget(),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 10,
                  ),
                ),
                ProductsListSectionWidget(
                  title: "Products On Sale!",
                  itemWidth: 200,
                  itemHeight: 240,
                  products: homeScreenController.getDiscountedProducts,
                  onTapViewAllHandler: homeScreenController.navigateToAllDiscountedProductsScreen,
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 25,
                  ),
                ),
                ProductsListSectionWidget(
                  title: "Popular Products",
                  itemWidth: 165,
                  products: homeScreenController.getMostPopularProducts,
                  onTapViewAllHandler: homeScreenController.navigateToMostPopularProductsScreen,
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 25,
                  ),
                ),
                CategoryListView(
                  onTapCategoryHandler: homeScreenController.navigateToCategoryProductsScreen,
                  onTapViewAllHandler: homeScreenController.navigateToCategoriesScreen,
                  categoriesList: homeScreenController.getCategories,
                )
              ],
            )),
    );
  }
}

class _GreetingsWidget extends StatelessWidget {
  const _GreetingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.only(
          left: 12,
          right: 12,
        ),
        child: Text("Hi Pranoy!", style: Get.theme.textTheme.labelLarge),
      ),
    );
  }
}

final List<Category> testCategory = [
  Category(
      id: "1",
      imageUrl:
          "https://media.istockphoto.com/id/505207430/photo/fresh-raw-beef-steak.jpg?s=612x612&w=0&k=20&c=QxOege3Io4h1TNJLtGYh71rxb29p1BfFcZvCipz4WVY=",
      name: "steak",
      type: "meat"),
  Category(
      id: "1",
      imageUrl: "https://5.imimg.com/data5/WI/ZZ/OL/ANDROID-81993397/product-jpeg-500x500.jpg",
      name: "fish cut piece",
      type: "meat"),
  Category(
      id: "1",
      imageUrl:
          "https://media.istockphoto.com/id/505207430/photo/fresh-raw-beef-steak.jpg?s=612x612&w=0&k=20&c=QxOege3Io4h1TNJLtGYh71rxb29p1BfFcZvCipz4WVY=",
      name: "steak",
      type: "meat"),
  Category(
      id: "1",
      imageUrl: "https://5.imimg.com/data5/WI/ZZ/OL/ANDROID-81993397/product-jpeg-500x500.jpg",
      name: "fish cut piece",
      type: "meat"),
  Category(
      id: "1",
      imageUrl:
          "https://media.istockphoto.com/id/505207430/photo/fresh-raw-beef-steak.jpg?s=612x612&w=0&k=20&c=QxOege3Io4h1TNJLtGYh71rxb29p1BfFcZvCipz4WVY=",
      name: "steak",
      type: "meat"),
  Category(
      id: "1",
      imageUrl: "https://5.imimg.com/data5/WI/ZZ/OL/ANDROID-81993397/product-jpeg-500x500.jpg",
      name: "fish cut piece",
      type: "meat"),
  Category(
      id: "1",
      imageUrl:
          "https://media.istockphoto.com/id/505207430/photo/fresh-raw-beef-steak.jpg?s=612x612&w=0&k=20&c=QxOege3Io4h1TNJLtGYh71rxb29p1BfFcZvCipz4WVY=",
      name: "steak",
      type: "meat"),
  Category(
      id: "1",
      imageUrl: "https://5.imimg.com/data5/WI/ZZ/OL/ANDROID-81993397/product-jpeg-500x500.jpg",
      name: "fish cut piece",
      type: "meat"),
];
