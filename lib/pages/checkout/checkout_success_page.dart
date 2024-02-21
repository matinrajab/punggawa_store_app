import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/pages/widgets/empty_item.dart';
import 'package:shoe_store_app/pages/widgets/my_button.dart';
import 'package:shoe_store_app/providers/transaction_provider.dart';
import 'package:shoe_store_app/routes/route_name.dart';
import 'package:shoe_store_app/shared/theme.dart';

class CheckoutSuccessPage extends StatelessWidget {
  const CheckoutSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    handleViewOrder() async {
      await Provider.of<TransactionProvider>(context, listen: false)
          .getTransactions();
      return Navigator.pushNamed(context, orderPage);
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: AppBar(
        backgroundColor: backgroundColor1,
        title: Text(
          'Checkout Success',
          style: primaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
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
              onTap: handleViewOrder,
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
