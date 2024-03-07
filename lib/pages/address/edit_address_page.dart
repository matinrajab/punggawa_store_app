import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/models/region_api_model.dart';
import 'package:shoe_store_app/models/address_model.dart';
import 'package:shoe_store_app/models/region_model.dart';
import 'package:shoe_store_app/pages/address/widgets/address_field.dart';
import 'package:shoe_store_app/pages/address/widgets/contact_field.dart';
import 'package:shoe_store_app/pages/address/widgets/delete_address_alert_dialog.dart';
import 'package:shoe_store_app/pages/address/widgets/label_field.dart';
import 'package:shoe_store_app/pages/widgets/my_app_bar.dart';
import 'package:shoe_store_app/pages/widgets/my_button.dart';
import 'package:shoe_store_app/pages/widgets/my_circular_indicator.dart';
import 'package:shoe_store_app/pages/widgets/my_snack_bar.dart';
import 'package:shoe_store_app/providers/region_api_provider.dart';
import 'package:shoe_store_app/providers/address_category_provider.dart';
import 'package:shoe_store_app/providers/address_provider.dart';
import 'package:shoe_store_app/shared/theme.dart';

class EditAddressPage extends StatelessWidget {
  static const routeName = '/edit-address';

  EditAddressPage({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    RegionApiProvider regionApiProvider =
        Provider.of<RegionApiProvider>(context, listen: false);
    AddressCategoryProvider categoryProvider =
        Provider.of<AddressCategoryProvider>(context, listen: false);
    AddressProvider addressProvider =
        Provider.of<AddressProvider>(context, listen: false);

    AddressModel address =
        addressProvider.addresses[addressProvider.addressSelectedToEdit];

    final TextEditingController fullNameController =
        TextEditingController(text: address.name);
    final TextEditingController phoneController =
        TextEditingController(text: address.phone);
    final TextEditingController detailController =
        TextEditingController(text: address.detail);
    final TextEditingController additionalController =
        TextEditingController(text: address.additional);

    regionApiProvider.province.text = address.province!.name;
    regionApiProvider.province.id = address.province!.idFromApi;
    regionApiProvider.city.text = address.city!.name;
    regionApiProvider.city.id = address.city!.idFromApi;
    regionApiProvider.district.text = address.district!.name;
    regionApiProvider.district.id = address.district!.idFromApi;
    regionApiProvider.postalCode.text = address.postalCode!.name;
    regionApiProvider.postalCode.id = address.postalCode!.idFromApi;

    categoryProvider.categorySelected =
        categoryProvider.findIndex(address.addressCategory!.id!);

    onDeleteTapped() async {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) =>
            DeleteAddressAlertDialog(id: address.id!),
      );
    }

    handleSubmit() async {
      AddressProvider addressProvider =
          Provider.of<AddressProvider>(context, listen: false);

      RegionApiModel province = regionApiProvider.province;
      RegionApiModel city = regionApiProvider.city;
      RegionApiModel district = regionApiProvider.district;
      RegionApiModel postalCode = regionApiProvider.postalCode;

      addressProvider.isButtonLoading = true;
      if (await addressProvider.updateAddress(
        address: AddressModel(
          id: address.id,
          name: fullNameController.text,
          phone: phoneController.text,
          province: RegionModel(
            name: province.text,
            idFromApi: province.id,
          ),
          city: RegionModel(
            name: city.text,
            idFromApi: city.id,
          ),
          district: RegionModel(
            name: district.text,
            idFromApi: district.id,
          ),
          postalCode: RegionModel(
            name: postalCode.text,
            idFromApi: postalCode.id,
          ),
          detail: detailController.text,
          additional: additionalController.text,
          addressCategory:
              categoryProvider.categories[categoryProvider.categorySelected],
        ),
      )) {
        await addressProvider.getAddresses();
        Navigator.pop(context);
        regionApiProvider.resetData();
      } else {
        MySnackBar.failed(
          context,
          message: 'Gagal Mengedit Alamat',
        );
      }
      addressProvider.isButtonLoading = false;
    }

    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) {
        if (didPop) {
          return;
        }
        Navigator.pop(context);
        regionApiProvider.isRequiredAppear = false;
        regionApiProvider.resetData();
      },
      child: Scaffold(
        backgroundColor: backgroundColor3,
        appBar: MyAppBar(
          text: 'Edit Address',
          leadingIcon: backIcon,
          onLeadingPressed: () {
            Navigator.pop(context);
            regionApiProvider.isRequiredAppear = false;
            regionApiProvider.resetData();
          },
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(pagePadding),
            children: [
              ContactField(
                fullNameController: fullNameController,
                phoneController: phoneController,
              ),
              const SizedBox(
                height: 30,
              ),
              AddressField(
                detailController: detailController,
                additionalController: additionalController,
              ),
              const SizedBox(
                height: 30,
              ),
              const LabelField(),
              const SizedBox(
                height: 30,
              ),
              MyButton(
                text: 'Delete Address',
                buttonColor: Colors.transparent,
                fontColor: primaryColor,
                onTap: onDeleteTapped,
              ),
              const SizedBox(
                height: 30,
              ),
              Consumer<AddressProvider>(
                builder: (context, addressProvider, _) =>
                    addressProvider.isButtonLoading
                        ? MyCircularIndicator.show()
                        : MyButton(
                            text: 'Submit',
                            onTap: () {
                              regionApiProvider.isRequiredAppear =
                                  regionApiProvider.province.text == '';
                              if (_formKey.currentState!.validate() &&
                                  !regionApiProvider.isRequiredAppear) {
                                handleSubmit();
                              }
                            },
                          ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
