import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/view/components/custom_expended_section/custom_expended_section.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';

class CustomHelpQuestion extends StatelessWidget {
  CustomHelpQuestion({super.key, required this.faqList});

  final List<Map<String, String>> faqList;
 final RxInt selectedFqw = 100000.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        children: List.generate(faqList.length, (index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 15.h),
            child: Column(
              children: [
                ///==================== Question Design =====================
                GestureDetector(
                  onTap: () {
                    if (selectedFqw.value == index) {
                      selectedFqw.value = 100000;
                    } else {
                      selectedFqw.value = index;
                    }

                    selectedFqw.refresh();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.white50,
                        border: Border.all(color: AppColors.gray300)),
                    child: Row(
                      children: [
                        Expanded(
                            child: CustomText(
                              textAlign: TextAlign.left,
                              text: faqList[index]["que"]!,
                              fontWeight: FontWeight.w500,
                            )),
                        IconButton(
                            onPressed: () {
                              if (selectedFqw.value == index) {
                                selectedFqw.value = 100000;
                              } else {
                                selectedFqw.value = index;
                              }

                              selectedFqw.refresh();
                            },
                            icon: selectedFqw.value == index
                                ? const Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: AppColors.black500,
                            )
                                : const Icon(
                              Icons.keyboard_arrow_right_rounded,
                              color: AppColors.blue,
                            ))
                      ],
                    ),
                  ),
                ),

                ///==================== Ans Design =====================

                index == selectedFqw.value
                    ? CustomExpandedSection(
                    expand: index ==selectedFqw.value
                        ? true
                        : false,
                    child: Container(
                      margin: const EdgeInsets.only(top: 8),
                      padding: EdgeInsets.all(8.r),
                      alignment: Alignment.center,
                      height: 100.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.white500,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: CustomText(
                        textAlign: TextAlign.left,
                        text: faqList[index]["ans"]!,
                        maxLines: 6,
                      ),
                    ))
                    : const SizedBox()
              ],
            ),
          );
        }),
      );
    });
  }
}