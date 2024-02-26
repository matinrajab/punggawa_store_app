import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:shoe_store_app/providers/auth_provider.dart';
import 'package:shoe_store_app/providers/cart_provider.dart';
import 'package:shoe_store_app/providers/category_provider.dart';
import 'package:shoe_store_app/providers/gallery_provider.dart';
import 'package:shoe_store_app/providers/page_provider.dart';
import 'package:shoe_store_app/providers/payment_method_provider.dart';
import 'package:shoe_store_app/providers/product_provider.dart';
import 'package:shoe_store_app/providers/transaction_provider.dart';
import 'package:shoe_store_app/providers/wishlist_provider.dart';

final List<SingleChildWidget> providers = [
  ChangeNotifierProvider(
    create: (context) => AuthProvider(),
  ),
  ChangeNotifierProvider(
    create: (context) => ProductProvider(),
  ),
  ChangeNotifierProvider(
    create: (context) => CategoryProvider(),
  ),
  ChangeNotifierProvider(
    create: (context) => GalleryProvider(),
  ),
  ChangeNotifierProvider(
    create: (context) => WishlistProvider(),
  ),
  ChangeNotifierProvider(
    create: (context) => CartProvider(),
  ),
  ChangeNotifierProvider(
    create: (context) => PaymentMethodProvider(),
  ),
  ChangeNotifierProvider(
    create: (context) => TransactionProvider(),
  ),
  ChangeNotifierProvider(
    create: (context) => PageProvider(),
  ),
];
