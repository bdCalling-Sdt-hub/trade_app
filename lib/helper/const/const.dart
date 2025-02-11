import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';

class ConstValue {
  static indicator({required PageController controller, required int count}) =>
      SmoothPageIndicator(
        controller: controller,
        count: count,
        axisDirection: Axis.horizontal,
        effect: const ExpandingDotsEffect(
          expansionFactor: 2,
          spacing: 8.0,
          //radius: 4.0,
          dotWidth: 8.0,
          dotHeight: 8.0,
          paintStyle: PaintingStyle.fill,
          strokeWidth: 1.5,
          dotColor: AppColors.blue50,
          activeDotColor: AppColors.blue500,
        ),
      );
}
