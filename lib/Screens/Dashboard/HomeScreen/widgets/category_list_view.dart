import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_user/Model/Category/category_model.dart';
import 'package:grocery_user/Screens/common/category_list_item_widget.dart';
import 'package:sliver_tools/sliver_tools.dart';

class CategoryListView extends StatelessWidget {
  final List<Category>? categoryList;
  CategoryListView({super.key, this.categoryList});

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
  @override
  Widget build(BuildContext context) {
    return MultiSliver(
      children: [
        SliverToBoxAdapter(
          child: Container(
            margin: const EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 16),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                "Categorys",
                style: Get.theme.textTheme.labelMedium?.copyWith(
                  fontSize: 15,
                ),
              ),
              Text(
                "View All",
                style: Get.theme.textTheme.labelSmall?.copyWith(
                    fontSize: 13, fontWeight: FontWeight.w500, color: const Color(0xffA7B7C5)),
              )
            ]),
          ),
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
              return CategoryListItemWidget(
                  imageUrl: testCategory[index].imageUrl!, title: testCategory[index].name!);
            },
            childCount: testCategory
                .length, //!!!!!Make sure to change this from test cat to catlist in production.
          ),
        )
      ],
    );
  }
}
