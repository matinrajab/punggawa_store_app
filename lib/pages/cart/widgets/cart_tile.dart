import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/models/cart_model.dart';
import 'package:shoe_store_app/models/product_model.dart';
import 'package:shoe_store_app/pages/widgets/my_alert_dialog.dart';
import 'package:shoe_store_app/providers/cart_provider.dart';
import 'package:shoe_store_app/providers/checkout_provider.dart';
import 'package:shoe_store_app/shared/currency_format.dart';
import 'package:shoe_store_app/shared/theme.dart';

class CartTile extends StatelessWidget {
  final CartModel cart;

  const CartTile({
    super.key,
    required this.cart,
  });

  @override
  Widget build(BuildContext context) {
    final ProductModel product = cart.product!;
    CartProvider cartProvider =
        Provider.of<CartProvider>(context, listen: false);
    Provider.of<CheckoutProvider>(context, listen: false);
    List<CartModel> cartSelected = cartProvider.cartSelected;

    removeConfirmAlert() {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => MyAlertDialog(
          text: 'Do you want to remove this product?',
          onYesTapped: () {
            Navigator.pop(context);
            cartProvider.removeCart(cart);
            cartProvider.unselect(cart);
          },
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 10, 16, 10),
        decoration: BoxDecoration(
          borderRadius: generalBorderRadius,
          color: backgroundColor2,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Checkbox(
                  value: cartSelected.contains(cart),
                  onChanged: (bool? value) {
                    if (value != null) {
                      value
                          ? cartProvider.select(cart)
                          : cartProvider.unselect(cart);
                    }
                  },
                  activeColor: primaryColor,
                  checkColor: whiteColor,
                ),
                ClipRRect(
                  borderRadius: generalBorderRadius,
                  child: Image.network(
                    product.galleries![0].url!.substring(25),
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        product.name!,
                        style: primaryTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        currencyFormat(product.price!),
                        style: priceTextStyle,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () => cartProvider.addQuantity(cart),
                      child: Image.asset(
                        'assets/button/add.png',
                        width: 16,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Text(
                        '${cart.quantity}',
                        style: primaryTextStyle.copyWith(fontWeight: medium),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (cart.quantity > 1) {
                          cartProvider.minQuantity(cart);
                        } else {
                          removeConfirmAlert();
                        }
                      },
                      child: Image.asset(
                        'assets/button/min.png',
                        width: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: GestureDetector(
                onTap: removeConfirmAlert,
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icon/trash.png',
                      width: 10,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      'Remove',
                      style: alertTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: light,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
