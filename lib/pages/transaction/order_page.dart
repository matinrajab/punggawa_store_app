import 'package:flutter/material.dart';
import 'package:shoe_store_app/pages/transaction/widgets/order_page_body.dart';
import 'package:shoe_store_app/shared/order_status.dart';
import 'package:shoe_store_app/shared/theme.dart';

class OrderPage extends StatelessWidget {
  static const routeName = '/order';

  final int initial;

  const OrderPage({
    super.key,
    required this.initial,
  });

  @override
  Widget build(BuildContext context) {
    List<String> tabBarItems = [
      'Pending',
      'Shipping',
      'Completed',
    ];

    return DefaultTabController(
      initialIndex: initial,
      length: 3,
      child: Scaffold(
        backgroundColor: backgroundColor1,
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: Text(
            'Order History',
            style: whiteTextStyle.copyWith(
              fontSize: 18,
              fontWeight: medium,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              backIcon,
              color: whiteColor,
            ),
          ),
          bottom: TabBar(
            indicatorColor: whiteColor,
            dividerColor: primaryColor,
            labelStyle: whiteTextStyle,
            unselectedLabelStyle: unselectedTextStyle,
            tabs: tabBarItems
                .map((e) => Tab(
                      text: e,
                    ))
                .toList(),
          ),
        ),
        body: const TabBarView(
          children: [
            OrderPageBody(
              status: pendingOrder,
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
