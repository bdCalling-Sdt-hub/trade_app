import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_images/app_images.dart';
import 'package:trade_app/view/components/custom_image/custom_image.dart';

class SplashScreen extends StatelessWidget {
    const SplashScreen({super.key});

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
