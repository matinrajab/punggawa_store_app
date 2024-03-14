import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/models/region_api_model.dart';
import 'package:shoe_store_app/models/address_model.dart';
import 'package:shoe_store_app/models/region_model.dart';
import 'package:shoe_store_app/pages/address/widgets/address_field.dart';
import 'package:shoe_store_app/pages/address/widgets/contact_field.dart';
import 'package:shoe_store_app/pages/address/widgets/label_field.dart';
import 'package:shoe_store_app/pages/widgets/my_app_bar.dart';
import 'package:shoe_store_app/pages/widgets/my_button.dart';
import 'package:shoe_store_app/pages/widgets/my_circular_indicator.dart';
import 'package:shoe_store_app/pages/widgets/my_snack_bar.dart';
import 'package:shoe_store_app/providers/address_category_provider.dart';
import 'package:shoe_store_app/providers/region_api_provider.dart';
import 'package:shoe_store_app/providers/address_provider.dart';
import 'package:shoe_store_app/shared/theme.dart';

class AddAddressPage extends StatelessWidget {
  static const routeName = '/add-address';

  AddAddressPage({super.key});

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _detailController = TextEditingController();
  final TextEditingController _additionalController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    RegionApiProvider regionApiProvider =
        Provider.of<RegionApiProvider>(context, listen: false);
    AddressCategoryProvider addressCategoryProvider =
        Provider.of<AddressCategoryProvider>(context, listen: false);

    handleSubmit() async {
      AddressProvider addressProvider =
          Provider.of<AddressProvider>(context, listen: false);

      RegionApiModel province = regionApiProvider.province;
      RegionApiModel city = regionApiProvider.city;
      RegionApiModel district = regionApiProvider.district;
      RegionApiModel postalCode = regionApiProvider.postalCode;

      addressProvider.isButtonLoading = true;
      if (await addressProvider.storeAddress(
        address: AddressModel(
          name: _fullNameController.text,
          phone: _phoneController.text,
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
          detail: _detailController.text,
          additional: _additionalController.text,
          addressCategory: addressCategoryProvider
              .categories[addressCategoryProvider.categorySelected],
        ),
      )) {
        await addressProvider.getAddresses();
        Navigator.pop(context);
        regionApiProvider.resetData();
      } else {
        MySnackBar.failed(
          context,
          message: 'Gagal Menambahkan Alamat',
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
        backgroundColor: backgroundColor1,
        appBar: MyAppBar(
          text: 'New Address',
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
                fullNameController: _fullNameController,
                phoneController: _phoneController,
              ),
              const SizedBox(
                height: 30,
              ),
              AddressField(
                detailController: _detailController,
                additionalController: _additionalController,
              ),
              const SizedBox(
                height: 30,
              ),
              const LabelField(),
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
