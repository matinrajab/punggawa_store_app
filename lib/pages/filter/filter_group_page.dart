import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/models/filter_model.dart';
import 'package:shoe_store_app/pages/widgets/my_app_bar.dart';
import 'package:shoe_store_app/providers/filter_provider.dart';
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
                    selectedItem: filterProvider.logicGroupSelected[order-1],
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
                      filterProvider.setLogicGroupSelected(order-1, value!);
                    },
                  ),
                  for(int i = 0; i < filterProvider.filterGroup[order-1].length; i++)
                    filterBuild(context, filterProvider.textController[order-1][i], i+1)
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
              filterProvider.addFilterInGroup(order-1);
            },
          ),
        ],
      ),
    );
  }

  Widget textFormBuild(context, textController, int idx1, int idx2) {
    FilterProvider filterProvider =
    Provider.of<FilterProvider>(context, listen: false);

    return TextFormField(
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
          selectedItem: filterProvider.filterGroup[order-1][idx-1].section,
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
            filterProvider.setSectionFilterInGroup(order-1, idx-1, value!);
          },
        ),
        DropdownSearch<String>(
          popupProps: PopupProps.menu(
            showSelectedItems: true,
          ),
          items: filterProvider.filterOptions[filterProvider.filterGroup[order-1][idx-1].section]!.toList(),
          selectedItem: filterProvider.filterGroup[order-1][idx-1].operation,
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
            filterProvider.setOperationFilterInGroup(order-1, idx-1, value!);
          },
        ),
        textFormBuild(context, textController, order-1, idx-1),
      ],
    );
  }
}
