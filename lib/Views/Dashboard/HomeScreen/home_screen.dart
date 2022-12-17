import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_user/Routes/route_helper.dart';
import 'package:grocery_user/Views/Cart/cart_controller.dart';
import 'package:grocery_user/Views/Dashboard/HomeScreen/home_controller.dart';
import 'package:grocery_user/Views/Dashboard/HomeScreen/widgets/categories_list_strip.dart';
import 'package:grocery_user/Views/Dashboard/HomeScreen/widgets/category_list_view.dart';
import 'package:grocery_user/Views/Dashboard/HomeScreen/widgets/home_app_bar_view.dart';
import 'package:grocery_user/Views/common/cart_overlay.dart';
import 'package:grocery_user/Views/common/products_list_section_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var homeScreenController = Get.find<HomeScreenController>();
    var cartScreenController = Get.find<CartController>();
    return Obx(
      (() => homeScreenController.isLoading.isTrue
          ? const Center(
              child: CircularProgressIndicator(
              color: Colors.black,
            ))
          : RefreshIndicator(
              onRefresh: homeScreenController.loadData,
              color: Colors.black,
              child: Stack(alignment: Alignment.center, fit: StackFit.expand, children: [
                const _HomeScreenView(),
                if (cartScreenController.cart.isNotEmpty)
                  Positioned(
                      bottom: 9,
                      child: CartOverlay(
                        onProceed: (() => Get.toNamed(RouteHelper.cartScreen)),
                        itemCount: cartScreenController.totalItemCount(),
                        totalPrice: cartScreenController.totalPrice(),
                        label: "Proceed to Cart",
                      )),
              ]),
            )),
    );
  }
}

class _HomeScreenView extends StatelessWidget {
  const _HomeScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    var homeScreenController = Get.find<HomeScreenController>();
    return CustomScrollView(
      slivers: [
        const HomeAppbarView(),
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
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 100),
        )
      ],
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
