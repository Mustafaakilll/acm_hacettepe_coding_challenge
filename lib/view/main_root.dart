import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../utils/lang/locale_keys.g.dart';
import 'cart_result_page.dart';
import 'favorite_page.dart';
import 'home_page.dart';

class MainRoot extends StatefulWidget {
  @override
  _MainRootState createState() => _MainRootState();
}

class _MainRootState extends State<MainRoot> {
  PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    _pageController = PageController();
    _pageController.addListener(() {
      final _selectedIndex = _pageController.page.round();
      if (_selectedIndex != _currentIndex) {
        _currentIndex = _selectedIndex;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: buildPageView,
        bottomNavigationBar: buildBottomNavigationBar,
      );

  PageView get buildPageView => PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [
          HomePage(),
          FavoritePage(),
          CartResultPage(),
        ],
      );

  BottomNavigationBar get buildBottomNavigationBar => BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
        showUnselectedLabels: false,
        items: [
          buildBottomNavigationBarItem(
              LocaleKeys.navBar_home.tr(), Icons.home_outlined),
          buildBottomNavigationBarItem(
              LocaleKeys.navBar_favorite.tr(), Icons.favorite_border),
          buildBottomNavigationBarItem(
              LocaleKeys.navBar_cart.tr(), Icons.shopping_cart_outlined),
        ],
      );

  void _onTap(int value) {
    setState(() {
      _currentIndex = value;
    });
    _pageController.jumpToPage(value);
  }

  BottomNavigationBarItem buildBottomNavigationBarItem(
          String label, IconData activeIcon) =>
      BottomNavigationBarItem(
        icon: Icon(
          activeIcon,
          color: Colors.white,
        ),
        label: label,
      );
}
