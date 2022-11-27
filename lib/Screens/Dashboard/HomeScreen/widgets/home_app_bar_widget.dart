import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:grocery_user/Screens/Dashboard/HomeScreen/home_controller.dart';
import 'package:grocery_user/Screens/common/icon_text_field.dart';

class HomeAppbarWidget extends StatelessWidget {
  final String? address;
  const HomeAppbarWidget({super.key, this.address});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: true,
      elevation: 0,
      collapsedHeight: 129,
      backgroundColor: Get.theme.scaffoldBackgroundColor,
      expandedHeight: 129,
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
                      "Kulathoor Road",
                      style: Get.theme.textTheme.labelMedium,
                    ),
                    const Text(
                      "Kulathoor, Kazhakootam",
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 24,
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

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<HomeScreenController>();

    return Container(
      margin: const EdgeInsets.only(right: 12),
      child: IconTextField(
        controller: controller.searchBarEditingController,
        hint: "Fish, Meat, Mutton etc",
        prefixIcon: const Icon(
          Icons.search_outlined,
          color: Colors.black,
        ),
        suffixIcon: Obx(() => controller.searchQuery.value.isNotEmpty
            ? InkWell(
                onTap: () =>
                    controller.searchBarEditingController.value = const TextEditingValue(text: ""),
                child: const Icon(
                  Icons.close,
                  color: Colors.black,
                ),
              )
            : const SizedBox.shrink()),
        onChanged: controller.onSearchOueryChangeListner,
        borderSize: 2,
        textStyle:
            Get.theme.textTheme.labelSmall?.copyWith(color: const Color(0xff333232), fontSize: 15),
        hintTextStyle:
            Get.theme.textTheme.labelSmall?.copyWith(color: Get.theme.hintColor, fontSize: 15),
        onSubmitted: (value) {},
        contentPadding: const EdgeInsets.all(20),
      ),
    );
  }
}
