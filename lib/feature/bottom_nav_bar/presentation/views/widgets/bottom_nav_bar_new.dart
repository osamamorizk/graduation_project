import 'package:flutter/material.dart';
import 'package:graduation_project/feature/bottom_nav_bar/presentation/views/widgets/bottom_bar_consts.dart';

class NewBottomNavBar extends StatefulWidget {
  const NewBottomNavBar({super.key});

  @override
  State<NewBottomNavBar> createState() => NewBottomNavBarState();
}

class NewBottomNavBarState extends State<NewBottomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void jumpToIndex(int index) {
    _onItemTapped(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                spreadRadius: 5,
                blurRadius: 8,
                offset: const Offset(0, 0),
              ),
            ],
            borderRadius: const BorderRadius.only(
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
    );
  }
}
