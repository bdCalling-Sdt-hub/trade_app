import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:trade_app/controller/profile_controller.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_icons/app_icons.dart';
import 'package:trade_app/view/components/custom_button/custom_button.dart';
import 'package:trade_app/view/components/custom_details_container/custom_details_container.dart';
import 'package:trade_app/view/components/custom_image/custom_image.dart';
import 'package:trade_app/view/components/custom_loader/custom_loader.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/components/custom_text_field/custom_text_field.dart';

class ReportPopup extends StatelessWidget {
  ReportPopup({super.key, required this.againstUser, required this.swapId});
  final String againstUser;
  final String swapId;
  ProfileController controller = Get.find<ProfileController>();
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
                      icon: const CustomImage(
                        imageSrc: AppIcons.closeSmall,
                        imageType: ImageType.svg,
                      ))
                ],
              ),

              Center(
                child: Column(
                  children: [
                    CustomText(
                      text: "Report",
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: AppColors.black500,
                      bottom: 15,
                    ),
                  ],
                ),
              ),

              CustomText(
                text: 'Report',
                bottom: 4.h,
              ),

              ///<======================== text-field =====================>
              CustomTextField(
                maxLines: 8,
                textEditingController: controller.reportController,
              ),

              ///<======================== Upload image =====================>
              GestureDetector(
                onTap: controller.pickMultiImage,
                child: CustomDetailContainer(
                  isBorder: true,
                  height: 50,
                  weight: double.infinity,
                  color: AppColors.white200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add, color: AppColors.blue),
                      CustomText(
                        text: 'Upload',
                        color: AppColors.blue,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.h),

              ///<======================== image =====================>
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    controller.selectedImagesMulti.length,
                        (index) {
                      final imageFile = controller.selectedImagesMulti[index];

                      return Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 5.h, horizontal: 5.w),
                            height: 100.h,
                            width: 100.w,
                            // Set a width for the image container
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: FileImage(imageFile),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 5,
                            right: 5,
                            child: GestureDetector(
                              onTap: () {
                                controller.selectedImagesMulti.removeAt(index);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.red.withOpacity(0.8),
                                ),
                                child: const Icon(
                                  Icons.cancel,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),

              controller.reportLoading.value
                  ? Align(
                alignment: Alignment.center,
                child: Lottie.asset('assets/lottie/loading.json',
                    width: context.width / 6, fit: BoxFit.cover),
              )
                  : CustomButton(
                onTap: () {
                  controller.reportAdd(
                      context: context,
                      swapId: swapId,
                      againstUser: againstUser);
                },
                title: "Submit",
              )
            ],
          ),
        ),
      );
    });
  }
}
