import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoe_store_app/models/cart_model.dart';
import 'package:shoe_store_app/models/payment_method_model.dart';
import 'package:shoe_store_app/models/transaction_model.dart';
import 'package:shoe_store_app/shared/api_url.dart';
import 'package:shoe_store_app/shared/order_status.dart';

class TransactionService {
  checkout({
    required String token,
    required List<CartModel> carts,
    required String address,
    required double totalPrice,
    required PaymentMethodModel paymentMethod,
  }) async {
    var url = checkoutUrl;
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    var body = jsonEncode({
      'address': address,
      'items': carts
          .map(
            (cart) => {
              'id': cart.product!.id,
              'quantity': cart.quantity,
            },
          )
          .toList(),
      'status': paymentMethod.name == 'Transfer' ? pendingOrder : shippingOrder,
      'total_price': totalPrice,
      'shipping_price': 0,
      'payment_method_id': paymentMethod.id,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      if(paymentMethod.name == 'Transfer'){
        var data = jsonDecode(response.body)['data'];
        String snapToken = data['snapToken'];
        return snapToken;
      }
    } else {
      throw Exception('Pesanan gagal dibuat');
    }
  }

  Future<String> topUp({
    required int amount,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    var url = topUpUrl;
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token!,
    };
    var body = jsonEncode({
      'amount': amount,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      String snapToken = data['snapToken'];

      return snapToken;
    } else {
      throw Exception('Pesanan gagal dibuat');
    }
  }

  Future<List<TransactionModel>> getTransactions() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    var url = transactionsUrl;
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token!,
    };

    var response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      List<TransactionModel> transactions = [];
      data
          .map((transaction) =>
              transactions.add(TransactionModel.fromJson(transaction)))
          .toList();

      return transactions;
    } else {
      throw Exception('Gagal Get Transactions!');
    }
  }
}
