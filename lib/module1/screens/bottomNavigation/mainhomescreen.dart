import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intertoons/module1/screens/hompage.dart';
import 'package:intertoons/module1/screens/search.dart';

import '../menuscreen.dart';
import 'bottomnavigationbar.dart';

class MainHomeScreen extends StatefulWidget {
  final int defaultMenuIndex;
  // ignore: use_key_in_widget_constructors
  const MainHomeScreen({this.defaultMenuIndex = 0});

  @override
  _MainHomeScreen createState() => _MainHomeScreen();
}

class _MainHomeScreen extends State<MainHomeScreen> {
  int _pageIndex = 0;
  List<Widget> tabPages = [
    const FirstPage(),
    SecondScreen(),
    const ThirdScreen(),
    const FourthScreen()
  ];

  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    setState(() {
      _pageIndex = widget.defaultMenuIndex;
    });
    _pageController = PageController(initialPage: _pageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  DateTime currentBackPressTime = DateTime.now();

  Future<bool> onWillPop() async {
    DateTime now = DateTime.now();
    if (now.difference(currentBackPressTime) > const Duration(seconds: 2)) {
      setState(() {
        currentBackPressTime = now;
      });
      return Future.value(false);
    }
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBarView(
          pageIndex: _pageIndex,
          onTabTapped: onTabTapped,
        ),
        body: PageView(
          children: tabPages,
          onPageChanged: onPageChanged,
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
        ),
      ),
    );
  }

  //home page change on swipe
  void onTabTapped(int index) {
    _pageController.jumpToPage(index);

    // HttpService().postApiwithHeader(
    //     url: 'http://fda.intertoons.com/api/V1/products',
    //     access: 'akhil@intertoons.com');
  }

  // home page change
  void onPageChanged(int page) {
    setState(() {
      _pageIndex = page;
    });
  }
}
