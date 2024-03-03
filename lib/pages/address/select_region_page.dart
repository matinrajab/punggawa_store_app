import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/models/address_api_model.dart';
import 'package:shoe_store_app/pages/widgets/my_app_bar.dart';
import 'package:shoe_store_app/providers/address_api_provider.dart';
import 'package:shoe_store_app/shared/theme.dart';

class SelectRegionPage extends StatelessWidget {
  static const routeName = '/select-region';

  const SelectRegionPage({super.key});

  @override
  Widget build(BuildContext context) {
    AddressApiProvider addressApiProvider =
        Provider.of<AddressApiProvider>(context, listen: false);
    AddressApiModel province = addressApiProvider.province;
    AddressApiModel city = addressApiProvider.city;
    AddressApiModel district = addressApiProvider.district;
    AddressApiModel postalCode = addressApiProvider.postalCode;

    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) {
        if (didPop) {
          return;
        }
        if (postalCode.text == '') {
          addressApiProvider.resetData();
        }
        Navigator.pop(context);
      },
      child: Scaffold(
        backgroundColor: backgroundColor3,
        appBar: MyAppBar(
          text: 'Select Region',
          leadingIcon: backIcon,
          onLeadingPressed: () {
            if (postalCode.text == '') {
              addressApiProvider.resetData();
            }
            Navigator.pop(context);
          },
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(
              pagePadding, pagePadding, pagePadding, 0),
          child: Consumer<AddressApiProvider>(
            builder: (context, addressApiProvider, _) {
              List<AddressApiModel> regions = addressApiProvider.regions;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Region Selected',
                        style: secondaryTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: light,
                        ),
                      ),
                      province.text == ''
                          ? const SizedBox()
                          : GestureDetector(
                              onTap: () async {
                                await addressApiProvider
                                    .getAddress('provinsi/get/');
                                addressApiProvider.resetData();
                              },
                              child: Text(
                                'Reset',
                                style: alertTextStyle.copyWith(
                                  fontSize: 12,
                                  fontWeight: light,
                                ),
                              ),
                            ),
                    ],
                  ),
                  Column(
                    children: [
                      province.text == ''
                          ? ListTile(
                              tileColor: backgroundColor4,
                              title: Text(
                                'Select Province',
                                style: buttonTextStyle,
                              ),
                            )
                          : ListTile(
                              title: Text(
                                province.text!,
                                style: primaryTextStyle,
                              ),
                            ),
                      province.text == ''
                          ? const SizedBox()
                          : city.text == ''
                              ? ListTile(
                                  tileColor: backgroundColor4,
                                  title: Text(
                                    'Select City',
                                    style: buttonTextStyle,
                                  ),
                                )
                              : ListTile(
                                  title: Text(
                                    city.text!,
                                    style: primaryTextStyle,
                                  ),
                                ),
                      city.text == ''
                          ? const SizedBox()
                          : district.text == ''
                              ? ListTile(
                                  tileColor: backgroundColor4,
                                  title: Text(
                                    'Select District',
                                    style: buttonTextStyle,
                                  ),
                                )
                              : ListTile(
                                  title: Text(
                                    district.text!,
                                    style: primaryTextStyle,
                                  ),
                                ),
                      district.text == ''
                          ? const SizedBox()
                          : postalCode.text == ''
                              ? ListTile(
                                  tileColor: backgroundColor4,
                                  title: Text(
                                    'Select Postal Code',
                                    style: buttonTextStyle,
                                  ),
                                )
                              : ListTile(
                                  title: Text(
                                    postalCode.text!,
                                    style: primaryTextStyle,
                                  ),
                                ),
                    ],
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    addressApiProvider.nowSelected,
                    style: secondaryTextStyle,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Expanded(
                    child: ListView.builder(
                      key: regions.isNotEmpty ? ObjectKey(regions[0]) : null,
                      itemCount: regions.length,
                      itemBuilder: (BuildContext context, int index) {
                        final AddressApiModel region = regions[index];
                        return ListTile(
                          onTap: () async {
                            if (province.text == '') {
                              province.id = region.id!;
                              province.text = region.text!;
                              await addressApiProvider.getAddress(
                                  'kabkota/get/?d_provinsi_id=${province.id}');
                              addressApiProvider.nowSelected = 'City';
                            } else if (city.text == '') {
                              city.id = region.id!;
                              city.text = region.text!;
                              await addressApiProvider.getAddress(
                                  'kecamatan/get/?d_kabkota_id=${city.id}');
                              addressApiProvider.nowSelected = 'District';
                            } else if (district.text == '') {
                              district.id = region.id!;
                              district.text = region.text!;
                              await addressApiProvider.getAddress(
                                  'kodepos/get/?d_kabkota_id=${city.id}&d_kecamatan_id=${district.id}');
                              addressApiProvider.nowSelected = 'Postal Code';
                            } else {
                              postalCode.id = region.id!;
                              postalCode.text = region.text!;
                              addressApiProvider.notify();
                              Navigator.pop(context);
                            }
                          },
                          title: Text(
                            '${region.text}',
                            style: primaryTextStyle,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
