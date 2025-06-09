import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/core/helpers/app_assets.dart';
import 'package:graduation_project/core/themes/colors_manger.dart';
import 'package:graduation_project/feature/diet/presentation/views/diet_view.dart';
import 'package:graduation_project/feature/home/presentation/views/home_view.dart';
import 'package:graduation_project/feature/profile/presentation/views/profile_view.dart';
import 'package:graduation_project/feature/scan_food/presentation/views/scan_food_view.dart';
import 'package:graduation_project/feature/workout/presentation/views/workout_view.dart';

List<BottomNavigationBarItem> bottomBarItems(BuildContext context) {
  final isDark = Theme.of(context).brightness == Brightness.dark;
  final iconColor = isDark ? ColorsManger.neonPurple : Colors.white;

  return <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      activeIcon: SvgPicture.asset(
        height: 28.h,
        Assets.svgsBottomBarActiveHome,
        colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
      ),
      icon: SvgPicture.asset(
        Assets.svgsBottomBarInactiveHome,
        colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
      ),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      activeIcon: SvgPicture.asset(
        height: 28.h,
        Assets.svgsBottomBarActiveDiet,
        colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
      ),
      icon: SvgPicture.asset(
        Assets.svgsBottomBarInactiveDiet,
        colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
      ),
      label: 'Diet',
    ),
    BottomNavigationBarItem(
      activeIcon: SvgPicture.asset(
        height: 28.h,
        Assets.svgsBottomBarActiveScan,
        colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
      ),
      icon: SvgPicture.asset(
        Assets.svgsBottomBarInactiveScan,
        colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
      ),
      label: 'Scan',
    ),
    BottomNavigationBarItem(
      activeIcon: SvgPicture.asset(
        height: 28.h,
        Assets.svgsBottomBarActiveWorkouts,
        colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
      ),
      icon: SvgPicture.asset(
        Assets.svgsBottomBarInactiveWorkouts,
        colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
      ),
      label: 'Workout',
    ),
    BottomNavigationBarItem(
      activeIcon: SvgPicture.asset(
        height: 28.h,
        Assets.svgsBottomBarActiveProfile,
        colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
      ),
      icon: SvgPicture.asset(
        Assets.svgsBottomBarInactiveProfile,
        colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
      ),
      label: 'Profile',
    ),
  ];
}

const List<Widget> widgetOptions = <Widget>[
  HomeView(),
  DietView(),
  ScanFoodView(),
  WorkoutView(),
  ProfileView(),
];
