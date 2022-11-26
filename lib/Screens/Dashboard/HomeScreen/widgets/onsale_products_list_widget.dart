import 'package:flutter/material.dart';
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
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("On Sale!"), Text("View All")]),
        )),
        SliverToBoxAdapter(
          child: Container(
            height: 310,
            child: ListView.builder(
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
