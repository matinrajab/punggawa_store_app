import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/models/address_model.dart';
import 'package:shoe_store_app/pages/checkout/select_address_page.dart';
import 'package:shoe_store_app/pages/widgets/address_card_content.dart';
import 'package:shoe_store_app/providers/address_provider.dart';
import 'package:shoe_store_app/shared/theme.dart';

class CheckoutAddress extends StatelessWidget {
  const CheckoutAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 20, 20, 20),
      decoration: BoxDecoration(
        borderRadius: generalBorderRadius,
        color: backgroundColor2,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/icon/your_address.png',
            height: 30,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Shipping Address',
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: medium,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(
                          context, SelectAddressPage.routeName),
                      child: Text(
                        'Edit',
                        style: priceTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: light,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Consumer<AddressProvider>(
                  builder: (context, addressProvider, _) {
                    List<AddressModel> addresses = addressProvider.addresses;
                    if (addresses.isNotEmpty) {
                      AddressModel address =
                          addresses[addressProvider.addressSelected];
                      return AddressCardContent(
                        address: address,
                      );
                    } else {
                      return Text(
                        'You don\'t have shipping address yet',
                        style: primaryTextStyle.copyWith(
                          fontWeight: medium,
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
