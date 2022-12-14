import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../../Model/Category/category_model.dart';

class CategoriesListStripe extends StatelessWidget {
  final List<Category> categoryList;
  final Function(String) onTapCategory;
  const CategoriesListStripe({super.key, required this.categoryList, required this.onTapCategory});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 28,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          separatorBuilder: ((context, index) => const SizedBox(
                width: 8,
              )),
          itemBuilder: ((context, index) => InkWell(
              onTap: (() => onTapCategory(categoryList[index].id!)),
              child: _SingleCategoryStripe(category: categoryList[index]))),
          itemCount: categoryList.length,
        ),
      ),
    );
  }
}

class _SingleCategoryStripe extends StatelessWidget {
  final Category category;
  const _SingleCategoryStripe({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.black),
          borderRadius: const BorderRadius.all(Radius.circular(8))),
      child: Text(
        category.name!,
        style: Get.theme.textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w600),
      ),
    );
  }
}
