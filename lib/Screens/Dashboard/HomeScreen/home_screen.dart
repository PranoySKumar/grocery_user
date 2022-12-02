import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_user/Screens/Dashboard/HomeScreen/home_controller.dart';
import 'package:grocery_user/Screens/Dashboard/HomeScreen/widgets/categories_list_strip.dart';
import 'package:grocery_user/Screens/Dashboard/HomeScreen/widgets/category_list_view.dart';
import 'package:grocery_user/Screens/Dashboard/HomeScreen/widgets/home_app_bar_view.dart';
import 'package:grocery_user/Screens/common/products_list_section_widget.dart';

import '../../../Model/User/user_model.dart';

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
          : RefreshIndicator(
              onRefresh: homeScreenController.loadData,
              color: Colors.black,
              child: CustomScrollView(
                slivers: [
                  _AppBar(
                    user: homeScreenController.user.value,
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 8,
                    ),
                  ),
                  CategoriesListStripe(
                      onTapCategory: homeScreenController.navigateToCategoryProductsScreen,
                      categoryList: homeScreenController.categories),
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
                    products: homeScreenController.discountedProducts,
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
                    products: homeScreenController.mostPopularProducts,
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
                    categoriesList: homeScreenController.categories,
                  )
                ],
              ),
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

class _AppBar extends StatelessWidget {
  final User user;
  const _AppBar({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    String info = "";
    if (user.shippingAddresses?[0] != null) {
      info = user.shippingAddresses?[0].address as String;
    } else if (user.pincode != null) {
      info = user.pincode as String;
    } else {
      info = "Guest";
    }

    return HomeAppbarView(
      address: info,
    );
  }
}
