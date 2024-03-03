import 'dart:convert';
import 'package:shoe_store_app/models/category_model.dart';
import 'package:http/http.dart' as http;

class CategoryService {
  Future<List<CategoryModel>> getCategories(String url) async {
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    print(response.body);

    if(response.statusCode == 200){
      List data = jsonDecode(response.body)['data'];
      List<CategoryModel> categories = [];
      data.map((category) => categories.add(CategoryModel.fromJson(category))).toList();

      return categories;
    }
    throw Exception('Gagal Get Categories!');
  }
}
