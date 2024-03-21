import 'package:flutter/material.dart';
import 'package:shoe_store_app/models/cart_model.dart';
import 'package:shoe_store_app/pages/widgets/my_button.dart';
import 'package:shoe_store_app/pages/widgets/my_modal_bottom_sheet_content.dart';
import 'package:shoe_store_app/shared/theme.dart';

class MyModalBottomSheet {
  static void show(
    context, {
    required CartModel cart,
    required GestureTapCallback onAddTapped,
    required GestureTapCallback onMinTapped,
    required String textOnButton,
    required GestureTapCallback onButtonTap,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 210,
          padding: const EdgeInsets.all(pagePadding),
          decoration: const BoxDecoration(
            color: backgroundColor1,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(
                generalRadius,
              ),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MyModalBottomSheetContent(
                product: cart.product!,
                onAddTapped: onAddTapped,
                onMinTapped: onMinTapped,
              ),
              const SizedBox(
                height: 30,
              ),
              MyButton(
                text: textOnButton,
                onTap: onButtonTap,
              ),
            ],
          ),
        );
      },
    );
  }
}
