import 'package:flutter/material.dart';
import 'package:shoe_store_app/models/cart_model.dart';
import 'package:shoe_store_app/models/transaction_model.dart';
import 'package:shoe_store_app/pages/transaction/widgets/title_and_desc.dart';
import 'package:shoe_store_app/pages/widgets/payment_summary.dart';
import 'package:shoe_store_app/pages/transaction/widgets/order_address.dart';
import 'package:shoe_store_app/pages/widgets/detail_tile.dart';
import 'package:shoe_store_app/theme/theme.dart';

class DetailOrderPage extends StatelessWidget {
  const DetailOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final transaction =
        ModalRoute.of(context)!.settings.arguments as TransactionModel;

    totalItems() {
      int total = 0;
      for (var item in transaction.items!) {
        total += item.quantity!;
      }
      return total;
    }

    totalPrice() {
      double total = 0;
      for (var item in transaction.items!) {
        total += item.quantity! * item.product!.price!;
      }
      return total;
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: AppBar(
        backgroundColor: backgroundColor1,
        title: Text(
          'Order Details',
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
            desc: transaction.status!,
          ),
          const SizedBox(
            height: 30,
          ),
          OrderAddress(shippingAddress: transaction.address!),
          const SizedBox(
            height: 30,
          ),
          PaymentSummary(
            quantity: totalItems(),
            productPrice: totalPrice(),
          ),
          const SizedBox(
            height: 30,
          ),
          TitleAndDesc(
            title: 'Payment Method',
            desc: transaction.paymentMethod!,
          ),
        ],
      ),
    );
  }
}
