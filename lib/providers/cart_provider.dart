import 'package:flutter/material.dart';
import 'package:shoe_store_app/models/cart_model.dart';
import 'package:shoe_store_app/models/product_model.dart';

class CartProvider with ChangeNotifier {
  List<CartModel> _carts = [];
  List<CartModel> _cartSelected = [];

  List<CartModel> get carts => _carts;
  set carts(List<CartModel> carts) {
    _carts = carts;
    notifyListeners();
  }

  List<CartModel> get cartSelected => _cartSelected;
  set cartSelected(List<CartModel> cartSelected) {
    _cartSelected = cartSelected;
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
    notifyListeners();
  }

  removeCart(CartModel cart) {
    _carts.remove(cart);
    notifyListeners();
  }

  select(CartModel product) {
    _cartSelected.add(product);
    notifyListeners();
  }

  unselect(CartModel product) {
    _cartSelected.remove(product);
    notifyListeners();
  }

  onCheckout() {
    for (var element in _cartSelected) {
      _carts.remove(element);
    }
    _cartSelected.clear();
  }
}
