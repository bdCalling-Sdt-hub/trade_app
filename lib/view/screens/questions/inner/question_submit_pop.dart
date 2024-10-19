import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:trade_app/core/app_routes/app_routes.dart';
import 'package:trade_app/core/routes/route_path.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';

class QuestionSubmitPop extends StatefulWidget {
  const QuestionSubmitPop({super.key});

  @override
  State<QuestionSubmitPop> createState() => _QuestionSubmitPopState();
}

class _QuestionSubmitPopState extends State<QuestionSubmitPop> {
  navigate() async {
    Future.delayed(const Duration(seconds: 2), () {
       context.pushNamed(RoutePath.homeScreen);
    });
  }

  @override
  void initState() {
    navigate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      content: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(16.sp),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.sp)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon:const Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                ),
              ),
              CustomText(text: AppStrings.thankYou,fontSize: 18.h,fontWeight: FontWeight.w500,),
              CustomText(
                maxLines: 4,
                text: AppStrings.youSuccess,top: 16.h,),
            ],
          ),
        ),
      ),
    );
  }
}
