import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/models/region_api_model.dart';
import 'package:shoe_store_app/pages/address/select_region_page.dart';
import 'package:shoe_store_app/pages/widgets/my_text_field.dart';
import 'package:shoe_store_app/providers/region_api_provider.dart';
import 'package:shoe_store_app/shared/theme.dart';

class AddressField extends StatelessWidget {
  final TextEditingController detailController;
  final TextEditingController additionalController;

  const AddressField({
    super.key,
    required this.detailController,
    required this.additionalController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                                style:
                                    secondaryTextStyle.copyWith(fontSize: 14),
                                overflow: TextOverflow.ellipsis,
                              )
                            : Text(
                                '${province.text}\n${city.text}\n${district.text}\n${postalCode.text}',
                                style: primaryTextStyle.copyWith(fontSize: 14),
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
      ],
    );
  }
}
