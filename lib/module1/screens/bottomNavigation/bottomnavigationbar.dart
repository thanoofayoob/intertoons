import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// im/

// ignore: must_be_immutable
class BottomNavigationBarView extends StatelessWidget {
  final int pageIndex;
  void Function(int)? onTabTapped;

  BottomNavigationBarView({
    Key? key,
    required this.pageIndex,
    this.onTabTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        // backgroundColor: whiteColor,
        currentIndex: pageIndex,
        onTap: onTabTapped,
        iconSize: 16.0,
        // selectedLabelStyle: bottomNavigationText,
        // unselectedLabelStyle: bottomNavigationText.copyWith(color: Colors.grey),
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey[500],
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 20,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.menu,
              size: 20,
            ),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 20,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              size: 20,
            ),
            label: 'Account',
          ),
        ]);
  }
}
