import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trade_app/core/app_routes/app_routes.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_icons/app_icons.dart';
import 'package:trade_app/utils/app_images/app_images.dart';
import 'package:trade_app/view/components/custom_image/custom_image.dart';

class SplashScreen extends StatefulWidget {
    SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  navigate() async {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed(AppRoutes.signInScreen);
    });
  }
  @override
  void initState() {
    navigate();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue500,
      body: Center(
        child: CustomImage(imageSrc: AppImages.logo,imageType: ImageType.png,sizeWidth: 300.w,),
      ),
    );
  }
}
