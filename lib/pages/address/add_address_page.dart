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
import 'package:shoe_store_app/pages/address/widgets/label_field.dart';
import 'package:shoe_store_app/pages/widgets/my_app_bar.dart';
import 'package:shoe_store_app/pages/widgets/my_button.dart';
import 'package:shoe_store_app/pages/widgets/my_circular_indicator.dart';
import 'package:shoe_store_app/pages/widgets/my_snack_bar.dart';
import 'package:shoe_store_app/providers/address_category_provider.dart';
import 'package:shoe_store_app/providers/address_provider.dart';
import 'package:shoe_store_app/providers/checkout_provider.dart';
import 'package:shoe_store_app/providers/raja_ongkir_provider.dart';
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
    RajaOngkirProvider rajaOngkirProvider =
        Provider.of<RajaOngkirProvider>(context, listen: false);
    AddressCategoryProvider addressCategoryProvider =
        Provider.of<AddressCategoryProvider>(context, listen: false);
    AddressProvider addressProvider =
        Provider.of<AddressProvider>(context, listen: false);
    CheckoutProvider checkoutProvider =
        Provider.of<CheckoutProvider>(context, listen: false);

    handleSubmit() async {
      ProvinceApiModel province = rajaOngkirProvider.province;
      CityApiModel city = rajaOngkirProvider.city;

      addressProvider.isButtonLoading = true;
      if (await addressProvider.storeAddress(
        address: AddressModel(
          name: _fullNameController.text,
          phone: _phoneController.text,
          province: ProvinceModel(
            provinceId: province.provinceId,
            name: province.province,
          ),
          city: CityModel(
            cityType: city.type == "Kabupaten"
                ? CategoryModel(id: 1, name: "Kabupaten")
                : CategoryModel(id: 2, name: "Kota"),
            name: city.cityName,
            cityId: city.cityId,
          ),
          detail: _detailController.text,
          additional: _additionalController.text,
          addressCategory: addressCategoryProvider
              .categories[addressCategoryProvider.categorySelected],
        ),
      )) {
        await addressProvider.getAddresses();
        List<AddressModel> addresses = addressProvider.addresses;
        AddressModel address = addresses[0];

        await checkoutProvider.getShippingPrice(address.city!.cityId!);
        Navigator.pop(context);
        rajaOngkirProvider.resetData();
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
        rajaOngkirProvider.isRequiredAppear = false;
        rajaOngkirProvider.resetData();
      },
      child: Scaffold(
        backgroundColor: backgroundColor1,
        appBar: MyAppBar(
          text: 'New Address',
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
