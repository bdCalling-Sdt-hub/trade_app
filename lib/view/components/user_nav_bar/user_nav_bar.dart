// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
//
// class UserNavBar extends StatefulWidget {
//   final int currentIndex;
//
//   const UserNavBar({required this.currentIndex, super.key});
//
//   @override
//   State<UserNavBar> createState() => _UserNavBarState();
// }
//
// class _UserNavBarState extends State<UserNavBar> {
//   late int bottomNavIndex;
//
//   final List<String> unselectedIcon = [
//     AppIcons.userHomeUnSelected,
//     AppIcons.userTripUnselected,
//     AppIcons.userMessageUnSelected,
//     AppIcons.userProfileUnSelected,
//   ];
//
//   final List<String> selectedIcon = [
//     AppIcons.userHomeUnSelected,
//     AppIcons.userTripUnselected,
//     AppIcons.userMessageUnSelected,
//     AppIcons.userProfileUnSelected,
//   ];
//
//   final List<String> userNavText = [
//     'Home',
//     'Trip',
//     'Message',
//     'Profile',
//   ];
//
//   @override
//   void initState() {
//     bottomNavIndex = widget.currentIndex;
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.white,
//       height: 66.h,
//
//       width: MediaQuery.of(context).size.width,
//       padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 7.h),
//       alignment: Alignment.center,
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: List.generate(
//           unselectedIcon.length,
//           (index) => InkWell(
//             onTap: () => onTap(index),
//             child: Container(
//               padding: EdgeInsets.symmetric(
//
//                 horizontal: 15.w,
//               ),
//               decoration: BoxDecoration(
//                 color: index == bottomNavIndex
//                     ? AppColors.darkBlue
//                     : null,
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SvgPicture.asset(
//                     index == bottomNavIndex
//                         ? selectedIcon[index]
//                         : unselectedIcon[index],
//                     height: 24.h,
//                     width: 24.w,
//                     color: index == bottomNavIndex?
//                     AppColors.appBarBackground:
//                     AppColors.black,
//                   ),
//                   SizedBox(height: 4.h),
//                   CustomText(
//                     text: userNavText[index],
//                     color: index == bottomNavIndex
//                         ? AppColors.appBarBackground
//                         : Colors.black,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   void onTap(int index) {
//     if (index != bottomNavIndex) {
//       switch (index) {
//         case 0:
//           Get.offAll(() => HomeScreen());
//           break;
//         case 1:
//           Get.to(() =>  TripScreen());
//           break;
//         case 2:
//           Get.to(() => const InboxScreen());
//           break;
//         case 3:
//           Get.to(() => ProfileScreen());
//           break;
//       }
//     }
//   }
// }
