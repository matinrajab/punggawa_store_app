import 'package:flutter/material.dart';
import 'package:shoe_store_app/models/cart_model.dart';
import 'package:shoe_store_app/models/transaction_model.dart';
import 'package:shoe_store_app/pages/transaction/widgets/title_and_desc.dart';
import 'package:shoe_store_app/pages/widgets/my_app_bar.dart';
import 'package:shoe_store_app/pages/widgets/my_button.dart';
import 'package:shoe_store_app/pages/widgets/payment_summary.dart';
import 'package:shoe_store_app/pages/transaction/widgets/order_address.dart';
import 'package:shoe_store_app/pages/widgets/detail_tile.dart';
import 'package:shoe_store_app/shared/order_status.dart';
import 'package:shoe_store_app/shared/order_status_handle.dart';
import 'package:shoe_store_app/shared/theme.dart';

class DetailOrderPage extends StatelessWidget {
  static const routeName = '/detail-order';

  final TransactionModel transaction;

  const DetailOrderPage({
    super.key,
    required this.transaction,
  });

  totalItems() {
    int total = 0;
    for (var item in transaction.items!) {
      total += item.quantity!;
    }
    return total;
  }

  totalPrice() {
    int total = 0;
    for (var item in transaction.items!) {
      total += item.quantity! * item.product!.price!;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    String status = transaction.status!;

    return Scaffold(
      backgroundColor: backgroundColor1,
      appBar: const MyAppBar(
        text: 'Order Details',
        leadingIcon: backIcon,
      ),
      body: ListView(
        padding: const EdgeInsets.all(pagePadding),
        children: [
          Text(
            'List Items',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
          Column(
            children: transaction.items!
                .map(
                  (item) => DetailTile(
                    cart: CartModel(
                      product: item.product,
                      quantity: item.quantity!,
                    ),
                  ),
                )
                .toList(),
          ),
          const SizedBox(
            height: 30,
          ),
          TitleAndDesc(
            title: 'Delivery Status',
            desc: status,
          ),
          const SizedBox(
            height: 30,
          ),
          OrderAddress(
            name: transaction.name!,
            phone: transaction.phone!,
            address: transaction.address!,
          ),
          const SizedBox(
            height: 30,
          ),
          PaymentSummary(
            quantity: totalItems(),
            productPrice: totalPrice(),
            shippingPrice: transaction.shippingPrice!,
          ),
          const SizedBox(
            height: 30,
          ),
          TitleAndDesc(
            title: 'Payment Method',
            desc: transaction.paymentMethod!.name!,
          ),
          const SizedBox(
            height: 30,
          ),
          status != pendingOrder
              ? MyButton(
                  text:
                      status == shippingOrder ? 'Order Received' : 'Buy Again',
                  onTap: () {
                    switch (status) {
                      case shippingOrder:
                        OrderStatusHandle.orderReceived(
                          context,
                          id: transaction.id!,
                        );
                        break;
                      case successOrder:
                        OrderStatusHandle.buyAgain(
                          context,
                          items: transaction.items!,
                        );
                        break;
                    }
                  },
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
