import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_user/Model/Product/product_model.dart';
import 'package:grocery_user/Views/Cart/cart_controller.dart';
import 'package:grocery_user/Views/Products/ProductDetailsScreen/product_details_controller.dart';
import 'package:grocery_user/Views/common/progress_screen.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({super.key});
  final productDetailsController = Get.find<ProductDetialsController>();
  final _cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      (() {
        var isLoading = productDetailsController.loadingDetails;
        if (isLoading.isTrue) return const ProgressScreen();
        var product = productDetailsController.product;
        return Scaffold(
          body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                Image.network(
                  product.imageUrl!,
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.fill,
                ),
                const _BackButton(),
                _ProductDetailsContent(
                    product: product,
                    cartController: _cartController,
                    productDetailsController: productDetailsController),
                const _BottomUnderline()
              ],
            ),
          ),
        );
      }),
    );
  }
}

class _BottomUnderline extends StatelessWidget {
  const _BottomUnderline({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: 50,
      right: 50,
      child: Container(
        height: 5,
        width: 200,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.grey),
      ),
    );
  }
}

class _ProductDetailsContent extends StatelessWidget {
  const _ProductDetailsContent({
    Key? key,
    required this.product,
    required CartController cartController,
    required this.productDetailsController,
  })  : _cartController = cartController,
        super(key: key);

  final Product product;
  final CartController _cartController;
  final ProductDetialsController productDetailsController;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      width: double.infinity,
      margin: const EdgeInsets.only(top: 280),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(50, 0, 0, 0),
              blurRadius: 8,
              offset: Offset(0, 4),
            )
          ],
          borderRadius:
              BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(right: 20),
                  child: Text(
                    product.name!,
                    textAlign: TextAlign.left,
                    style: Get.textTheme.labelMedium,
                  ),
                ),
              ),
              _FavouriteIcon(), // b // back button
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "${product.quantity!.value!.toInt()}g",
            textAlign: TextAlign.justify,
            style: Get.textTheme.labelSmall?.copyWith(color: Colors.grey),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _AddToCart(),
              _DiscountedPriceTag(discount: product.discount, price: product.price!.toInt())
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          //description
          Text(
            "Description",
            style: Get.textTheme.labelMedium,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            product.description!,
            textAlign: TextAlign.justify,
            style: Get.textTheme.labelSmall?.copyWith(color: Colors.grey),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => _cartController.addItemToCart(productDetailsController.product),
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  backgroundColor: Colors.green.shade400),
              child: Center(
                child: Text(
                  "Add To Cart",
                  style: Get.textTheme.labelMedium?.copyWith(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

//Add to cart
class _AddToCart extends StatelessWidget {
  _AddToCart({
    Key? key,
  }) : super(key: key);

  final _cartController = Get.find<CartController>();
  final _productDetailsController = Get.find<ProductDetialsController>();

  @override
  Widget build(BuildContext context) {
    return Obx((() {
      var product = _productDetailsController.product;
      var cartItem =
          _cartController.cart.firstWhereOrNull((element) => element.product.id == product.id);
      var itemCount = cartItem?.count ?? 0;

      return Row(
        children: [
          GestureDetector(
              onTap: (() => itemCount > 0 ? _cartController.decreaseItemInCart(product) : null),
              child: const Icon(Icons.remove)),
          const SizedBox(
            width: 20,
          ),
          Text(
            itemCount.toString(),
            style: Get.textTheme.labelMedium
                ?.copyWith(color: Colors.grey, fontWeight: FontWeight.w800),
          ),
          const SizedBox(
            width: 20,
          ),
          GestureDetector(
            onTap: (() => _cartController.addItemToCart(product)),
            child: const Icon(
              Icons.add,
              color: Colors.green,
            ),
          )
        ],
      );
    }));
  }
}

//Favourites Icon
class _FavouriteIcon extends StatelessWidget {
  final _controller = Get.find<ProductDetialsController>();

  _FavouriteIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _controller.toggleFavourite,
      child: Obx(
        () => _controller.isFavourite.isFalse
            ? const Icon(
                Icons.favorite_border_outlined,
                size: 25,
                color: Colors.black,
              )
            : Icon(
                Icons.favorite,
                size: 25,
                color: Colors.red.shade400,
              ),
      ),
    );
  }
}

//Backbutton
class _BackButton extends StatelessWidget {
  const _BackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.back(),
      child: Container(
        padding: const EdgeInsets.only(left: 5),
        margin: const EdgeInsets.only(top: 40, left: 15, right: 15),
        width: 35,
        height: 35,
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(50, 0, 0, 0),
            blurRadius: 8,
            offset: Offset(0, 4),
          )
        ], color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: const Icon(
          Icons.arrow_back_ios,
          size: 16,
          color: Colors.black,
        ),
      ),
    );
  }
}

class _DiscountedPriceTag extends StatelessWidget {
  final double? discount;
  final int price;
  const _DiscountedPriceTag({super.key, this.discount, required this.price});

  @override
  Widget build(BuildContext context) {
    var finalPrice = discount != null ? price - (price * (discount! / 100)) : price;
    return Container(
      margin: const EdgeInsets.only(right: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (discount != null)
            Text(
              "₹${price.toInt()}",
              style: Get.textTheme.labelSmall?.copyWith(
                decorationThickness: 2,
                decorationColor: Colors.black,
                decoration: TextDecoration.lineThrough,
                color: Get.theme.primaryColorLight,
              ),
            ),
          const SizedBox(
            width: 5,
          ),
          Text(
            "₹${finalPrice.toStringAsFixed(1).replaceAll(RegExp(r'([.]*0)(?!.*\d)'), "")}",
            style: Get.theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
          ),
          // const SizedBox(
          //   width: 5,
          // ),
          // if (discount != null)
          //   Text(
          //     "SAVE $discount%",
          //     style: Get.theme.textTheme.labelSmall
          //         ?.copyWith(fontSize: 10, color: Get.theme.highlightColor),
          //   ),
        ],
      ),
    );
  }
}
