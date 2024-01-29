import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shoe_store_app/api/base_url.dart';
import 'package:shoe_store_app/models/cart_model.dart';

class TransactionService {
  Future checkout(
    String token,
    List<CartModel> carts,
    double totalPrice,
  ) async {
    var url = '${BaseUrl.baseUrl}/checkout';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    var body = jsonEncode({
      'address': 'Mexico Utara',
      'items': carts
          .map(
            (cart) => {
              'id': cart.product!.id,
              'quantity': cart.quantity,
            },
          )
          .toList(),
      'status': 'PENDING',
      'total_price': totalPrice,
      'shipping_price': 0,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Gagal Melakukan Checkout');
    }
  }
}
