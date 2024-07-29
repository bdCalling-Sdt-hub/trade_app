import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trade_app/core/app_routes/app_routes.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_icons/app_icons.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:trade_app/view/components/custom_profile_card/custom_profile_card.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/components/custom_text_field/custom_text_field.dart';
import 'package:trade_app/view/screens/change_language/language_controller.dart';

class SettingScreen extends StatelessWidget {
   SettingScreen({super.key});
  final LanguageController languageController = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,

      ///==================Setting Appbar===============
      appBar: CustomAppBar(
        appBarContent: AppStrings.settings.tr,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: SingleChildScrollView(
          child: Obx(
            () {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                   CustomText(text: AppStrings.general.tr,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: AppColors.black500,
                    bottom: 10,
                  ),

                  ///====================Account Info================
                  CustomProfileCard(
                    isCevron: true,
                    onTap: () {
                      Get.toNamed(AppRoutes.accountInfoScreen);
                    },
                    text: AppStrings.accountInfo.tr,
                    leadingIcon: AppIcons.person,
                  ),

                  ///====================Change Password================
                  CustomProfileCard(
                    isCevron: true,
                    onTap: () {
                      Get.toNamed(AppRoutes.changePasswordScreen);
                    },
                    text: AppStrings.changePassword.tr,
                    leadingIcon: AppIcons.key,
                  ),


                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: EdgeInsets.only(top: 8.h),
                          child: customRow(
                              onTap: () {},
                              title: 'Language'.tr,
                              imageColor: Theme.of(context).primaryColorDark,
                              textColor: Theme.of(context).primaryColorDark),
                        ),
                      ),
                      //   SizedBox(width: 44.w,),

                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 44,
                              child: CustomTextField(
                                onTap: () {
                                  languageController.isLanguage.value =
                                  !languageController.isLanguage.value;
                                  languageController.update();
                                },
                                readOnly: true,
                                textEditingController: languageController.language,
                                textInputAction: TextInputAction.done,
                                hintText: 'language',
                                fillColor: Colors.red,
                                fieldBorderColor: Colors.red,
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: languageController.isLanguage.value
                                      ? const Icon(Icons.keyboard_arrow_down_sharp)
                                      : const Icon(Icons.keyboard_arrow_down_sharp,color: Colors.white,),
                                ),
                              ),
                            ),

                            ///<========================= dropdown ============================>
                            languageController.isLanguage.value
                                ? Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).cardColor,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: List.generate(
                                      languageController.languageList.length,
                                          (index) => GestureDetector(
                                        onTap: () {
                                          // if (index == 0) {
                                          //   Get.updateLocale(
                                          //       const Locale("en", "US"));
                                          // } else {
                                          //   Get.updateLocale(
                                          //       const Locale("fr", "CA"));
                                          // }
                                          if (index == 0) {
                                            Get.updateLocale(const Locale("en", "US"));
                                          } else {
                                            Get.updateLocale(const Locale("es", "ES")); // Change to Spanish
                                          }
                                          languageController.selectedCategory.value =
                                              index;
                                          languageController.language.text =
                                          languageController.languageList[languageController
                                              .selectedCategory.value];
                                          languageController.isLanguage.value =
                                          false;
                                          languageController.isLanguage.refresh();
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            decoration: const BoxDecoration(),
                                            child: CustomText(
                                              text: languageController.languageList[index],
                                              fontWeight: FontWeight.w500,
                                              bottom: 4.h,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )),
                            )
                                : const SizedBox(),

                          ],
                        ),
                      ),
                    ],
                  ),
                  ///====================Address================
                  CustomProfileCard(
                    isCevron: true,
                    onTap: () {
                      Get.toNamed(AppRoutes.addressScreen);
                    },
                    text: AppStrings.addresss.tr,
                    leadingIcon: AppIcons.myLocation,
                  ),

                  ///====================termsAndConditions================
                  CustomProfileCard(
                    isCevron: true,
                    onTap: () {
                      Get.toNamed(AppRoutes.termsAndConditionScreen);
                    },
                    text: AppStrings.termsAndConditions.tr,
                    leadingIcon: AppIcons.report,
                  ),

                  ///====================privacyPolicy================
                  CustomProfileCard(
                    isCevron: true,
                    onTap: () {
                      Get.toNamed(AppRoutes.privacyPolicyScreen);
                    },
                    text: AppStrings.privacyPolicy.tr,
                    leadingIcon: AppIcons.verifiedUser,
                  ),

                  ///====================helpCenter================
                  CustomProfileCard(
                    isCevron: true,
                    onTap: () {
                      Get.toNamed(AppRoutes.helpCenterScreen);
                    },
                    text: AppStrings.helpCenter.tr,
                    leadingIcon: AppIcons.help,
                  ),
                ],
              );
            }
          ),
        ),
      ),
    );
  }


  Widget customRow(
      {
        required String title,
        required Color imageColor,
        required Color textColor,
        required VoidCallback onTap}) =>
      GestureDetector(
        onTap: () {
          onTap();
        },
        child: Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: Row(
            children: [

              CustomText(
                color: textColor,
                left: 16,
                text: title,
                fontSize: 16.w,
                fontWeight: FontWeight.w400,
              )
            ],
          ),
        ),
      );
}
