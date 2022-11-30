import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:grocery_user/Screens/Dashboard/HomeScreen/home_controller.dart';
import 'package:grocery_user/Screens/common/icon_text_field.dart';

class HomeAppbarView extends StatelessWidget {
  final String? address;

  const HomeAppbarView({
    super.key,
    this.address,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      elevation: 0,
      collapsedHeight: 130,
      backgroundColor: Get.theme.scaffoldBackgroundColor,
      expandedHeight: 130,
      flexibleSpace: Container(
        margin: const EdgeInsets.only(top: 38, left: 12),
        child: Column(
          children: [
            Row(
              children: [
                const Icon(Icons.my_location_outlined),
                const SizedBox(
                  width: 17,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      address!.split(",")[0],
                      style: Get.theme.textTheme.labelMedium
                          ?.copyWith(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      address!.split(",")[1].trimLeft(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Get.theme.textTheme.labelMedium
                          ?.copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 22,
            ),
            const SearchBar()
          ],
        ),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 12),
          child: const Icon(
            Icons.account_circle_outlined,
            color: Colors.black,
          ),
        )
      ],
    );
  }
}

//search bar
class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    var homeScreenController = Get.find<HomeScreenController>();
    FocusNode focusNode = FocusNode();

    void submitHandler(String? value) {
      if (value != null && value.isNotEmpty) {
        homeScreenController.navigateToProductsSearchResultScreen(value);
      }
    }

    return WillPopScope(
      onWillPop: () async {
        if (focusNode.hasFocus) {
          focusNode.unfocus();
          return false;
        }

        return true;
      },
      child: Container(
        margin: const EdgeInsets.only(right: 12),
        child: IconTextField(
          focusNode: focusNode,
          controller: homeScreenController.searchBarEditingController,
          hint: "Fish, Meat, Mutton etc",
          prefixIcon: const Icon(
            Icons.search_outlined,
            color: Colors.black,
          ),
          suffixIcon: Obx(() => homeScreenController.searchQuery.value.isNotEmpty
              ? InkWell(
                  onTap: () {
                    focusNode.unfocus();
                    homeScreenController.setSearchQuery = "";
                  },
                  child: const Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                )
              : const SizedBox.shrink()),
          onChanged: homeScreenController.onSearchOueryChangeListner,
          borderSize: 2,
          textStyle: Get.theme.textTheme.labelSmall
              ?.copyWith(color: const Color(0xff333232), fontSize: 15),
          hintTextStyle:
              Get.theme.textTheme.labelSmall?.copyWith(color: Get.theme.hintColor, fontSize: 15),
          onSubmitted: submitHandler,
          contentPadding: const EdgeInsets.all(20),
        ),
      ),
    );
  }
}
