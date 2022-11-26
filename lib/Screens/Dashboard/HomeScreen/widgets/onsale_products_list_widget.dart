import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_user/Model/Product/product_model.dart';
import 'package:grocery_user/Screens/common/product_card_widget.dart';

import 'package:sliver_tools/sliver_tools.dart';

class OnSaleProductsListWidget extends StatelessWidget {
  OnSaleProductsListWidget({super.key});
  final List<Product> products = [
    Product(
        description: "some description",
        discount: 22,
        id: "1",
        name: "Sail Fish/ Ola Meen - Fillet (250g pack)",
        price: 269,
        quantity: Quantity(totalQuantity: 500, type: QuantityType.wgt, value: 250),
        imageUrl:
            "https://images.unsplash.com/photo-1519708227418-c8fd9a32b7a2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"),
    Product(
        description: "some description",
        discount: 22,
        id: "1",
        name: "Sail Fish/ Ola Meen - Fillet (250g pack)",
        price: 269,
        quantity: Quantity(totalQuantity: 500, type: QuantityType.wgt, value: 250),
        imageUrl:
            "https://images.unsplash.com/photo-1519708227418-c8fd9a32b7a2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"),
    Product(
        description: "some description",
        discount: 22,
        id: "1",
        name: "Sail Fish/ Ola Meen - Fillet (250g pack)",
        price: 269,
        quantity: Quantity(totalQuantity: 500, type: QuantityType.wgt, value: 250),
        imageUrl:
            "https://images.unsplash.com/photo-1519708227418-c8fd9a32b7a2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"),
    Product(
        description: "some description",
        discount: 22,
        id: "1",
        name: "Sail Fish/ Ola Meen - Fillet (250g pack)",
        price: 269,
        quantity: Quantity(totalQuantity: 500, type: QuantityType.wgt, value: 250),
        imageUrl:
            "https://images.unsplash.com/photo-1519708227418-c8fd9a32b7a2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80")
  ];
  @override
  Widget build(BuildContext context) {
    return MultiSliver(
      children: [
        SliverToBoxAdapter(
            child: Container(
          margin: EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 16),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              "On Sale!",
              style: Get.theme.textTheme.labelMedium?.copyWith(fontSize: 18),
            ),
            Text(
              "View All",
              style: Get.theme.textTheme.labelSmall
                  ?.copyWith(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xffA7B7C5)),
            )
          ]),
        )),
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 12),
            height: 310,
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(width: 16),
              itemCount: products.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => ProductCardWidget(product: products[index]),
            ),
          ),
        )
      ],
    );
  }
}
