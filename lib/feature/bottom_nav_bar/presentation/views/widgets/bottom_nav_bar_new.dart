import 'package:flutter/material.dart';
import 'package:graduation_project/feature/bottom_nav_bar/presentation/views/widgets/bottom_bar_consts.dart';

class NewBottomNavBar extends StatefulWidget {
  const NewBottomNavBar({super.key});

  @override
  State<NewBottomNavBar> createState() => NewBottomNavBarState();
}

class NewBottomNavBarState extends State<NewBottomNavBar> {
  late PageController _pageController;

  int _selectedIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: _selectedIndex);
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  void jumpToIndex(int index) {
    _onItemTapped(index);
  }

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: _selectedIndex == 0,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop && _selectedIndex != 0) {
          setState(() {
            _selectedIndex = 0;
            _pageController.jumpToPage(0);
          });
        }
      },
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: widgetOptions,
        ),
        // body: widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  spreadRadius: .1,
                  blurRadius: 1,
                  offset: Offset(0, 0),
                ),
              ],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: BottomNavigationBar(
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: bottomBarItems,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
