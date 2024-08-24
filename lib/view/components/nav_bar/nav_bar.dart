import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
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
  late int bottomNavIndex;

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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      color: Colors.white,
      height: 95.h,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          unselectedIcon.length,
          (index) => InkWell(
            onTap: () => onTap(index),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  index == bottomNavIndex
                      ? selectedIcon[index]
                      : unselectedIcon[index],
                  height: 24.h,
                  width: 24.w,
                  // ignore: deprecated_member_use
                  color:
                      index == bottomNavIndex ? AppColors.blue : Colors.black,
                ),
                SizedBox(height: 4.h),
                CustomText(
                  text: userNavText[index],
                  color:
                      index == bottomNavIndex ? AppColors.blue : Colors.black,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onTap(int index) {
    if (index != bottomNavIndex) {
      switch (index) {
        case 0:
          Get.offAll(() => const HomeScreen());
          break;
        case 1:
          Get.to(() => const ChatScreen());
          break;
        case 2:
          Get.to(() => CategoryScreen());
          break;
        case 3:
          Get.to(() => const PostScreen());
          break;
        case 4:
          Get.to(() => const ProfileScreen());
      }
    }
  }
}
