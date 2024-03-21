import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/models/product_model.dart';
import 'package:shoe_store_app/pages/cart/cart_page.dart';
import 'package:shoe_store_app/pages/chat/detail_chat_page.dart';
import 'package:shoe_store_app/pages/home/home_page.dart';
import 'package:shoe_store_app/pages/profile/profile_page.dart';
import 'package:shoe_store_app/pages/widgets/cart_badge.dart';
import 'package:shoe_store_app/pages/wishlist/wishlist_page.dart';
import 'package:shoe_store_app/providers/page_provider.dart';
import 'package:shoe_store_app/shared/theme.dart';

class MainPage extends StatelessWidget {
  static const routeName = '/home';

  MainPage({super.key});

  final List<Widget> _body = [
    const HomePage(),
    const SizedBox(),
    const WishlistPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<PageProvider>(
      builder: (context, pageProvider, _) => Scaffold(
        backgroundColor: backgroundColor1,
        floatingActionButton: CartBadge(
          child: FloatingActionButton(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
            ),
            backgroundColor: tertiaryColor,
            onPressed: () => Navigator.pushNamed(context, CartPage.routeName),
            child: Image.asset(
              'assets/icon/cart.png',
              width: 20,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(30),
          ),
          child: BottomAppBar(
            padding: const EdgeInsets.only(top: 20),
            color: primaryColor,
            shape: const CircularNotchedRectangle(),
            notchMargin: 10,
            clipBehavior: Clip.antiAlias,
            child: BottomNavigationBar(
              backgroundColor: Colors.transparent,
              type: BottomNavigationBarType.fixed,
              elevation: 0,
              currentIndex: pageProvider.currentIndex,
              onTap: (value) {
                if (value == 1) {
                  Navigator.pushNamed(
                    context,
                    DetailChatPage.routeName,
                    arguments: UninitializedProductModel(),
                  );
                } else {
                  pageProvider.currentIndex = value;
                }
              },
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icon/home.png',
                    height: 20,
                    color: pageProvider.currentIndex == 0
                        ? whiteColor
                        : unselectedColor,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icon/chat.png',
                    width: 20,
                    color: pageProvider.currentIndex == 1
                        ? whiteColor
                        : unselectedColor,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icon/wishlist.png',
                    width: 20,
                    color: pageProvider.currentIndex == 2
                        ? whiteColor
                        : unselectedColor,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icon/profile.png',
                    height: 20,
                    color: pageProvider.currentIndex == 3
                        ? whiteColor
                        : unselectedColor,
                  ),
                  label: '',
                ),
              ],
            ),
          ),
        ),
        body: _body[pageProvider.currentIndex],
      ),
    );
  }
}
