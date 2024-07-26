import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trade_app/controller/profile_controller.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:trade_app/view/components/custom_button/custom_button.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/components/custom_text_field/custom_text_field.dart';

class AddressScreen extends StatelessWidget {
   AddressScreen({super.key});


  final ProfileController profileController = Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,

      ///==================Terms ANd Condition Appbar===============
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
              customAddressCart(
                  readOnly: true,
                onTap: (){
                  print(' This is Tap================');
                },
                isIcon: true,
                  title: AppStrings.country.tr,
                  controller: profileController.cityController),

              ///========================City===============
              customAddressCart(
                  title: AppStrings.city.tr,
                  controller: profileController.cityController),

              ///========================Zip Code===============
              customAddressCart(
                  title: AppStrings.zipCode.tr,
                  controller: profileController.cityController),

              ///========================Street Address===============
              customAddressCart(
                  title: AppStrings.streetAddress.tr,
                  controller: profileController.cityController),


              SizedBox(
                height: 20.h,
              ),
              ///==========================Update button==============
              CustomButton(
                  onTap: (){
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
   Widget customAddressCart({
     required String title,
     required TextEditingController controller,
     bool isPassword = false,
     bool isIcon = false,
     bool readOnly = false,
     VoidCallback? onTap,
   }) {
     return Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         CustomText(
           color: AppColors.black500,
           text: title,
           fontWeight: FontWeight.w500,
           fontSize: 16.w,
           bottom: 8,
         ),
         CustomTextField(
           readOnly: readOnly,
           suffixIcon: isIcon ? const Icon(Icons.keyboard_arrow_down) : null,
           isPassword: isPassword,
           textEditingController: controller,
           inputTextStyle: const TextStyle(color: AppColors.black500),
           fillColor: AppColors.white200,
           fieldBorderColor: AppColors.gray201,
           keyboardType: isPassword ? TextInputType.phone : TextInputType.name,
           onTap: onTap,
         ),
         SizedBox(
           height: 15.h,
         ),
       ],
     );
   }
}
