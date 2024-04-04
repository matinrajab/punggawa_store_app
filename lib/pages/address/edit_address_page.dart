import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/models/address_model.dart';
import 'package:shoe_store_app/models/category_model.dart';
import 'package:shoe_store_app/models/city_api_model.dart';
import 'package:shoe_store_app/models/city_model.dart';
import 'package:shoe_store_app/models/province_api_model.dart';
import 'package:shoe_store_app/models/province_model.dart';
import 'package:shoe_store_app/pages/address/widgets/address_field.dart';
import 'package:shoe_store_app/pages/address/widgets/contact_field.dart';
import 'package:shoe_store_app/pages/address/widgets/delete_address_alert_dialog.dart';
import 'package:shoe_store_app/pages/address/widgets/label_field.dart';
import 'package:shoe_store_app/pages/widgets/my_app_bar.dart';
import 'package:shoe_store_app/pages/widgets/my_button.dart';
import 'package:shoe_store_app/pages/widgets/my_circular_indicator.dart';
import 'package:shoe_store_app/pages/widgets/my_snack_bar.dart';
import 'package:shoe_store_app/providers/raja_ongkir_provider.dart';
import 'package:shoe_store_app/providers/address_category_provider.dart';
import 'package:shoe_store_app/providers/address_provider.dart';
import 'package:shoe_store_app/shared/theme.dart';

class EditAddressPage extends StatelessWidget {
  static const routeName = '/edit-address';

  EditAddressPage({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    RajaOngkirProvider rajaOngkirProvider =
        Provider.of<RajaOngkirProvider>(context, listen: false);
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

    rajaOngkirProvider.province.province = address.province!.name;
    rajaOngkirProvider.province.provinceId = address.province!.provinceId;
    rajaOngkirProvider.city.type = address.city!.cityType!.name;
    rajaOngkirProvider.city.cityName = address.city!.name;
    rajaOngkirProvider.city.cityId = address.city!.cityId;

    rajaOngkirProvider.getCities();

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

      ProvinceApiModel province = rajaOngkirProvider.province;
      CityApiModel city = rajaOngkirProvider.city;

      addressProvider.isButtonLoading = true;
      if (await addressProvider.updateAddress(
        address: AddressModel(
          id: address.id,
          name: fullNameController.text,
          phone: phoneController.text,
          province: ProvinceModel(
            name: province.province,
            provinceId: province.provinceId,
          ),
          city: CityModel(
            cityType: city.type == "Kabupaten"
                ? CategoryModel(id: 1, name: "Kabupaten")
                : CategoryModel(id: 2, name: "Kota"),
            name: city.cityName,
            cityId: city.cityId,
          ),
          detail: detailController.text,
          additional: additionalController.text,
          addressCategory:
              categoryProvider.categories[categoryProvider.categorySelected],
        ),
      )) {
        await addressProvider.getAddresses();
        Navigator.pop(context);
        rajaOngkirProvider.resetData();
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
        rajaOngkirProvider.isRequiredAppear = false;
        rajaOngkirProvider.resetData();
      },
      child: Scaffold(
        backgroundColor: backgroundColor1,
        appBar: MyAppBar(
          text: 'Edit Address',
          leadingIcon: backIcon,
          onLeadingPressed: () {
            Navigator.pop(context);
            rajaOngkirProvider.isRequiredAppear = false;
            rajaOngkirProvider.resetData();
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
                builder: (context, addressProvider, _) => addressProvider
                        .isButtonLoading
                    ? MyCircularIndicator.show()
                    : MyButton(
                        text: 'Submit',
                        onTap: () {
                          rajaOngkirProvider.isRequiredAppear =
                              rajaOngkirProvider.province.provinceId == null;
                          if (_formKey.currentState!.validate() &&
                              !rajaOngkirProvider.isRequiredAppear) {
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
