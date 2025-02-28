import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:trade_app/view/components/custom_dropdown/custom_dropdown.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/components/nav_bar/nav_bar.dart';
import 'package:trade_app/view/screens/setting_screen/change_language/language_controller.dart';

class LanguageScreen extends StatelessWidget {
  LanguageScreen({super.key});

  final LanguageController languageController = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      bottomNavigationBar: const NavBar(currentIndex: 4),

      ///========================Language appbar=============
      appBar: CustomAppBar(appBarContent: AppStrings.language.tr),
      body: Obx(
        () {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///===================Select Your Language Text==============
                const CustomText(
                  text: AppStrings.selectYourLanguage,
                  color: AppColors.black500,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  bottom: 10,
                ),
                ///==============Here the language dropdown code==============
                CustomDropdown(
                  title: 'language',
                  textColor: Colors.green,
                  controller: languageController.language,
                  isDropdownVisible: languageController.isLanguage.value,
                  onTap: () {
                    languageController.isLanguage.value =
                        !languageController.isLanguage.value;
                    languageController.update();
                  },
                  options: languageController.languageList,
                  onSelect: (index) {
                    if (index == 0) {
                      Get.updateLocale(const Locale("en", "US"));
                    } else {
                      Get.updateLocale(
                          const Locale("es", "ES")); // Change to Spanish
                    }
                    languageController.selectedCategory.value = index;
                    languageController.language.text =
                        languageController.languageList[
                            languageController.selectedCategory.value];
                    languageController.isLanguage.value = false;
                    languageController.isLanguage.refresh();
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
