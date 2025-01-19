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
      bottomNavigationBar: BottomNavigationBar(
        elevation: 20,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: bottomBarItems,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
