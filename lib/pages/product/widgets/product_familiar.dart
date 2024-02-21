import 'package:flutter/material.dart';
import 'package:shoe_store_app/shared/theme.dart';

class ProductFamiliar extends StatelessWidget {
  ProductFamiliar({
    super.key,
  });

  final List<String> _familiarShoes = [
    'assets/image/image_shoe.png',
    'assets/image/image_shoe2.png',
    'assets/image/image_shoe3.png',
    'assets/image/image_shoe.png',
    'assets/image/image_shoe2.png',
    'assets/image/image_shoe3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: pagePadding,
            bottom: 12,
          ),
          child: Text(
            'Familiar Shoes',
            style: primaryTextStyle.copyWith(
              fontWeight: medium,
            ),
          ),
        ),
        SizedBox(
          height: 54,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            scrollDirection: Axis.horizontal,
            itemCount: _familiarShoes.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: SizedBox(
                  width: 54,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.asset(
                        _familiarShoes[index],
                        fit: BoxFit.cover,
                      )),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
