import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/models/address_api_model.dart';
import 'package:shoe_store_app/models/address_model.dart';
import 'package:shoe_store_app/models/region_model.dart';
import 'package:shoe_store_app/pages/address/select_region_page.dart';
import 'package:shoe_store_app/pages/widgets/my_app_bar.dart';
import 'package:shoe_store_app/pages/widgets/my_button.dart';
import 'package:shoe_store_app/pages/widgets/my_circular_indicator.dart';
import 'package:shoe_store_app/pages/widgets/my_snack_bar.dart';
import 'package:shoe_store_app/pages/widgets/my_text_field.dart';
import 'package:shoe_store_app/providers/address_category_provider.dart';
import 'package:shoe_store_app/providers/address_api_provider.dart';
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
    AddressApiProvider addressApiProvider =
        Provider.of<AddressApiProvider>(context, listen: false);
    AddressProvider addressProvider =
        Provider.of<AddressProvider>(context, listen: false);
    AddressCategoryProvider addressCategoryProvider =
        Provider.of<AddressCategoryProvider>(context, listen: false);

    handleSubmit() async {
      AddressApiModel province = addressApiProvider.province;
      AddressApiModel city = addressApiProvider.city;
      AddressApiModel district = addressApiProvider.district;
      AddressApiModel postalCode = addressApiProvider.postalCode;

      addressProvider.isLoading = true;
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
        await Provider.of<AddressProvider>(context, listen: false)
            .getAddresses();
        Navigator.pop(context);
        addressApiProvider.resetData();
      } else {
        MySnackBar.showSnackBar(
          context: context,
          message: 'Gagal Menambahkan Alamat',
          isSuccess: false,
        );
      }
      addressProvider.isLoading = false;
    }

    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) {
        if (didPop) {
          return;
        }
        Navigator.pop(context);
        addressApiProvider.isNotFilled = false;
        addressApiProvider.resetData();
      },
      child: Scaffold(
        backgroundColor: backgroundColor3,
        appBar: MyAppBar(
          text: 'New Address',
          leadingIcon: backIcon,
          onLeadingPressed: () {
            Navigator.pop(context);
            addressApiProvider.isNotFilled = false;
            addressApiProvider.resetData();
          },
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(pagePadding),
            children: [
              Text(
                'Contact',
                style: primaryTextStyle.copyWith(
                  fontWeight: medium,
                ),
              ),
              MyTextField(
                controller: _fullNameController,
                hintText: 'Full Name',
                textValidator: 'Required',
              ),
              const SizedBox(
                height: 6,
              ),
              MyTextField(
                controller: _phoneController,
                hintText: 'Phone Number',
                textValidator: 'Required',
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Address',
                style: primaryTextStyle.copyWith(
                  fontWeight: medium,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Consumer<AddressApiProvider>(
                builder: (context, addressApiProvider, _) {
                  String province = addressApiProvider.province.text!;
                  String city = addressApiProvider.city.text!;
                  String district = addressApiProvider.district.text!;
                  String postalCode = addressApiProvider.postalCode.text!;

                  return GestureDetector(
                    onTap: () async {
                      if (province == '') {
                        await addressApiProvider.getAddress('provinsi/get/');
                      }
                      Navigator.pushNamed(context, SelectRegionPage.routeName);
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: province == ''
                                  ? Text(
                                      'Province, City, District, Postal Code',
                                      style: secondaryTextStyle.copyWith(
                                          fontSize: 14),
                                      overflow: TextOverflow.ellipsis,
                                    )
                                  : Text(
                                      '$province\n$city\n$district\n$postalCode',
                                      style: primaryTextStyle.copyWith(
                                          fontSize: 14),
                                    ),
                            ),
                            const Icon(
                              forwardIcon,
                              color: secondaryTextColor,
                              size: 18,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Divider(
                            color: addressApiProvider.isNotFilled
                                ? redColor
                                : secondaryTextColor),
                        addressApiProvider.isNotFilled
                            ? const Text(
                                'Required',
                                style: TextStyle(color: redColor, fontSize: 12),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  );
                },
              ),
              MyTextField(
                controller: _detailController,
                hintText: 'Street/Building Name, House No.',
                textValidator: 'Required',
              ),
              const SizedBox(
                height: 6,
              ),
              MyTextField(
                controller: _additionalController,
                hintText: 'Additional Info',
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Label As',
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                  Consumer<AddressCategoryProvider>(
                    builder: (context, categoryProvider, _) {
                      int index = 0;
                      return Row(
                        children: categoryProvider.categories.map(
                          (e) {
                            int indexTemp = index++;
                            return Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: MyButton(
                                text: e.name!,
                                height: 30,
                                fontSize: 13,
                                borderColor:
                                    categoryProvider.categorySelected ==
                                            indexTemp
                                        ? primaryColor
                                        : subtitleTextColor,
                                buttonColor:
                                    categoryProvider.categorySelected ==
                                            indexTemp
                                        ? primaryColor
                                        : Colors.transparent,
                                fontColor: categoryProvider.categorySelected ==
                                        indexTemp
                                    ? primaryTextColor
                                    : subtitleTextColor,
                                onTap: () {
                                  categoryProvider.categorySelected = indexTemp;
                                },
                              ),
                            );
                          },
                        ).toList(),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Consumer<AddressProvider>(
                builder: (context, addressProvider, _) =>
                    addressProvider.isLoading
                        ? MyCircularIndicator.show()
                        : MyButton(
                            text: 'Submit',
                            onTap: () {
                              addressApiProvider.isNotFilled =
                                  addressApiProvider.province.text == '';
                              if (_formKey.currentState!.validate() &&
                                  !addressApiProvider.isNotFilled) {
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
