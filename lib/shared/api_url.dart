import 'package:shoe_store_app/config/config.dart';

var baseUrl = Config.baseUrl;

var productsUrl = '$baseUrl/products';
var productCategoriesUrl = '$baseUrl/product-categories';
var addressCategoriesUrl = '$baseUrl/address-categories';
var paymentMethodsUrl = '$baseUrl/payment-methods';

var registerUrl = '$baseUrl/register';
var loginUrl = '$baseUrl/login';

var fetchUserUrl = '$baseUrl/user';
var updateProfileUrl = '$baseUrl/user';
var logoutUrl = '$baseUrl/logout';

var getAddressesUrl = '$baseUrl/addresses';
var storeAddressUrl = '$baseUrl/address';
var updateAddressUrl = '$baseUrl/address';
var deleteAddressUrl = '$baseUrl/address';

var transactionsUrl = '$baseUrl/transactions';
var checkoutUrl = '$baseUrl/checkout';
var topUpUrl = '$baseUrl/top-up';
var transactionStatusUrl = '$baseUrl/transaction-status';
var addBonusUrl = '$baseUrl/bonus';