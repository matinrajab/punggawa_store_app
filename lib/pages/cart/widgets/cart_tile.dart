import 'package:flutter/material.dart';
import 'package:shoe_store_app/theme/theme.dart';

class CartTile extends StatefulWidget {
  final String imageAsset;
  final String productName;
  final double price;

  CartTile({
    super.key,
    required this.imageAsset,
    required this.productName,
    required this.price,
  });

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  int _itemCount = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
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
                  child: Image.asset(
                    widget.imageAsset,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.productName,
                        style: primaryTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        '\$${widget.price}',
                        style: priceTextStyle,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          _itemCount++;
                        });
                      },
                      child: Image.asset(
                        'assets/button/button_add.png',
                        width: 16,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Text(
                        '$_itemCount',
                        style: primaryTextStyle.copyWith(fontWeight: medium),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          if(_itemCount > 0)
                            _itemCount--;
                        });
                      },
                      child: Image.asset(
                        'assets/button/button_min.png',
                        width: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Image.asset(
                  'assets/icon/icon_trash.png',
                  width: 10,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  'Remove',
                  style: alertTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: light,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
