import 'package:flutter/material.dart';
import 'package:shoe_store_app/pages/transaction/widgets/order_page_body.dart';
import 'package:shoe_store_app/shared/order_status.dart';
import 'package:shoe_store_app/shared/theme.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> tabBarItems = [
      'Pending',
      'Shipping',
      'Complete',
    ];

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: backgroundColor3,
        appBar: AppBar(
          backgroundColor: backgroundColor1,
          title: Text(
            'Your Order',
            style: primaryTextStyle.copyWith(
              fontSize: 18,
              fontWeight: medium,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: primaryTextColor,
            ),
          ),
          bottom: TabBar(
            indicatorColor: primaryColor,
            dividerColor: backgroundColor1,
            labelStyle: buttonTextStyle,
            unselectedLabelStyle: primaryTextStyle,
            tabs: tabBarItems
                .map((e) => Tab(
                      text: e,
                    ))
                .toList(),
          ),
        ),
        body: TabBarView(
          children: [
            OrderPageBody(
              status: pendingOrder,
              textButton: 'Pay Now',
            ),
            OrderPageBody(
              status: shippingOrder,
              textButton: 'Order Received',
            ),
            OrderPageBody(
              status: successOrder,
            ),
          ],
        ),
      ),
    );
  }
}
