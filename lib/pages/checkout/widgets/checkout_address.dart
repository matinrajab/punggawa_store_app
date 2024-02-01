import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/pages/checkout/widgets/checkout_address_item.dart';
import 'package:shoe_store_app/providers/transaction_provider.dart';
import 'package:shoe_store_app/routes/route_name.dart';
import 'package:shoe_store_app/theme/theme.dart';

class CheckoutAddress extends StatelessWidget {
  const CheckoutAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: generalBorderRadius,
        color: backgroundColor4,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Address Detail',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          const CheckoutAddressItem(
            imageAssets: 'assets/icon/icon_store_location.png',
            address: 'Store Location',
            information: 'Adidas Core',
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Consumer<TransactionProvider>(
                  builder: (context, transactionProvider, _) =>
                      CheckoutAddressItem(
                    imageAssets: 'assets/icon/icon_your_address.png',
                    address: 'Shipping Address',
                    information: transactionProvider.address,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, editAddressPage),
                child: Text(
                  'Edit',
                  style: priceTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: light,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
