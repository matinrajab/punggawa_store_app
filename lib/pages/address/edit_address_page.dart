import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/models/region_api_model.dart';
import 'package:shoe_store_app/models/address_model.dart';
import 'package:shoe_store_app/models/region_model.dart';
import 'package:shoe_store_app/pages/address/select_region_page.dart';
import 'package:shoe_store_app/pages/address/widgets/delete_address_alert_dialog.dart';
import 'package:shoe_store_app/pages/widgets/my_app_bar.dart';
import 'package:shoe_store_app/pages/widgets/my_button.dart';
import 'package:shoe_store_app/pages/widgets/my_circular_indicator.dart';
import 'package:shoe_store_app/pages/widgets/my_snack_bar.dart';
import 'package:shoe_store_app/pages/widgets/my_text_field.dart';
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
    print('build edit page');

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
        MySnackBar.showSnackBar(
          context: context,
          message: 'Gagal Mengedit Alamat',
          isSuccess: false,
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
              Text(
                'Contact',
                style: primaryTextStyle.copyWith(
                  fontWeight: medium,
                ),
              ),
              MyTextField(
                controller: fullNameController,
                hintText: 'Full Name',
                textValidator: 'Required',
              ),
              const SizedBox(
                height: 6,
              ),
              MyTextField(
                controller: phoneController,
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
              Consumer<RegionApiProvider>(
                builder: (context, regionApiProvider, _) {
                  RegionApiModel province = regionApiProvider.province;
                  RegionApiModel city = regionApiProvider.city;
                  RegionApiModel district = regionApiProvider.district;
                  RegionApiModel postalCode = regionApiProvider.postalCode;

                  return GestureDetector(
                    onTap: () async {
                      province.text == ''
                          ? await regionApiProvider.getAddress('provinsi/get/')
                          : await regionApiProvider.getAddress(
                              'kodepos/get/?d_kabkota_id=${city.id}&d_kecamatan_id=${district.id}');
                      Navigator.pushNamed(context, SelectRegionPage.routeName);
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: province.text == ''
                                  ? Text(
                                      'Province, City, District, Postal Code',
                                      style: secondaryTextStyle.copyWith(
                                          fontSize: 14),
                                      overflow: TextOverflow.ellipsis,
                                    )
                                  : Text(
                                      '${province.text}\n${city.text}\n${district.text}\n${postalCode.text}',
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
                            color: regionApiProvider.isRequiredAppear
                                ? redColor
                                : secondaryTextColor),
                        regionApiProvider.isRequiredAppear
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
                controller: detailController,
                hintText: 'Street/Building Name, House No.',
                textValidator: 'Required',
              ),
              const SizedBox(
                height: 6,
              ),
              MyTextField(
                controller: additionalController,
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
