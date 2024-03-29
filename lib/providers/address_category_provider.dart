import 'package:flutter/material.dart';
import 'package:shoe_store_app/models/category_model.dart';
import 'package:shoe_store_app/services/category_service.dart';
import 'package:shoe_store_app/shared/api_url.dart';

class AddressCategoryProvider with ChangeNotifier {
  List<CategoryModel> _categories = [];
  int _categorySelected = 0;

  List<CategoryModel> get categories => _categories;
  set categories(List<CategoryModel> categories) {
    _categories = categories;
    notifyListeners();
  }

  int get categorySelected => _categorySelected;
  set categorySelected(int categorySelected) {
    _categorySelected = categorySelected;
    notifyListeners();
  }

  Future<void> getCategories() async {
    try {
      List<CategoryModel> categories =
          await CategoryService().getCategories(addressCategoriesUrl);

      _categories = categories;
    } catch (e) {
      print(e);
    }
  }

  int findIndex(int id) {
    for (int i = 0; i < _categories.length; i++) {
      if (_categories[i].id == id) {
        return i;
      }
    }
    return -1;
  }
}
