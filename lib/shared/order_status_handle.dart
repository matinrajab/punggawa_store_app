import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/models/cart_model.dart';
import 'package:shoe_store_app/models/item_model.dart';
import 'package:shoe_store_app/pages/checkout/checkout_page.dart';
import 'package:shoe_store_app/pages/transaction/widgets/received_alert_dialog.dart';
import 'package:shoe_store_app/providers/checkout_provider.dart';

class OrderStatusHandle {
  static void orderReceived(context, {required int id}) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => ReceivedAlertDialog(id),
    );
  }

  static void buyAgain(
    context, {
    required List<ItemModel> items,
  }) {
    CheckoutProvider checkoutProvider =
        Provider.of<CheckoutProvider>(context, listen: false);
    List<CartModel> checkouts = checkoutProvider.checkouts;

    checkoutProvider.resetData();
    for (var item in items) {
      checkouts.add(
        CartModel(
          product: item.product,
          quantity: item.quantity!,
        ),
      );
    }
    Navigator.pushNamed(context, CheckoutPage.routeName);
  }
}
