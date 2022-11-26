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
      backgroundColor: Colors.white,
      expandedHeight: 150,
      flexibleSpace: Container(
        margin: const EdgeInsets.only(top: 38, left: 17),
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
          margin: const EdgeInsets.only(right: 17),
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
      margin: const EdgeInsets.only(right: 20),
      child: IconTextField(
        controller: TextEditingController(),
        hint: "Fish, Meat, Mutton etc",
        prefixIcon: const Icon(
          Icons.search_outlined,
          color: Colors.black,
        ),
        suffixIcon: Obx(() => controller.searchQuery.value.isNotEmpty
            ? const Icon(
                Icons.close,
                color: Colors.black,
              )
            : SizedBox.shrink()),
        borderSize: 2,
        textStyle: Get.theme.textTheme.labelSmall?.copyWith(fontSize: 15),
        hintTextStyle:
            Get.theme.textTheme.labelSmall?.copyWith(color: Colors.grey.shade300, fontSize: 15),
        onSubmitted: (value) {},
        contentPadding: const EdgeInsets.all(20),
      ),
    );
  }
}
