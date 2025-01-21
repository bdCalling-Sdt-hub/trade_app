import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:trade_app/core/routes/route_path.dart';
import 'package:trade_app/global/general_controller/general_controller.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_icons/app_icons.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/screens/category_screen/category_screen.dart';
import 'package:trade_app/view/screens/home_screen/home_screen.dart';
import 'package:trade_app/view/screens/message_screen/chat_screen.dart';
import 'package:trade_app/view/screens/post_screen/post_screen.dart';
import 'package:trade_app/view/screens/profile_screen/profile_screen.dart';

/*class NavBar extends StatefulWidget {
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
        selectedLabelStyle: TextStyle(
          fontSize: 14.sp, // Increase font size for selected label
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 12.sp, // Increase font size for unselected label
        ),
        type: BottomNavigationBarType.fixed, // Ensure icons and labels are shown
        backgroundColor: Colors.white,
        currentIndex: bottomNavIndex, // Set the current index
        selectedItemColor: AppColors.blue, // Customize selected item color
        unselectedItemColor: Colors.grey, // Customize unselected item color
        onTap: (index) {
          setState(() {
            bottomNavIndex = index;
          });
        },
        items: List.generate(userNavText.length, (index) {
          return BottomNavigationBarItem(
            icon: SvgPicture.asset(
              unselectedIcon[index],
              color: Colors.grey, // Default color for unselected icon
            ),
            activeIcon: SvgPicture.asset(
              selectedIcon[index],
              color: AppColors.blue, // Highlight color for selected icon
            ),
            label: userNavText[index],
          );
        }),
      ),
    );
  }

}*/

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
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../dependency_injection/path.dart';

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

  GeneralController generalController = Get.find<GeneralController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.loose,
      children: [
        // youtubeController != null
        //     ? SizedBox(
        //   height: 100,
        //   child: YoutubePlayer(
        //     controller: youtubeController,
        //     showVideoProgressIndicator: false,
        //
        //     bottomActions: [], // Hide all bottom actions
        //   ),
        // )
        //     : Center(
        //     child:
        //     SizedBox()),
        Container(
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
                onTap: () {
                  onTap(index);
                },
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
                      color: index == bottomNavIndex
                          ? AppColors.blue
                          : Colors.black,
                    ),
                    SizedBox(height: 4.h),
                    CustomText(
                      text: userNavText[index],
                      color: index == bottomNavIndex
                          ? AppColors.blue
                          : Colors.black,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        // Obx(() {
        //   return Positioned(
        //     right: min(
        //       MediaQuery.of(context).size.width -
        //           60.w, // Width of the draggable container
        //       max(0, generalController.dragabbleHorizontal.value),
        //     ),
        //     bottom: min(
        //       MediaQuery.of(context).size.height -
        //           60.h, // Height of the draggable container
        //       max(0,generalController. dragabbleVerticel.value),
        //     ),
        //     child: GestureDetector(
        //       onTap:  (){
        //
        //
        //         print("details");
        //       },
        //
        //       onPanUpdate: (details) async {
        //
        //         print(details);
        //         generalController. dragabbleHorizontal.value = max(
        //           0,
        //           min(
        //             generalController.  dragabbleHorizontal.value -
        //                 details.delta.dx,
        //             MediaQuery.of(context).size.width -
        //                 60.w, // Width of the draggable container
        //           ),
        //         );
        //
        //         generalController. dragabbleVerticel.value = max(
        //           0,
        //           min(
        //             generalController.    dragabbleVerticel.value -
        //                 details.delta.dy,
        //             MediaQuery.of(context).size.height -
        //                 60.h, // Height of the draggable container
        //           ),
        //         );
        //       },
        //       child: GestureDetector(
        //         onTap: () {
        //           // Get.toNamed(AppRoute.serviceOfferDetails,
        //           //     arguments: partnerID);
        //         },
        //         child: Container(
        //           padding: EdgeInsets.all(4.r),
        //           alignment: Alignment.center,
        //           height: 60.h,
        //           width: 60.w,
        //           decoration:  BoxDecoration(
        //             shape: BoxShape.circle,
        //             color: AppColors.black50
        //             // gradient: AppColors.basicColor,
        //           ),
        //           child: CustomText(
        //             maxLines: 2,
        //             fontSize: 10.w,
        //             color: AppColors.blue,
        //             text: "Text",
        //           ),
        //         ),
        //       ),
        //     ),
        //   );
        // }),
      ],
    );
  }

  void onTap(int index) {
    if (index != bottomNavIndex) {
      switch (index) {
        case 0:
          context.pushNamed(RoutePath.homeScreen);
          break;
        case 1:
          // Get.to(() => const ChatScreen());
          context.pushNamed(RoutePath.chatScreen);
          break;
        case 2:
          // Get.to(() => CategoryScreen());
          context.pushNamed(RoutePath.categoryScreen);
          break;
        case 3:
          // Get.to(() => const PostScreen());
          context.pushNamed(RoutePath.postScreen);
          break;
        case 4:
          // Get.to(() => const ProfileScreen());
          context.pushNamed(RoutePath.profileScreen);
      }
    }
  }
}
