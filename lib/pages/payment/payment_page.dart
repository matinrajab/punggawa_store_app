import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/providers/transaction_provider.dart';
import 'package:shoe_store_app/routes/route_name.dart';
import 'package:shoe_store_app/shared/theme.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    TransactionProvider transactionProvider =
        Provider.of<TransactionProvider>(context, listen: false);
    WebViewController webViewController = WebViewController();

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: AppBar(
        backgroundColor: backgroundColor1,
        title: Text(
          'Payment',
          style: primaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, checkoutSuccessPage, (route) => false);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: primaryTextColor,
          ),
        ),
      ),
      body: WebViewWidget(
        controller: webViewController
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..loadRequest(
            Uri.parse(
              'https://app.sandbox.midtrans.com/snap/v2/vtweb/${transactionProvider.snapToken}',
            ),
          ),
      ),
    );
  }
}
