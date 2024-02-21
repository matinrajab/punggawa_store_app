import 'package:flutter/material.dart';
import 'package:shoe_store_app/shared/theme.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(30),
      ),
      child: BottomAppBar(
        color: backgroundColor4,
        shape: const CircularNotchedRectangle(),
        notchMargin: 12,
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icon/icon_home.png',
                height: 20,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icon/icon_chat.png',
                width: 20,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icon/icon_wishlist.png',
                width: 20,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icon/icon_profile.png',
                height: 20,
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
