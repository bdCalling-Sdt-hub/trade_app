import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:trade_app/global/error_screen/error_screen.dart';
import 'package:trade_app/global/no_internet/no_internet.dart';
import 'package:trade_app/service/api_url.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_const/app_const.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:trade_app/view/components/custom_details_container/custom_details_container.dart';
import 'package:trade_app/view/components/custom_loader/custom_loader.dart';
import 'package:trade_app/view/components/custom_rating_card/custom_rating_card.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/components/nav_bar/nav_bar.dart';
import 'package:trade_app/view/screens/terms_and_condition_screen/terms_condition_controller.dart';

class MyRatingScreen extends StatelessWidget {
  TermsConditionController controller = Get.find<TermsConditionController>();

  MyRatingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white50,
        bottomNavigationBar: const NavBar(currentIndex: 4),

        ///========================myRatingAndComments Appbar==============
        appBar: CustomAppBar(
          appBarContent: AppStrings.myRatingAndComments.tr,
        ),
        body: Obx(() {
          switch (controller.rxRequestStatus.value) {
            case Status.loading:
              return const CustomLoader();
            case Status.internetError:
              return NoInternetScreen(
                onTap: () {
                  controller.getRating(context: context);
                },
              );
            case Status.error:
              return GeneralErrorScreen(
                onTap: () {
                  controller.getRating(context: context);
                },
              );
            case Status.noDataFound:
              return Center(
                child: CustomText(text: AppStrings.noDataFound),
              );
            case Status.completed:
              return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomDetailContainer(
                            color: AppColors.white200,
                            child: Row(
                              children: [
                                CustomText(
                                  textAlign: TextAlign.start,
                                  text: AppStrings.overallRating.tr,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: AppColors.black500,
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                CustomText(
                                  textAlign: TextAlign.start,
                                  text:
                                      ' ${controller.myRatingModel.value.data?.averageRating ?? 0.0}/5.0'
                                          .tr,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: AppColors.black500,
                                ),
                              ],
                            )),
                        CustomText(
                          textAlign: TextAlign.start,
                          text: AppStrings.allRatingAndComments.tr,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: AppColors.black500,
                          bottom: 19,
                        ),
                        controller.ratingList.isEmpty
                            ? Center(
                                child: CustomText(
                                  text: 'No Data Found',
                                  fontWeight: FontWeight.w500,
                                  top: 200.h,
                                ),
                              )
                            : Column(
                                children: List.generate(
                                    controller.ratingList.length, (index) {
                                  return CustomRatingCard(
                                    name: controller.ratingList.value[index]
                                            .swapOwner?.name ??
                                        "",
                                    date: DateFormat('yMMMd').format(controller
                                        .ratingList
                                        .value[index]
                                        .swapOwner!
                                        .createdAt!
                                        .toLocal()),
                                    imageUrl:
                                        '${ApiUrl.baseUrl}${controller.ratingList.value[index].swapOwner?.profileImage ?? ""}',
                                    rating: (controller.ratingList.value[index]
                                                .ratting ??
                                            0.0)
                                        .toInt(),
                                    review: controller
                                            .ratingList.value[index].comment ??
                                        "",
                                  );
                                }),
                              )
                      ],
                    ),
                  ));
          }
        }));
  }
}
