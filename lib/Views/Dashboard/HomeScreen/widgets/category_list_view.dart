import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_user/Model/Category/category_model.dart';
import 'package:grocery_user/Views/common/category_list_item_widget.dart';
import 'package:sliver_tools/sliver_tools.dart';

class CategoryListView extends StatelessWidget {
  final List<Category> categoriesList;
  final VoidCallback onTapViewAllHandler;
  final Function(String) onTapCategoryHandler;
  const CategoryListView(
      {super.key,
      required this.categoriesList,
      required this.onTapViewAllHandler,
      required this.onTapCategoryHandler});

  @override
  Widget build(BuildContext context) {
    return MultiSliver(
      children: [
        SliverToBoxAdapter(
          child: _Header(onTapViewAll: onTapViewAllHandler),
        ),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 100.0,
            mainAxisSpacing: 5.0,
            crossAxisSpacing: 5.0,
            childAspectRatio: 1,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return InkWell(
                onTap: () => onTapCategoryHandler(categoriesList[index].id!),
                child: CategoryListItemWidget(
                    imageUrl: categoriesList[index].imageUrl!, title: categoriesList[index].name!),
              );
            },
            childCount: categoriesList.length,
          ),
        )
      ],
    );
  }
}

class _Header extends StatelessWidget {
  final VoidCallback onTapViewAll;
  const _Header({super.key, required this.onTapViewAll});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 16),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Categories",
              style: Get.theme.textTheme.labelMedium?.copyWith(
                fontSize: 15,
              ),
            ),
            InkWell(
              onTap: onTapViewAll,
              child: Text(
                "View All",
                style: Get.theme.textTheme.labelSmall?.copyWith(
                    fontSize: 13, fontWeight: FontWeight.w500, color: const Color(0xffA7B7C5)),
              ),
            )
          ]),
    );
  }
}
