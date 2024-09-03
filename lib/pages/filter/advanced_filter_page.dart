import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/pages/filter/filter_group_page.dart';
import 'package:shoe_store_app/pages/widgets/my_app_bar.dart';
import 'package:shoe_store_app/providers/filter_provider.dart';
import 'package:shoe_store_app/shared/theme.dart';

class AdvancedFilterPage extends StatelessWidget {
  static const routeName = '/advanced-filter';

  const AdvancedFilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    FilterProvider filterProvider =
        Provider.of<FilterProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: backgroundColor2,
      appBar: MyAppBar(
        text: 'Advanced Filter',
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
                  filterProvider.filterGroup.length > 0
                      ? DropdownSearch<String>(
                          popupProps: PopupProps.menu(
                            showSelectedItems: true,
                          ),
                          items: filterProvider.logic,
                          selectedItem: filterProvider.logicSelected,
                          dropdownDecoratorProps: DropDownDecoratorProps(
                            baseStyle: TextStyle(color: primaryTextColor),
                            dropdownSearchDecoration: InputDecoration(
                              labelStyle: TextStyle(color: primaryTextColor),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 20),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: generalBorderRadius,
                                borderSide:
                                    BorderSide(color: secondaryTextColor),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: generalBorderRadius,
                                borderSide: BorderSide(color: primaryColor),
                              ),
                            ),
                          ),
                          onChanged: (value) {
                            filterProvider.logicSelected = value!;
                          },
                        )
                      : const SizedBox(),
                  for (int i = 0; i < filterProvider.filterGroup.length; i++)
                    filterGroupBuild(context, i),
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
            title: Text('Add filter group'),
            shape: Border.symmetric(
                horizontal: BorderSide(color: unselectedColor)),
            onTap: () {
              filterProvider.addFilterGroup();
            },
          ),
          SizedBox(
            height: 12,
          ),
          ListTile(
            tileColor: backgroundColor1,
            leading: Icon(Icons.delete_outline_rounded),
            title: Text('Delete filter'),
            shape: Border.symmetric(
                horizontal: BorderSide(color: unselectedColor)),
            onTap: () {
              filterProvider.clearFilterGroup();
            },
          ),
        ],
      ),
    );
  }

  Widget filterGroupBuild(context, int order) {
    FilterProvider filterProvider =
      Provider.of<FilterProvider>(context, listen: false);
    String groupTitle = '';
    String logic = filterProvider.logicGroupSelected[order];
    for(int i = 0; i < filterProvider.filterGroup[order].length; i++){
      final filterGroup = filterProvider.filterGroup[order][i];
      groupTitle += '${filterGroup.section} ${filterGroup.operation} ${filterGroup.value}';
      if(i != filterProvider.filterGroup[order].length - 1){
        groupTitle += ' $logic ';
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 12,
        ),
        Text('Filter Group ${order + 1}'),
        ListTile(
          tileColor: backgroundColor1,
          title: Text(groupTitle),
          trailing: Icon(Icons.arrow_forward_ios),
          shape:
              Border.symmetric(horizontal: BorderSide(color: unselectedColor)),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FilterGroupPage(
                order: order + 1,
              ),
            ),
          ),
        ),
        ListTile(
          tileColor: backgroundColor1,
          leading: Icon(Icons.delete_outline_rounded),
          title: Text('Remove'),
          shape: Border.symmetric(
              horizontal: BorderSide(color: unselectedColor)),
          onTap: () {
            filterProvider.removeFilterGroup(order);
          },
        ),
        ListTile(
          tileColor: backgroundColor1,
          leading: Icon(Icons.copy),
          title: Text('Duplicate'),
          shape: Border.symmetric(
              horizontal: BorderSide(color: unselectedColor)),
          onTap: () {
            filterProvider.duplicateFilterGroup(order);
          },
        ),
      ],
    );
  }
}
