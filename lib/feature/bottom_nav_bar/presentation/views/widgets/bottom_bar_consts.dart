import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/core/helpers/app_assets.dart';
import 'package:graduation_project/feature/diet/presentation/views/diet_view.dart';
import 'package:graduation_project/feature/home/presentation/views/home_view.dart';
import 'package:graduation_project/feature/profile/presentation/views/profile_view.dart';
import 'package:graduation_project/feature/scan_food/presentation/views/scan_food_view.dart';
import 'package:graduation_project/feature/workout/presentation/views/workout_view.dart';

List<BottomNavigationBarItem> get bottomBarItems {
  return <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      activeIcon: SvgPicture.asset(
        Assets.svgsBottomBarActiveHome,
      ),
      icon: SvgPicture.asset(
        Assets.svgsBottomBarInactiveHome,
      ),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      activeIcon: SvgPicture.asset(
        Assets.svgsBottomBarActiveDiet,
      ),
      icon: SvgPicture.asset(
        Assets.svgsBottomBarInactiveDiet,
      ),
      label: 'Diet',
    ),
    BottomNavigationBarItem(
      activeIcon: SvgPicture.asset(
        Assets.svgsBottomBarActiveScan,
      ),
      icon: SvgPicture.asset(
        Assets.svgsBottomBarInactiveScan,
      ),
      label: 'Scan',
    ),
    BottomNavigationBarItem(
      activeIcon: SvgPicture.asset(
        Assets.svgsBottomBarActiveWorkouts,
      ),
      icon: SvgPicture.asset(
        Assets.svgsBottomBarInactiveWorkouts,
      ),
      label: 'Workout',
    ),
    BottomNavigationBarItem(
      activeIcon: SvgPicture.asset(
        Assets.svgsBottomBarActiveProfile,
      ),
      icon: SvgPicture.asset(
        Assets.svgsBottomBarInactiveProfile,
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
