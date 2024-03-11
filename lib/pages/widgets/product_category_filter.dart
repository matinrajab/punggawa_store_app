import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/models/category_model.dart';
import 'package:shoe_store_app/pages/widgets/my_button.dart';
import 'package:shoe_store_app/providers/product_category_provider.dart';
import 'package:shoe_store_app/shared/theme.dart';

class ProductCategoryFilter extends StatelessWidget {
  const ProductCategoryFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Consumer<ProductCategoryProvider>(
        builder: (context, categoryProvider, _) {
          List<CategoryModel> categories = categoryProvider.categories;

          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (BuildContext context, int index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: MyButton(
                text: categories[index].name!,
                onTap: () {
                  categoryProvider.categorySelected = index;
                },
                borderColor: index == categoryProvider.categorySelected
                    ? primaryColor
                    : subtitleTextColor,
                buttonColor: index == categoryProvider.categorySelected
                    ? primaryColor
                    : Colors.transparent,
                fontSize: 13,
                fontWeight:
                    index == categoryProvider.categorySelected ? medium : light,
                fontColor: index == categoryProvider.categorySelected
                    ? primaryTextColor
                    : subtitleTextColor,
              ),
            ),
          );
        },
      ),
    );
  }
}
