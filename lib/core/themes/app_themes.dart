import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: ColorsManger.darkBlue,
    cardColor: Colors.white,
    iconTheme: const IconThemeData(color: Colors.black),
    appBarTheme: const AppBarTheme(
      elevation: .1,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: ColorsManger.darkBlue),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    ),
    tabBarTheme: TabBarTheme(
      labelPadding: EdgeInsets.zero,
      dividerColor: Colors.grey.shade200,
      dividerHeight: 0.4,
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorColor: ColorsManger.darkBlue,
      labelColor: Colors.black,
      unselectedLabelColor: ColorsManger.darkerGrey,
    ),
    listTileTheme: const ListTileThemeData(
      iconColor: Color(0xFF4A90E2),
      textColor: Color(0xFF0D1B2A),
      selectedTileColor: Color(0xFFE3F2FD),
      selectedColor: Color(0xFF1565C0),
      tileColor: Colors.white,
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
        color: ColorsManger.darkBlue,
      ),
      titleLarge: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
        color: ColorsManger.lightTextPrimary,
      ),
      titleMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: ColorsManger.lightTextSecondary,
      ),
      titleSmall: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color: ColorsManger.lightTextHint,
      ),
      bodyMedium: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w700,
        color: ColorsManger.lightTextPrimary,
      ),
      bodySmall: TextStyle(
        fontSize: 13.sp,
        fontWeight: FontWeight.w500,
        color: ColorsManger.lightTextPrimary,
      ),
      labelSmall: TextStyle(
        fontSize: 13.sp,
        fontWeight: FontWeight.w400,
        color: ColorsManger.lightTextSecondary,
      ),
    ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: ColorsManger.darkBackground,
    primaryColor: Colors.white,
    cardColor: ColorsManger.darkCard,
    iconTheme: const IconThemeData(color: ColorsManger.neonPurple),
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorsManger.darkBackground,
      iconTheme: IconThemeData(color: ColorsManger.neonPurple),
    ),
    tabBarTheme: const TabBarTheme(
      dividerColor: Colors.white10,
      dividerHeight: 0.6,
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorColor: ColorsManger.neonPurple,
      labelColor: ColorsManger.neonPurple,
      unselectedLabelColor: ColorsManger.darkerGrey,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    ),
    listTileTheme: const ListTileThemeData(
      iconColor: Color(0xFF64B5F6),
      textColor: Color(0xFFECEFF1),
      tileColor: Color(0xFF1E1E1E),
      selectedTileColor: Color(0xFF263238),
      selectedColor: ColorsManger.neonPurple,
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
        color: ColorsManger.neonPurple,
      ),
      titleLarge: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
        color: ColorsManger.neonPurple,
      ),
      titleMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: ColorsManger.darkTextSecondary,
      ),
      titleSmall: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color: ColorsManger.darkTextSecondary,
      ),
      bodyMedium: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w700,
        color: ColorsManger.darkTextPrimary,
      ),
      bodySmall: TextStyle(
        fontSize: 13.sp,
        fontWeight: FontWeight.w500,
        color: ColorsManger.darkTextPrimary,
      ),
      labelSmall: TextStyle(
        fontSize: 13.sp,
        fontWeight: FontWeight.w400,
        color: ColorsManger.darkTextSecondary,
      ),
    ),
  );
}
