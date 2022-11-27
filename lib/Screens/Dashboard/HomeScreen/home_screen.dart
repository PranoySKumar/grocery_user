import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_user/Screens/Dashboard/HomeScreen/home_controller.dart';
import 'package:grocery_user/Screens/Dashboard/HomeScreen/widgets/home_app_bar_widget.dart';
import 'package:grocery_user/Screens/Dashboard/HomeScreen/widgets/products_list_section_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var homeScreenController = Get.find<HomeScreenController>();
    homeScreenController.loadAllDiscountedProducts();
    return Obx(
      (() => homeScreenController.isLoading.isTrue
          ? const Center(
              child: CircularProgressIndicator(
              color: Colors.black,
            ))
          : CustomScrollView(
              slivers: [
                const HomeAppbarWidget(),
                const _GreetingsWidget(),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 10,
                  ),
                ),
                ProductsListSectionWidget(
                  title: "On Sale Products!",
                  itemWidth: 200,
                  products: homeScreenController.getProducts,
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 25,
                  ),
                ),
                ProductsListSectionWidget(
                  title: "Popular Products",
                  itemWidth: 170,
                  products: homeScreenController.getProducts,
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 25,
                  ),
                ),
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
          top: 12,
        ),
        child: Text("Hi Pranoy!", style: Get.theme.textTheme.labelLarge),
      ),
    );
  }
}
