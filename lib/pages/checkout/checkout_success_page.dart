import 'package:flutter/material.dart';
import 'package:shoe_store_app/pages/transaction/order_page.dart';
import 'package:shoe_store_app/pages/widgets/empty_item.dart';
import 'package:shoe_store_app/pages/widgets/my_app_bar.dart';
import 'package:shoe_store_app/pages/widgets/my_button.dart';
import 'package:shoe_store_app/shared/theme.dart';

class CheckoutSuccessPage extends StatelessWidget {
  static const routeName = '/checkout-success';

  const CheckoutSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: const MyAppBar(
        text: 'Checkout Success',
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const EmptyItem(
              iconAsset: 'assets/icon/icon_empty_cart.png',
              title: 'You made a transaction',
              subtitle: 'Stay at home while we prepare your dream shoes',
              textOnButton: 'Order Other Shoes',
              widthButton: 200,
            ),
            const SizedBox(
              height: 12,
            ),
            MyButton(
              text: 'View My Order',
              onTap: () => Navigator.pushNamed(context, OrderPage.routeName,
                  arguments: 1),
              buttonColor: const Color(0xff39374B),
              borderColor: const Color(0xff39374B),
              height: 44,
              width: 200,
            ),
          ],
        ),
      ),
    );
  }
}
