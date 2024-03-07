import 'package:flutter/material.dart';
import 'package:shoe_store_app/models/cart_model.dart';
import 'package:shoe_store_app/models/product_model.dart';

class CartProvider with ChangeNotifier {
  List<CartModel> _carts = [];

  List<CartModel> get carts => _carts;
  set carts(List<CartModel> casrts) {
    _carts = carts;
    notifyListeners();
  }

  int findIndex(ProductModel product) {
    for (int i = 0; i < _carts.length; i++) {
      if (_carts[i].product!.id == product.id) {
        return i;
      }
    }
    return -1;
  }

  addCart(ProductModel product) {
    int index = findIndex(product);
    if (index >= 0) {
      _carts[index].quantity++;
    } else {
      _carts.add(CartModel(
        product: product,
        quantity: 1,
      ));
    }
    notifyListeners();
  }

  addQuantity(CartModel cart) {
    cart.quantity++;
    notifyListeners();
  }

  minQuantity(CartModel cart) {
    cart.quantity--;
    if(cart.quantity == 0){
      _carts.remove(cart);
    }
    notifyListeners();
  }

  removeCart(CartModel cart) {
    _carts.remove(cart);
    notifyListeners();
  }

  totalItems(){
    int total = 0;
    for (var cart in _carts) {
      total += cart.quantity;
    }
    return total;
  }

  totalPrice(){
    double total = 0;
    for (var cart in _carts) {
      total += cart.quantity * cart.product!.price!;
    }
    return total;
  }
}
