import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:trade_app/core/routes/route_path.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_icons/app_icons.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/screens/category_screen/category_screen.dart';
import 'package:trade_app/view/screens/home_screen/home_screen.dart';
import 'package:trade_app/view/screens/message_screen/chat_screen.dart';
import 'package:trade_app/view/screens/post_screen/post_screen.dart';
import 'package:trade_app/view/screens/profile_screen/profile_screen.dart';

class NavBar extends StatefulWidget {
  final int currentIndex;

  const NavBar({required this.currentIndex, super.key});

  @override
  State<NavBar> createState() => _UserNavBarState();
}

class _UserNavBarState extends State<NavBar> {
  int bottomNavIndex = 0;

  ///=======================UnselectedIcon====================
  final List<String> unselectedIcon = [
    AppIcons.homeUnselected,
    AppIcons.messageUnSelected,
    AppIcons.categoryUnselected,
    AppIcons.postUnselected,
    AppIcons.profileUnselected,
  ];

  ///=======================SelectedIcon====================
  final List<String> selectedIcon = [
    AppIcons.homeSelected,
    AppIcons.messageSelected,
    AppIcons.categorySelected,
    AppIcons.postSelected,
    AppIcons.profileSelected,
  ];

  final List<String> userNavText = [
    'Home'.tr,
    'Chat'.tr,
    'Category'.tr,
    'Post'.tr,
    'Profile'.tr,
  ];

  @override
  void initState() {
    bottomNavIndex = widget.currentIndex;
    super.initState();
  }

  List<Widget> screens = [
    HomeScreen(),
    ChatScreen(),
    CategoryScreen(),
    PostScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: bottomNavIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          bottomNavIndex = index;
          setState(() {

          });
        },
        items: List.generate(userNavText.length, (index)=>BottomNavigationBarItem(
            icon: SvgPicture.asset(unselectedIcon[index]),
          activeIcon: SvgPicture.asset(selectedIcon[index]),
          label: userNavText[index],
        )),
      ),
    );
  }
}
