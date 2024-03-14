import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/pages/widgets/my_button.dart';
import 'package:shoe_store_app/providers/address_category_provider.dart';
import 'package:shoe_store_app/shared/theme.dart';

class LabelField extends StatelessWidget {
  const LabelField({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
                          categoryProvider.categorySelected == indexTemp
                              ? primaryColor
                              : subtitleTextColor,
                      buttonColor:
                          categoryProvider.categorySelected == indexTemp
                              ? primaryColor
                              : Colors.transparent,
                      fontColor: categoryProvider.categorySelected == indexTemp
                          ? whiteColor
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
    );
  }
}
