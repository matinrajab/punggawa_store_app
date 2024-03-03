import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/config/config.dart';
import 'package:shoe_store_app/midtrans/midtrans.dart';
import 'package:shoe_store_app/pages/main/main_page.dart';
import 'package:shoe_store_app/pages/payment/widgets/payment_back_dialog.dart';
import 'package:shoe_store_app/pages/wallet/wallet_page.dart';
import 'package:shoe_store_app/pages/widgets/my_app_bar.dart';
import 'package:shoe_store_app/pages/widgets/my_snack_bar.dart';
import 'package:shoe_store_app/providers/auth_provider.dart';
import 'package:shoe_store_app/providers/page_provider.dart';
import 'package:shoe_store_app/providers/transaction_provider.dart';
import 'package:shoe_store_app/shared/theme.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TopUpPaymentPage extends StatelessWidget {
  static const routeName = '/top-up-payment';

  const TopUpPaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    TransactionProvider transactionProvider =
        Provider.of<TransactionProvider>(context, listen: false);
    PageProvider pageProvider =
        Provider.of<PageProvider>(context, listen: false);
    WebViewController webViewController = WebViewController();

    handleResponse(message) async {
      try {
        String title, desc;
        late Midtrans midtrans;
        if (Platform.isAndroid) {
          switch (message) {
            case 'ok':
              midtrans = Midtrans(MIDTRANS_PAYMENT_TYPE.bank_transfer,
                  MIDTRANS_STATUS_CODE.MIDTRANS_STATUS_CODE_200);
              break;
            case 'pending':
              midtrans = Midtrans(MIDTRANS_PAYMENT_TYPE.bank_transfer,
                  MIDTRANS_STATUS_CODE.MIDTRANS_STATUS_CODE_201);
              break;
            case 'error':
              midtrans = Midtrans(MIDTRANS_PAYMENT_TYPE.bank_transfer,
                  MIDTRANS_STATUS_CODE.MIDTRANS_STATUS_CODE_202);
              break;
          }
        } else {
          midtrans = Midtrans.fromString(message);
        }
        var result = midtrans.getResult();
        title = result[0];
        desc = result[1];
        if (title.isEmpty && desc.isEmpty) {
          MySnackBar.showSnackBar(
              context: context,
              message: 'Something went wrong!',
              isSuccess: false);
        } else {
          await Provider.of<AuthProvider>(context, listen: false).fetch();
          pageProvider.currentIndex = 3;
          Navigator.pushNamedAndRemoveUntil(
            context,
            WalletPage.routeName,
            ModalRoute.withName(MainPage.routeName),
          );
        }
      } catch (e) {
        MySnackBar.showSnackBar(
            context: context, message: e.toString(), isSuccess: false);
      }
    }

    showBackDialog() {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => const PaymentBackDialog(),
      );
    }

    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) {
        if (didPop) {
          return;
        }
        showBackDialog();
      },
      child: Scaffold(
        backgroundColor: backgroundColor3,
        appBar: MyAppBar(
          text: 'Payment',
          leadingIcon: backIcon,
          onLeadingPressed: () => showBackDialog(),
        ),
        body: WebViewWidget(
          controller: webViewController
            ..setJavaScriptMode(JavaScriptMode.unrestricted)
            ..loadRequest(Uri.dataFromString(
              '''<html lang="en">
        <head>
          <meta name="viewport" content="width=device-width, initial-scale=1">
          <script 
            type="text/javascript"
            src="https://app.sandbox.midtrans.com/snap/snap.js"
            data-client-key="${Config.clientKey}"
          ></script>
        </head>
        <body onload="setTimeout(function(){pay()}, 1000)">
          <script type="text/javascript">
              function pay() {
                  snap.pay('${transactionProvider.snapToken}', {
                    // Optional
                    onSuccess: function(result) {
                      Android.postMessage('ok');
                      Print.postMessage(result);
                    },
                    // Optional
                    onPending: function(result) {
                      Android.postMessage('pending');
                      Print.postMessage(result);
                    },
                    // Optional
                    onError: function(result) {
                      Android.postMessage('error');
                      Print.postMessage(result);
                    },
                    onClose: function() {
                      Android.postMessage('close');
                      Print.postMessage('close');
                    }
                  });
              }
          </script>
        </body>
      </html>''',
              mimeType: 'text/html',
              encoding: Encoding.getByName('utf-8'),
            ))
            ..addJavaScriptChannel(
              'Android',
              onMessageReceived: (JavaScriptMessage receiver) {
                print('==========>>>>>>>>>>>>>> BEGIN');
                print(receiver.message);
                if (Platform.isAndroid) {
                  if (receiver.message != 'undefined') {
                    handleResponse(receiver.message);
                  }
                }
                print('==========>>>>>>>>>>>>>> END');
              },
            )
            ..addJavaScriptChannel(
              'Print',
              onMessageReceived: (JavaScriptMessage receiver) {
                print('==========>>>>>>>>>>>>>> BEGIN');
                print(receiver.message);
                if (receiver.message != 'undefined') {
                  handleResponse(receiver.message);
                }
                print('==========>>>>>>>>>>>>>> END');
              },
            ),
        ),
      ),
    );
  }
}
