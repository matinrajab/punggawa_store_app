import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/config/config.dart';
import 'package:shoe_store_app/midtrans/midtrans.dart';
import 'package:shoe_store_app/pages/checkout/checkout_success_page.dart';
import 'package:shoe_store_app/pages/main/main_page.dart';
import 'package:shoe_store_app/pages/transaction/order_page.dart';
import 'package:shoe_store_app/pages/widgets/my_button.dart';
import 'package:shoe_store_app/pages/widgets/my_snack_bar.dart';
import 'package:shoe_store_app/providers/page_provider.dart';
import 'package:shoe_store_app/providers/transaction_provider.dart';
import 'package:shoe_store_app/shared/theme.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentPage extends StatelessWidget {
  static const routeName = '/payment';

  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    TransactionProvider transactionProvider =
        Provider.of<TransactionProvider>(context, listen: false);
    PageProvider pageProvider =
        Provider.of<PageProvider>(context, listen: false);
    WebViewController webViewController = WebViewController();

    void showConfirmDialog(title, desc, message) async {
      await showModalBottomSheet(
        backgroundColor: backgroundColor3,
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder: (BuildContext context) {
          return Container(
            height: 250,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: primaryTextStyle.copyWith(
                      fontWeight: bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    desc,
                    style: primaryTextStyle.copyWith(fontWeight: medium),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  MyButton(
                    text: 'Close',
                    onTap: () async {
                      await Provider.of<TransactionProvider>(context,
                              listen: false)
                          .getTransactions();
                      pageProvider.currentIndex = 3;
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        OrderPage.routeName,
                        ModalRoute.withName(MainPage.routeName),
                        arguments: message == 'pending' ? 0 : 1,
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    handleResponse(message) {
      try {
        var title, desc;
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
        if (title.length == 0 && desc.length == 0)
          MySnackBar.showSnackBar(
              context: context,
              message: 'Something went wrong!',
              isSuccess: false);
        else
          showConfirmDialog(title, desc, message);
      } catch (e) {
        MySnackBar.showSnackBar(
            context: context, message: e.toString(), isSuccess: false);
      }
    }

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
          onPressed: () => Navigator.pushNamedAndRemoveUntil(
              context, CheckoutSuccessPage.routeName, (route) => false),
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: primaryTextColor,
          ),
        ),
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
    );
  }
}
