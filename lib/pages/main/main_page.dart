import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store_app/pages/cart/cart_page.dart';
import 'package:shoe_store_app/pages/chat/chat_page.dart';
import 'package:shoe_store_app/pages/home/home_page.dart';
import 'package:shoe_store_app/pages/profile/profile_page.dart';
import 'package:shoe_store_app/pages/wishlist/wishlist_page.dart';
import 'package:shoe_store_app/providers/page_provider.dart';
import 'package:shoe_store_app/shared/theme.dart';

class MainPage extends StatelessWidget {
  static const routeName = '/home';

  MainPage({super.key});

  final List<Widget> _body = [
    const HomePage(),
    const ChatPage(),
    const WishlistPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<PageProvider>(
      builder: (context, pageProvider, _) => Scaffold(
        backgroundColor: pageProvider.currentIndex == 0
            ? backgroundColor1
            : backgroundColor3,
        floatingActionButton: FloatingActionButton(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
          ),
          backgroundColor: secondaryColor,
          onPressed: () => Navigator.pushNamed(context, CartPage.routeName),
          child: Image.asset(
            'assets/icon/icon_cart.png',
            width: 20,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(30),
          ),
          child: BottomAppBar(
            padding: const EdgeInsets.only(top: 20),
            color: backgroundColor4,
            shape: const CircularNotchedRectangle(),
            notchMargin: 10,
            clipBehavior: Clip.antiAlias,
            child: BottomNavigationBar(
              backgroundColor: Colors.transparent,
              type: BottomNavigationBarType.fixed,
              elevation: 0,
              currentIndex: pageProvider.currentIndex,
              onTap: (value) {
                pageProvider.currentIndex = value;
              },
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icon/icon_home.png',
                    height: 20,
                    color: pageProvider.currentIndex == 0
                        ? primaryColor
                        : defaultIconNavColor,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icon/icon_chat.png',
                    width: 20,
                    color: pageProvider.currentIndex == 1
                        ? primaryColor
                        : defaultIconNavColor,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icon/icon_wishlist.png',
                    width: 20,
                    color: pageProvider.currentIndex == 2
                        ? primaryColor
                        : defaultIconNavColor,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icon/icon_profile.png',
                    height: 20,
                    color: pageProvider.currentIndex == 3
                        ? primaryColor
                        : defaultIconNavColor,
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
