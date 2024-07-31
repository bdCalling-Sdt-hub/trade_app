import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_icons/app_icons.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_image/custom_image.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/components/custom_text_field/custom_text_field.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(150.0), // Set a custom height
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 30),
            // Add horizontal margin
            padding: const EdgeInsets.only(top: 8.0),
            // Optional padding
            child: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: AppColors.blue500,
                ),
              ),
              title: CustomTextField(
                hintText: AppStrings.whatAreYouLookingFor,
              ),
              centerTitle: true,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///=================Top Search===========
              CustomText(
                fontSize: 16,
                text: AppStrings.topSearch.tr,
                fontWeight: FontWeight.w500,
                color: AppColors.black500,
                bottom: 15,
              ),
              Column(
                children: List.generate(5, (index) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      children: [
                        CustomImage(imageSrc: AppIcons.northEast),
                        CustomText(
                          left: 10,
                          text: 'Mobile Phones',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black500,
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ],
          ),
        ));
  }
}
