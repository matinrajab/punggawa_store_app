import 'package:intl/intl.dart';

String currencyFormat(int number) {
  return NumberFormat.currency(
    locale: 'id',
    symbol: 'Rp ',
    decimalDigits: 0,
  ).format(number);
}
