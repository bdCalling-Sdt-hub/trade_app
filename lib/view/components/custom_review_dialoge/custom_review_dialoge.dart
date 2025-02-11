import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:trade_app/controller/profile_controller.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_icons/app_icons.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_button/custom_button.dart';
import 'package:trade_app/view/components/custom_image/custom_image.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/components/custom_text_field/custom_text_field.dart';

class CustomReviewDialog extends StatefulWidget {
  const CustomReviewDialog({
    super.key,
    required this.swapId,
  });
  final String swapId;

  @override
  _CustomReviewDialogState createState() => _CustomReviewDialogState();
}

class _CustomReviewDialogState extends State<CustomReviewDialog> {
  double _rating = 0.0;
  ProfileController controller = Get.find<ProfileController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.white,
      content: SingleChildScrollView(
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
                    text: AppStrings.review.tr,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: AppColors.black500,
                    bottom: 15,
                  ),
                ],
              ),
            ),
            CustomText(
              text: AppStrings.rating.tr,
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: AppColors.black500,
              bottom: 15,
              top: 12,
            ),
            RatingBar.builder(
              itemSize: 30,
              initialRating: _rating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                setState(() {
                  _rating = rating;
                });
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.h),
              child: CustomText(
                text: 'Comments'.tr,
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: AppColors.black500,
                bottom: 15,
                top: 12,
              ),
            ),
            CustomTextField(
              textEditingController: controller.commentController,
              hintText: 'Write Your Review Here',
              fillColor: Colors.white,
              maxLines: 4,
            ),

            ///====================Submit Button===========
            controller.reviewLoading.value
                ? Align(
              alignment: Alignment.center,
              child: Lottie.asset('assets/lottie/loading.json',
                  width: context.width / 6, fit: BoxFit.cover),
            )
                :   Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: CustomButton(
                onTap: () {
                  print(_rating);
                  controller.reviewRating(
                      context: context, rating: _rating, swapId: widget.swapId);
                },
                title: AppStrings.submit,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
