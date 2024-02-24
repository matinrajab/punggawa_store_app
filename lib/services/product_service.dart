import 'dart:convert';
import 'package:shoe_store_app/config/config.dart';
import 'package:shoe_store_app/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductService {
  final String baseUrl = Config.baseUrl;

  Future<List<ProductModel>> getProducts() async {
    var url = '$baseUrl/products';
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      List<ProductModel> products = [];
      data.map((product) => products.add(ProductModel.fromJson(product))).toList();

      return products;
    } else {
      throw Exception('Gagal Get Products!');
    }
  }
}
