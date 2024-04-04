import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/pages/widgets/my_alert_dialog.dart';
import 'package:shoe_store_app/pages/widgets/my_circular_indicator.dart';
import 'package:shoe_store_app/pages/widgets/my_snack_bar.dart';
import 'package:shoe_store_app/providers/raja_ongkir_provider.dart';
import 'package:shoe_store_app/providers/address_provider.dart';

class DeleteAddressAlertDialog extends StatelessWidget {
  final int id;

  const DeleteAddressAlertDialog({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    handleDelete() async {
      AddressProvider addressProvider =
          Provider.of<AddressProvider>(context, listen: false);
      RajaOngkirProvider rajaOngkirProvider =
          Provider.of<RajaOngkirProvider>(context, listen: false);

      addressProvider.isAlertLoading = true;
      if (await addressProvider.deleteAddress(id: id)) {
        await addressProvider.getAddresses();
        Navigator.pop(context);
        rajaOngkirProvider.resetData();
      } else {
        MySnackBar.failed(
          context,
          message: 'Gagal Menghapus Alamat',
        );
      }
      Navigator.pop(context);
      addressProvider.isAlertLoading = false;
    }

    return Consumer<AddressProvider>(
      builder: (context, addressProvider, _) => addressProvider.isAlertLoading
          ? MyCircularIndicator.show()
          : MyAlertDialog(
              text: 'Delete Address?',
              onYesTapped: handleDelete,
            ),
    );
  }
}
