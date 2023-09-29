import 'package:flutter/material.dart';
import 'package:idukaan/view/main/util/bottom_nav_bar_util.dart';

class BottomNavBarWidget extends StatelessWidget {
  final int currentIndex;
  const BottomNavBarWidget({
    super.key,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: (index) {
        switch (index) {
          case 0:
          break;
          case 1:
          break;
          case 2:
          break;
          case 3:
          break;
        }
      },
      items: [
        BottomNavigationBarItem(
          icon: BottomNavBarUtil.dashboard.icon,
          label: BottomNavBarUtil.dashboard.label,
        ),
        BottomNavigationBarItem(
          icon: BottomNavBarUtil.business.icon,
          label: BottomNavBarUtil.business.label,
        ),
        BottomNavigationBarItem(
          icon: BottomNavBarUtil.shop.icon,
          label: BottomNavBarUtil.shop.label,
        ),
        BottomNavigationBarItem(
          icon: BottomNavBarUtil.profile.icon,
          label: BottomNavBarUtil.profile.label,
        ),

      ],
    );
  }
}
