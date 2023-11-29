// ignore_for_file: file_names, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:pas_android/pages/account_page.dart';
import 'package:pas_android/pages/cart_page.dart';
import 'package:pas_android/pages/home_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class Navigation extends StatelessWidget {
  const Navigation({Key? key, required this.email, required this.name}) : super(key: key);

  final String email;
  final String name;

  @override
  Widget build(BuildContext context) {
    PersistentTabController controller;
    controller = PersistentTabController(initialIndex: 0);

    List<Widget> _buildScreens() {
      return [const HomePage(), CartPage(), AccountPage(email: '', name: '',)];
    }

    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.home),
          title: ("Beranda"),
          activeColorPrimary: const Color.fromARGB(255, 255, 142, 110),
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.shopping_cart),
          title: ("Keranjang"),
          activeColorPrimary: const Color.fromARGB(255, 255, 142, 110),
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.person),
          title: ("Profil"),
          activeColorPrimary: const Color.fromARGB(255, 255, 142, 110),
          inactiveColorPrimary: Colors.grey,
        ),
      ];
    }

    return PersistentTabView(
      context,
      controller: controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: const Color.fromARGB(255, 245, 245, 245),
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(30.0),
        colorBehindNavBar: const Color.fromARGB(255, 245, 245, 245),
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style1,
    );
  }
}
