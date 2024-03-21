import 'package:flutter/material.dart';
import 'package:shoe_store_app/models/cart_model.dart';
import 'package:shoe_store_app/models/product_model.dart';

class CartProvider with ChangeNotifier {
  List<CartModel> _carts = [];
  List<CartModel> _cartSelected = [];
  late CartModel _cartTemp;

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

  CartModel get cartTemp => _cartTemp;
  set cartTemp(CartModel cartTemp) {
    _cartTemp = cartTemp;
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

  addCart() {
    int index = findIndex(_cartTemp.product!);
    if (index >= 0) {
      _carts[index].quantity += _cartTemp.quantity;
    } else {
      _carts.add(_cartTemp);
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

  selectAll() {
    _cartSelected.clear();
    _cartSelected.addAll(_carts);
    notifyListeners();
  }

  unselectAll() {
    _cartSelected.clear();
    notifyListeners();
  }

  onCheckout() {
    for (var element in _cartSelected) {
      _carts.remove(element);
    }
    _cartSelected.clear();
  }
}
