import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trade_app/core/app_routes/app_routes.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_const/app_const.dart';
import 'package:trade_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/components/nav_bar/nav_bar.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      ///=========================Inbox appbar===============
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back),
          color:Colors.white,
        ),
        backgroundColor: Colors.cyanAccent,
        title: const CustomText(
          text: "Inbox",
          fontWeight: FontWeight.w600,
          fontSize: 16,
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: const NavBar(currentIndex: 1),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.toNamed(AppRoutes.messageScreen);
            },
            child: Container(
              padding: EdgeInsets.all(20.r),
              child: ListTile(
                ///<=================== This is the  image section ==========================>

                leading: CustomNetworkImage(
                    boxShape: BoxShape.circle,
                    imageUrl: AppConstants.userNtr,
                    height: 40.h,
                    width: 40.w),

                ///<=========================== This is the title ==================>

                title: const CustomText(
                  textAlign: TextAlign.start,
                  text: "Heaven Salon",
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),

                ///<=========================== This is the subtitle ==================>

                subtitle: const CustomText(
                  textAlign: TextAlign.start,
                  text: "Currently we have big discount offer.",
                  fontSize: 12,
                  maxLines: 2,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),

                ///<============== This is the time ========================>

                trailing: const CustomText(
                  text: "3.25 PM",
                  color:Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
