import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:trade_app/controller/profile_controller.dart';
import 'package:trade_app/view/components/custom_button/custom_button.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/screens/authentication/auth_controller/auth_controller.dart';

import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/app_icons/app_icons.dart';
import '../../components/custom_image/custom_image.dart';
import '../../components/custom_text_field/custom_text_field.dart';

class DeletePopup extends StatelessWidget {
  DeletePopup();

  AuthController controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Obx((){
      return AlertDialog(
        backgroundColor: AppColors.white,
        content:  SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        context.pop();
                      },
                      icon: CustomImage(
                        imageSrc: AppIcons.closeSmall,
                        imageType: ImageType.svg,
                      ))
                ],
              ),

              SizedBox(height: controller.size.value.toDouble(),),

              ///<======================== text-field =====================>
              CustomText(text: 'Password',bottom: 8.h,),
              CustomTextField(
                textEditingController: controller.passWordSignIn,
              ),

              SizedBox(height: 12.h,),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: (){
                        context.pop();
                      },
                      child: Container(
                        padding: EdgeInsets.only(top: 4.h,bottom: 4.h),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.blue),
                          borderRadius: BorderRadius.circular(8.sp)
                        ),
                        child: CustomText(text: 'No'),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    flex: 1,
                    child:GestureDetector(
                      onTap: (){
                        controller.deleteAccount(context: context);
                        context.pop();
                      },
                      child: Container(
                        padding: EdgeInsets.only(top: 4.h,bottom: 4.h),
                        decoration: BoxDecoration(
                            color: AppColors.blue,
                            borderRadius: BorderRadius.circular(8.sp)
                        ),
                        child: CustomText(text: 'Yes',color: Colors.white,),
                      ),
                    ),
                  ),
                ],
              )


            ],
          ),
        ),
      );
    });
  }
}