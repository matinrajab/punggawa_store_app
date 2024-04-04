import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/models/city_api_model.dart';
import 'package:shoe_store_app/models/province_api_model.dart';
import 'package:shoe_store_app/pages/widgets/my_app_bar.dart';
import 'package:shoe_store_app/pages/widgets/my_circular_indicator.dart';
import 'package:shoe_store_app/providers/raja_ongkir_provider.dart';
import 'package:shoe_store_app/shared/theme.dart';

class SelectRegionPage extends StatelessWidget {
  static const routeName = '/select-region';

  const SelectRegionPage({super.key});

  @override
  Widget build(BuildContext context) {
    RajaOngkirProvider rajaOngkirProvider =
        Provider.of<RajaOngkirProvider>(context, listen: false);
    ProvinceApiModel province = rajaOngkirProvider.province;
    CityApiModel city = rajaOngkirProvider.city;
    List<ProvinceApiModel> provinces = rajaOngkirProvider.provinces;

    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) {
        if (didPop) {
          return;
        }
        if (city.cityId == null) {
          rajaOngkirProvider.resetData();
        }
        Navigator.pop(context);
      },
      child: Scaffold(
        backgroundColor: backgroundColor1,
        appBar: MyAppBar(
          text: 'Select Region',
          leadingIcon: backIcon,
          onLeadingPressed: () {
            if (city.cityId == null) {
              rajaOngkirProvider.resetData();
            }
            Navigator.pop(context);
          },
        ),
        body: Padding(
          padding: const EdgeInsets.all(pagePadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownSearch<String>(
                popupProps: PopupProps.menu(
                  showSelectedItems: true,
                ),
                items: provinces.map((e) => e.province!).toList(),
                dropdownDecoratorProps: DropDownDecoratorProps(
                  baseStyle: TextStyle(color: primaryTextColor),
                  dropdownSearchDecoration: InputDecoration(
                    labelText: "Province",
                    labelStyle: TextStyle(color: primaryTextColor),
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: generalBorderRadius,
                      borderSide: BorderSide(color: secondaryTextColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: generalBorderRadius,
                      borderSide: BorderSide(color: primaryColor),
                    ),
                  ),
                ),
                onChanged: (value) async {
                  rajaOngkirProvider.isCitiesLoading = true;
                  city = CityApiModel();
                  rajaOngkirProvider.setProvince(value!);
                  await rajaOngkirProvider.getCities();
                  rajaOngkirProvider.isCitiesLoading = false;
                },
                selectedItem: province.province ?? "Select Province",
              ),
              const SizedBox(
                height: 30,
              ),
              Consumer<RajaOngkirProvider>(
                builder: (context, rajaOngkirProvider, _) {
                  List<CityApiModel> cities = rajaOngkirProvider.cities;
                  if (rajaOngkirProvider.isCitiesLoading) {
                    return MyCircularIndicator.show();
                  } else if (cities.isEmpty) {
                    return const SizedBox();
                  } else {
                    return DropdownSearch<String>(
                      popupProps: PopupProps.menu(
                        showSelectedItems: true,
                      ),
                      items:
                          cities.map((e) => "${e.type} ${e.cityName}").toList(),
                      dropdownDecoratorProps: DropDownDecoratorProps(
                        baseStyle: TextStyle(color: primaryTextColor),
                        dropdownSearchDecoration: InputDecoration(
                          labelText: "City",
                          labelStyle: TextStyle(color: primaryTextColor),
                          contentPadding: EdgeInsets.symmetric(horizontal: 20),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: generalBorderRadius,
                            borderSide: BorderSide(color: secondaryTextColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: generalBorderRadius,
                            borderSide: BorderSide(color: primaryColor),
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        String type = '';
                        String cityName = '';
                        if (value!.contains('Kabupaten')) {
                          type = 'Kabupaten';
                          cityName = value.substring(10);
                        } else if (value.contains('Kota')) {
                          type = 'Kota';
                          cityName = value.substring(5);
                        }
                        rajaOngkirProvider.setCity(type, cityName);
                        Navigator.pop(context);
                      },
                      selectedItem: city.cityId == null
                          ? "Select City"
                          : "${city.type} ${city.cityName}",
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
