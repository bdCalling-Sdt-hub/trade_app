import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trade_app/controller/profile_controller.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:trade_app/view/components/custom_button/custom_button.dart';
import 'package:trade_app/view/components/custom_from_card/custom_from_card.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';

class AddressScreen extends StatelessWidget {
  AddressScreen({super.key});

  final ProfileController profileController = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,

      ///==================Terms And Condition Appbar===============
      appBar: CustomAppBar(
        appBarContent: AppStrings.addresss.tr,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: AppStrings.fillUpYourAddressDetails.tr,
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: AppColors.black500,
                bottom: 10,
              ),

              ///========================Country===============
              Obx(() => CustomFromCard(
                    readOnly: true,
                    onTap: () {
                      showCountryPicker(
                        context: context,
                        showPhoneCode: true,
                        onSelect: (Country country) {
                          profileController.updateCountry(country.name);
                          profileController.countryController.text =
                              country.name;
                        },
                      );
                    },
                    isIcon: true,
                    title: AppStrings.country.tr,
                    controller: TextEditingController(
                        text: profileController.selectedCountry.value),
                  )),

              ///========================City===============
              CustomFromCard(
                  title: AppStrings.city.tr,
                  controller: profileController.cityController),

              ///========================Zip Code===============
              CustomFromCard(
                  title: AppStrings.zipCode.tr,
                  controller: profileController.zipCodeController),

              ///========================Street Address===============
              CustomFromCard(
                  title: AppStrings.streetAddress.tr,
                  controller: profileController.addressController),

              SizedBox(
                height: 20.h,
              ),

              ///==========================Update button==============
              CustomButton(
                onTap: () {
                  Get.back();
                },
                title: AppStrings.update.tr,
              )
            ],
          ),
        ),
      ),
    );
  }
}
