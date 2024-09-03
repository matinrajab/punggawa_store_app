import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/pages/widgets/my_app_bar.dart';
import 'package:shoe_store_app/providers/filter_provider.dart';
import 'package:shoe_store_app/providers/product_category_provider.dart';
import 'package:shoe_store_app/shared/theme.dart';

class FilterGroupPage extends StatelessWidget {
  static const routeName = '/filter-group';

  final int order;

  FilterGroupPage({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    FilterProvider filterProvider =
        Provider.of<FilterProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: backgroundColor2,
      appBar: MyAppBar(
        text: 'Filter Group ${order}',
        leadingIcon: backIcon,
      ),
      body: ListView(
        children: [
          Consumer<FilterProvider>(
            builder: (context, filterProvider, _) {
              return Column(
                children: [
                  SizedBox(
                    height: 12,
                  ),
                  DropdownSearch<String>(
                    popupProps: PopupProps.menu(
                      showSelectedItems: true,
                    ),
                    items: filterProvider.logic,
                    selectedItem: filterProvider.logicGroupSelected[order - 1],
                    dropdownDecoratorProps: DropDownDecoratorProps(
                      baseStyle: TextStyle(color: primaryTextColor),
                      dropdownSearchDecoration: InputDecoration(
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
                      filterProvider.setLogicGroupSelected(order - 1, value!);
                    },
                  ),
                  for (int i = 0;
                      i < filterProvider.filterGroup[order - 1].length;
                      i++)
                    filterBuild(context,
                        filterProvider.textController[order - 1][i], i + 1)
                ],
              );
            },
          ),
          SizedBox(
            height: 12,
          ),
          ListTile(
            tileColor: backgroundColor1,
            leading: Icon(Icons.add),
            title: Text('Add filter rule'),
            shape: Border.symmetric(
                horizontal: BorderSide(color: unselectedColor)),
            onTap: () {
              filterProvider.addFilterInGroup(order - 1);
            },
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(context, textController, int idx1, int idx2) async {
    FilterProvider filterProvider =
      Provider.of<FilterProvider>(context, listen: false);

    DateTime? _picked = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      initialDate: DateTime.now(),
    );

    if(_picked != null){
      String value = _picked.toString().split(' ')[0];
      textController.text = value;
      filterProvider.setValueFilterInGroup(idx1, idx2, value);
    }
  }

  Widget buildInputValue(context, textController, int idx1, int idx2, String section) {
    FilterProvider filterProvider =
        Provider.of<FilterProvider>(context, listen: false);
    ProductCategoryProvider categoryProvider =
      Provider.of<ProductCategoryProvider>(context, listen: false);

    List<String> categories = categoryProvider.categories.map((category){
      return category.name!;
    }).toList();

    return section == 'Category' ? DropdownSearch<String>(
      popupProps: PopupProps.menu(
        showSelectedItems: true,
      ),
      items: categories,
      selectedItem: filterProvider.filterGroup[idx1][idx2].value,
      dropdownDecoratorProps: DropDownDecoratorProps(
        baseStyle: TextStyle(color: primaryTextColor),
        dropdownSearchDecoration: InputDecoration(
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
        filterProvider.setValueFilterInGroup(idx1, idx2, value!);
      },
    ) : TextFormField(
      controller: textController,
      onChanged: (value) {
        filterProvider.setValueFilterInGroup(idx1, idx2, value);
      },
      style: primaryTextStyle,
      cursorColor: primaryTextColor,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: unselectedColor),
          borderRadius: generalBorderRadius,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: unselectedColor),
          borderRadius: generalBorderRadius,
        ),
        filled: true,
        fillColor: Colors.transparent,
        hintText: 'Value',
        hintStyle: subtitleTextStyle,
      ),
      keyboardType: section == 'Price' ? TextInputType.number : TextInputType.text,
      readOnly: section == 'Create at',
      onTap: section == 'Create at' ? (){
        _selectDate(context, textController, idx1, idx2);
      } : (){},
    );
  }

  Widget filterBuild(context, TextEditingController textController, int idx) {
    FilterProvider filterProvider =
        Provider.of<FilterProvider>(context, listen: false);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 12,
        ),
        Text('Filter $idx'),
        DropdownSearch<String>(
          popupProps: PopupProps.menu(
            showSelectedItems: true,
          ),
          items: filterProvider.filterOptions.keys.toList(),
          selectedItem: filterProvider.filterGroup[order - 1][idx - 1].section,
          dropdownDecoratorProps: DropDownDecoratorProps(
            baseStyle: TextStyle(color: primaryTextColor),
            dropdownSearchDecoration: InputDecoration(
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
            filterProvider.setSectionFilterInGroup(order - 1, idx - 1, value!);
            filterProvider.setOperationFilterInGroup(order - 1, idx - 1, filterProvider.filterOptions[filterProvider.filterGroup[order - 1][idx - 1].section]![0]);
            filterProvider.setValueFilterInGroup(order - 1, idx - 1, '');
          },
        ),
        DropdownSearch<String>(
          popupProps: PopupProps.menu(
            showSelectedItems: true,
          ),
          items: filterProvider.filterOptions[
                  filterProvider.filterGroup[order - 1][idx - 1].section]!
              .toList(),
          selectedItem:
              filterProvider.filterGroup[order - 1][idx - 1].operation,
          dropdownDecoratorProps: DropDownDecoratorProps(
            baseStyle: TextStyle(color: primaryTextColor),
            dropdownSearchDecoration: InputDecoration(
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
            filterProvider.setOperationFilterInGroup(
                order - 1, idx - 1, value!);
          },
        ),
        buildInputValue(context, textController, order - 1, idx - 1, filterProvider.filterGroup[order - 1][idx - 1].section),
        SizedBox(height: 0,),
        ListTile(
          tileColor: backgroundColor1,
          leading: Icon(Icons.delete_outline_rounded),
          title: Text('Remove'),
          shape: Border.symmetric(
              horizontal: BorderSide(color: unselectedColor)),
          onTap: () {
            filterProvider.removeFilterRule(order - 1, idx - 1);
          },
        ),
        ListTile(
          tileColor: backgroundColor1,
          leading: Icon(Icons.copy),
          title: Text('Duplicate'),
          shape: Border.symmetric(
              horizontal: BorderSide(color: unselectedColor)),
          onTap: () {
            filterProvider.removeFilterRule(order - 1, idx - 1);
          },
        ),
      ],
    );
  }
}
