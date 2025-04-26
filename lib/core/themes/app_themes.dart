import 'package:flutter/material.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';

class AppThemes {
  static final darkTheme = ThemeData(
    iconTheme: const IconThemeData(color: Colors.amber),
    tabBarTheme: TabBarTheme(
      dividerColor: Colors.grey.shade200,
      dividerHeight: .6,
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorColor: ColorsManger.darkBlue,
      labelColor: Colors.amber,
      unselectedLabelColor: Colors.lightBlue,
    ),
    brightness: Brightness.dark,
    primaryColor: Colors.white,
    textTheme: ThemeData.light().textTheme.apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
  );

  static final lightTheme = ThemeData(
    iconTheme: const IconThemeData(color: Colors.black),
    tabBarTheme: TabBarTheme(
      labelPadding: const EdgeInsets.all(0),
      dividerColor: Colors.grey.shade200,
      dividerHeight: .4,
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorColor: ColorsManger.darkBlue,
      labelColor: Colors.black,
      unselectedLabelColor: ColorsManger.darkerGrey,
    ),
    appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
        seedColor: ColorsManger.darkBlue, brightness: Brightness.light),
    primaryColor: ColorsManger.darkBlue,
    textTheme: ThemeData.light().textTheme.apply(
          bodyColor: Colors.black,
          displayColor: Colors.black,
        ),
  );
}
