import 'package:ecosofe_app/common/utils/app_colors.dart';
import 'package:ecosofe_app/ui/cart_page/cart_page.dart';
import 'package:ecosofe_app/ui/contact_page/contact_page.dart';
import 'package:ecosofe_app/ui/orders_page/orders_page.dart';
import 'package:ecosofe_app/ui/profile_page/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'user_home_page/home_page.dart';

class HostPage extends StatelessWidget {
  const HostPage({Key? key}) : super(key: key);

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    CartPage(),
    OrdersPage(),
    ContactPage(),
    ProfilePage(),
  ];

  List<PersistentBottomNavBarItem> _navBarsItems() => [
        PersistentBottomNavBarItem(
            icon: const Icon(
              Icons.home_filled,
              size: 24,
            ),
            title: "Home",
            activeColorPrimary: AppColors.primaryColor,
            inactiveColorPrimary: Colors.grey,
            inactiveColorSecondary: Colors.purple),
        PersistentBottomNavBarItem(
          icon: const Icon(
            Icons.shopping_cart_sharp,
            size: 24,
          ),
          title: "Cart",
          activeColorPrimary: AppColors.primaryColor,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(
            Icons.card_travel,
            size: 24,
          ),
          title: "Orders",
          activeColorPrimary: AppColors.primaryColor,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.phone_android),
          title: "Contact",
          activeColorPrimary: AppColors.primaryColor,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(
            Icons.person,
            size: 24,
          ),
          title: "Profile",
          activeColorPrimary: AppColors.primaryColor,
          inactiveColorPrimary: Colors.grey,
        ),
      ];
  static final PersistentTabController tabsController =
      PersistentTabController();

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: tabsController,
      screens: _widgetOptions,
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
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
      navBarStyle: NavBarStyle.style6,
    );
  }
}
