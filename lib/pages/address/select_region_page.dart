import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/models/region_api_model.dart';
import 'package:shoe_store_app/pages/widgets/my_app_bar.dart';
import 'package:shoe_store_app/providers/region_api_provider.dart';
import 'package:shoe_store_app/shared/theme.dart';

class SelectRegionPage extends StatelessWidget {
  static const routeName = '/select-region';

  const SelectRegionPage({super.key});

  @override
  Widget build(BuildContext context) {
    RegionApiProvider regionApiProvider =
        Provider.of<RegionApiProvider>(context, listen: false);
    RegionApiModel province = regionApiProvider.province;
    RegionApiModel city = regionApiProvider.city;
    RegionApiModel district = regionApiProvider.district;
    RegionApiModel postalCode = regionApiProvider.postalCode;

    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) {
        if (didPop) {
          return;
        }
        if (postalCode.text == '') {
          regionApiProvider.resetData();
        }
        Navigator.pop(context);
      },
      child: Scaffold(
        backgroundColor: backgroundColor1,
        appBar: MyAppBar(
          text: 'Select Region',
          leadingIcon: backIcon,
          onLeadingPressed: () {
            if (postalCode.text == '') {
              regionApiProvider.resetData();
            }
            Navigator.pop(context);
          },
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(
              pagePadding, pagePadding, pagePadding, 0),
          child: Consumer<RegionApiProvider>(
            builder: (context, regionApiProvider, _) {
              List<RegionApiModel> regions = regionApiProvider.regions;

              if (province.text == '') {
                regionApiProvider.nowSelected = 'Province';
              } else if (city.text == '') {
                regionApiProvider.nowSelected = 'City';
              } else if (district.text == '') {
                regionApiProvider.nowSelected = 'District';
              } else {
                regionApiProvider.nowSelected = 'Postal Code';
              }

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
                                await regionApiProvider
                                    .getAddress('provinsi/get/');
                                regionApiProvider.resetData();
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
                              tileColor: backgroundColor2,
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
                                  tileColor: backgroundColor2,
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
                                  tileColor: backgroundColor2,
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
                                  tileColor: backgroundColor2,
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
                    regionApiProvider.nowSelected,
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
                        final RegionApiModel region = regions[index];
                        return ListTile(
                          onTap: () async {
                            if (province.text == '') {
                              province.id = region.id!;
                              province.text = region.text!;
                              await regionApiProvider.getAddress(
                                  'kabkota/get/?d_provinsi_id=${province.id}');
                            } else if (city.text == '') {
                              city.id = region.id!;
                              city.text = region.text!;
                              await regionApiProvider.getAddress(
                                  'kecamatan/get/?d_kabkota_id=${city.id}');
                            } else if (district.text == '') {
                              district.id = region.id!;
                              district.text = region.text!;
                              await regionApiProvider.getAddress(
                                  'kodepos/get/?d_kabkota_id=${city.id}&d_kecamatan_id=${district.id}');
                            } else {
                              postalCode.id = region.id!;
                              postalCode.text = region.text!;
                              regionApiProvider.notify();
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
