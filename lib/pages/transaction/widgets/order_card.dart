import 'package:flutter/material.dart';
import 'package:shoe_store_app/models/item_model.dart';
import 'package:shoe_store_app/models/product_model.dart';
import 'package:shoe_store_app/models/transaction_model.dart';
import 'package:shoe_store_app/routes/route_name.dart';
import 'package:shoe_store_app/theme/theme.dart';

class OrderCard extends StatelessWidget {
  final TransactionModel transaction;

  const OrderCard({
    super.key,
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    List<ItemModel>? items = transaction.items;
    ProductModel product = items![0].product!;

    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(
          context,
          detailOrderPage,
          arguments: transaction,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: generalBorderRadius,
            color: backgroundColor4,
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
                          '\$${product.price}',
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
              SizedBox(
                height: 15,
              ),
              const Divider(
                thickness: 1,
                color: subtitleTextColor,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  'See order details',
                  style: secondaryTextStyle.copyWith(fontSize: 12),
                ),
              ),
              const Divider(
                thickness: 1,
                color: subtitleTextColor,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${transaction.items!.length}',
                    style: secondaryTextStyle.copyWith(fontSize: 12),
                  ),
                  Row(
                    children: [
                      Text(
                        'Total ',
                        style: secondaryTextStyle.copyWith(fontSize: 12),
                      ),
                      Text(
                        '${transaction.totalPrice}',
                        style: secondaryTextStyle.copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
