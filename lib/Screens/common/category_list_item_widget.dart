import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryListItemWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  const CategoryListItemWidget({super.key, required this.imageUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Get.theme.scaffoldBackgroundColor,
          backgroundImage: NetworkImage(imageUrl),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          title,
          style: Get.textTheme.labelSmall,
        )
      ],
    );
  }
}
