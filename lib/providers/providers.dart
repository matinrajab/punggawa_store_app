import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:shoe_store_app/providers/checkout_provider.dart';
import 'package:shoe_store_app/providers/filter_provider.dart';
import 'package:shoe_store_app/providers/raja_ongkir_provider.dart';
import 'package:shoe_store_app/providers/address_category_provider.dart';
import 'package:shoe_store_app/providers/address_provider.dart';
import 'package:shoe_store_app/providers/auth_provider.dart';
import 'package:shoe_store_app/providers/cart_provider.dart';
import 'package:shoe_store_app/providers/product_category_provider.dart';
import 'package:shoe_store_app/providers/gallery_provider.dart';
import 'package:shoe_store_app/providers/page_provider.dart';
import 'package:shoe_store_app/providers/payment_method_provider.dart';
import 'package:shoe_store_app/providers/product_provider.dart';
import 'package:shoe_store_app/providers/top_up_provider.dart';
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
    create: (context) => ProductCategoryProvider(),
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
    create: (context) => CheckoutProvider(),
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
  ChangeNotifierProvider(
    create: (context) => AddressProvider(),
  ),
  ChangeNotifierProvider(
    create: (context) => AddressCategoryProvider(),
  ),
  ChangeNotifierProvider(
    create: (context) => RajaOngkirProvider(),
  ),
  ChangeNotifierProvider(
    create: (context) => TopUpProvider(),
  ),
  ChangeNotifierProvider(
    create: (context) => FilterProvider(),
  ),
];
