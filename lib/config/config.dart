import 'package:flutter_dotenv/flutter_dotenv.dart';

class Config {
  static String baseUrl = dotenv.env['BASE_URL']!;
  static String addressApiUrl = dotenv.env['ADDRESS_API_URL']!;
  static String clientKey = dotenv.env['MIDTRANS_CLIENT_KEY']!;
}