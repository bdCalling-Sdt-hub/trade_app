import 'package:flutter/material.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';

class CustomOtherProfileLocation extends StatelessWidget {
  final String location;

  const CustomOtherProfileLocation({
    super.key,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.location_on_outlined,color: AppColors.blue500,),
        CustomText(
          left: 10,
          text: location,
          color: AppColors.black500,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ],
    );
  }
}
