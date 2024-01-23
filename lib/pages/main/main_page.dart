import 'package:flutter/material.dart';
import 'package:shoe_store_app/pages/chat/chat_page.dart';
import 'package:shoe_store_app/pages/home/home_page.dart';
import 'package:shoe_store_app/pages/profile/profile_page.dart';
import 'package:shoe_store_app/pages/wishlist/wishlist_page.dart';
import 'package:shoe_store_app/routes/routes.dart';
import 'package:shoe_store_app/theme/theme.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _body = [
    HomePage(),
    ChatPage(),
    WishlistPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
        backgroundColor: secondaryColor,
        onPressed: () => Navigator.pushNamed(context, cartPage),
        child: Image.asset(
          'assets/icon/icon_cart.png',
          width: 20,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        child: BottomAppBar(
          padding: EdgeInsets.only(top: 20),
          color: backgroundColor4,
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            currentIndex: _currentIndex,
            onTap: (value) {
              setState(() {
                _currentIndex = value;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icon/icon_home.png',
                  height: 20,
                  color:
                      _currentIndex == 0 ? primaryColor : defaultIconNavColor,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icon/icon_chat.png',
                  width: 20,
                  color:
                      _currentIndex == 1 ? primaryColor : defaultIconNavColor,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icon/icon_wishlist.png',
                  width: 20,
                  color:
                      _currentIndex == 2 ? primaryColor : defaultIconNavColor,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icon/icon_profile.png',
                  height: 20,
                  color:
                      _currentIndex == 3 ? primaryColor : defaultIconNavColor,
                ),
                label: '',
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: _body[_currentIndex],
      ),
    );
  }
}
