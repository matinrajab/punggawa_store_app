import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/models/address_model.dart';
import 'package:shoe_store_app/pages/address/add_address_page.dart';
import 'package:shoe_store_app/pages/address/widgets/address_card.dart';
import 'package:shoe_store_app/pages/widgets/my_app_bar.dart';
import 'package:shoe_store_app/pages/widgets/my_button.dart';
import 'package:shoe_store_app/providers/address_provider.dart';
import 'package:shoe_store_app/shared/theme.dart';

class SelectAddressPage extends StatelessWidget {
  static const routeName = '/select-address';

  const SelectAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: const MyAppBar(
        text: 'Select Address',
        leadingIcon: backIcon,
      ),
      body: ListView(
        padding:
            const EdgeInsets.symmetric(horizontal: pagePadding, vertical: 20),
        children: [
          Consumer<AddressProvider>(
            builder: (context, addressProvider, _) {
              int index = 0;
              List<AddressModel> addresses = addressProvider.addresses;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: addresses.map((address) {
                  int indexTemp = index++;
                  return AddressCard(
                    address: address,
                    onTap: () {
                      addressProvider.addressSelected = indexTemp;
                      Navigator.pop(context);
                    },
                  );
                }).toList(),
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
          MyButton(
            text: '+ Add New Address',
            onTap: () => Navigator.pushNamed(context, AddAddressPage.routeName),
          ),
        ],
      ),
    );
  }
}
