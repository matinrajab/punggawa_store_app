import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/models/city_api_model.dart';
import 'package:shoe_store_app/models/province_api_model.dart';
import 'package:shoe_store_app/pages/address/select_region_page.dart';
import 'package:shoe_store_app/pages/widgets/my_text_field.dart';
import 'package:shoe_store_app/providers/raja_ongkir_provider.dart';
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
        Consumer<RajaOngkirProvider>(
          builder: (context, rajaOngkirProvider, _) {
            ProvinceApiModel province = rajaOngkirProvider.province;
            CityApiModel city = rajaOngkirProvider.city;

            return GestureDetector(
              onTap: () =>
                  Navigator.pushNamed(context, SelectRegionPage.routeName),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: province.provinceId == null
                            ? Text(
                                'Province, City',
                                style:
                                    secondaryTextStyle.copyWith(fontSize: 14),
                                overflow: TextOverflow.ellipsis,
                              )
                            : Text(
                                '${province.province}\n${city.type} ${city.cityName}',
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
                      color: rajaOngkirProvider.isRequiredAppear
                          ? redColor
                          : secondaryTextColor),
                  rajaOngkirProvider.isRequiredAppear
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
          hintText: 'Address details',
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
