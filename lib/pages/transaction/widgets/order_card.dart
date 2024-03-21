import 'package:flutter/material.dart';
import 'package:shoe_store_app/models/item_model.dart';
import 'package:shoe_store_app/models/product_model.dart';
import 'package:shoe_store_app/models/transaction_model.dart';
import 'package:shoe_store_app/pages/transaction/detail_order_page.dart';
import 'package:shoe_store_app/pages/widgets/my_button.dart';
import 'package:shoe_store_app/shared/currency_format.dart';
import 'package:shoe_store_app/shared/theme.dart';

class OrderCard extends StatelessWidget {
  final TransactionModel transaction;
  final String textButton;
  final GestureTapCallback? onButtonTap;
  final bool isButtonAppear;

  const OrderCard({
    super.key,
    required this.transaction,
    this.textButton = '',
    this.onButtonTap,
    this.isButtonAppear = false,
  });

  @override
  Widget build(BuildContext context) {
    List<ItemModel>? items = transaction.items;
    ProductModel product = items![0].product!;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(
          context,
          DetailOrderPage.routeName,
          arguments: transaction,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: generalBorderRadius,
            color: backgroundColor2,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: generalBorderRadius,
                    child: Image.network(
                      product.galleries![0].url!.substring(25),
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          product.name!,
                          style: primaryTextStyle.copyWith(
                            fontWeight: semiBold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          currencyFormat(product.price!),
                          style: priceTextStyle.copyWith(
                            fontWeight: medium,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Text(
                    '${items[0].quantity} Items',
                    style: secondaryTextStyle.copyWith(fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Divider(
                thickness: 1,
                color: subtitleTextColor,
              ),
              transaction.items!.length > 1
                  ? Column(
                      children: [
                        Text(
                          'See other products',
                          style: secondaryTextStyle.copyWith(fontSize: 12),
                        ),
                        const Divider(
                          thickness: 1,
                          color: subtitleTextColor,
                        ),
                      ],
                    )
                  : const SizedBox(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${transaction.items!.length} product',
                    style: secondaryTextStyle.copyWith(fontSize: 12),
                  ),
                  Row(
                    children: [
                      Text(
                        'Total: ',
                        style: secondaryTextStyle.copyWith(fontSize: 12),
                      ),
                      Text(
                        currencyFormat(transaction.totalPrice!),
                        style: priceTextStyle.copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
              isButtonAppear
                  ? Column(
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        MyButton(
                          text: textButton,
                          onTap: onButtonTap,
                          height: 44,
                        ),
                      ],
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
