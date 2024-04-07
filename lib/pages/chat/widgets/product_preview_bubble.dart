import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/models/cart_model.dart';
import 'package:shoe_store_app/models/product_model.dart';
import 'package:shoe_store_app/pages/checkout/checkout_page.dart';
import 'package:shoe_store_app/pages/widgets/my_button.dart';
import 'package:shoe_store_app/pages/widgets/my_modal_bottom_sheet.dart';
import 'package:shoe_store_app/providers/cart_provider.dart';
import 'package:shoe_store_app/providers/checkout_provider.dart';
import 'package:shoe_store_app/shared/currency_format.dart';
import 'package:shoe_store_app/shared/theme.dart';

class ProductPreviewBubble extends StatelessWidget {
  final ProductModel product;
  final bool isFromUser;

  const ProductPreviewBubble({
    super.key,
    required this.product,
    this.isFromUser = false,
  });

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider =
        Provider.of<CartProvider>(context, listen: false);
    CheckoutProvider checkoutProvider =
        Provider.of<CheckoutProvider>(context, listen: false);

    createCartTemp() {
      cartProvider.cartTemp = CartModel(
        product: product,
        quantity: 1,
      );
    }

    handleAddToCart() {
      createCartTemp();
      CartModel cart = cartProvider.cartTemp;

      MyModalBottomSheet.show(
        context,
        cart: cart,
        onAddTapped: () => cartProvider.addQuantity(cart),
        onMinTapped: () {
          if (cart.quantity > 1) {
            cartProvider.minQuantity(cart);
          }
        },
        textOnButton: 'Add to Cart',
        onButtonTap: () {
          cartProvider.addCart();
          Navigator.pop(context);
          Fluttertoast.showToast(
            msg: "Added to cart",
          );
        },
      );
    }

    handleBuyNow() {
      createCartTemp();
      CartModel cart = cartProvider.cartTemp;

      MyModalBottomSheet.show(
        context,
        cart: cart,
        onAddTapped: () => cartProvider.addQuantity(cart),
        onMinTapped: () {
          if (cart.quantity > 1) {
            cartProvider.minQuantity(cart);
          }
        },
        textOnButton: 'Buy Now',
        onButtonTap: () {
          checkoutProvider.checkouts = [cart];
          Navigator.popAndPushNamed(context, CheckoutPage.routeName);
        },
      );
    }

    return Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.7,
      ),
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: isFromUser ? primaryColor : secondaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(isFromUser ? generalRadius : 0),
          topRight: Radius.circular(isFromUser ? 0 : generalRadius),
          bottomLeft: const Radius.circular(generalRadius),
          bottomRight: const Radius.circular(generalRadius),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: generalBorderRadius,
                child: Image.network(
                  product.galleries![0].url!.substring(25),
                  height: 70,
                  width: 70,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name!,
                      style: whiteTextStyle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      currencyFormat(product.price!),
                      style: whiteTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          isFromUser
              ? Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        MyButton(
                          text: 'Add to Cart',
                          onTap: handleAddToCart,
                          height: 40,
                          borderColor: whiteColor,
                          buttonColor: Colors.transparent,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        MyButton(
                          text: 'Buy Now',
                          onTap: handleBuyNow,
                          height: 40,
                          borderColor: tertiaryColor,
                          buttonColor: tertiaryColor,
                        ),
                      ],
                    ),
                  ],
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
