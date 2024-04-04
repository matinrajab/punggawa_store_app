import 'package:flutter_dotenv/flutter_dotenv.dart';

class Config {
  static String baseUrl = dotenv.env['BASE_URL']!;
  static String rajaOngkirUrl = dotenv.env['RAJA_ONGKIR_URL']!;
  static String clientKey = dotenv.env['MIDTRANS_CLIENT_KEY']!;
  static String rajaOngkirApiKey = dotenv.env['RAJA_ONGKIR_API_KEY']!;
}