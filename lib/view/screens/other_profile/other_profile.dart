import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trade_app/global/error_screen/error_screen.dart';
import 'package:trade_app/global/no_internet/no_internet.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_const/app_const.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:trade_app/view/components/custom_details_container/custom_details_container.dart';
import 'package:trade_app/view/components/custom_loader/custom_loader.dart';
import 'package:trade_app/view/components/custom_my_products/custom_my_product.dart';
import 'package:trade_app/view/components/custom_other_profile_date/custom_other_profile_date.dart';
import 'package:trade_app/view/components/custom_other_profile_header/custom_other_profile_header.dart';
import 'package:trade_app/view/components/custom_other_profile_location/custom_other_profile_location.dart';
import 'package:trade_app/view/components/custom_rating_card/custom_rating_card.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/screens/swap_request_screen/swap_request_controller.dart';

class OtherProfile extends StatefulWidget {
  const OtherProfile({super.key, required this.partnerId});
  final String partnerId;

  @override
  // ignore: library_private_types_in_public_api
  _OtherProfileState createState() => _OtherProfileState();
}

class _OtherProfileState extends State<OtherProfile> {
  bool _isExpanded = false;
  SwapRequestController controller=Get.find<SwapRequestController>();

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
       controller.getPartnerProfile(partnerId: widget.partnerId,context: context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,

      ///======================Other Profile Appbar============
      appBar: const CustomAppBar(
        appBarContent: 'Zahid ',
      ),
      body: Obx(() {
        switch (controller.rxRequestStatus.value) {
          case Status.loading:
            return const CustomLoader();
          case Status.internetError:
            return NoInternetScreen(
              onTap: () {
                controller.getPartnerProfile(context: context, partnerId: widget.partnerId);
              },
            );
          case Status.error:
            return GeneralErrorScreen(
              onTap: () {
                controller.getPartnerProfile(context: context, partnerId: widget.partnerId);
              },
            );
          case Status.noDataFound:
            return Center(
              child: CustomText(text: AppStrings.noDataFound),
            );
          case Status.completed:
            var partnerProfileModel = controller.partnerProfileModel.value;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomDetailContainer(
                      isBorder: true,
                      color: AppColors.white200,
                      child: Column(
                        children: [
                          CustomOtherProfileHeader(
                            imageUrl: AppConstants.userNtr,
                            name: partnerProfileModel.data?.profile?.name ?? "",
                            rating: 4.5,
                            membershipStatus: 'Gold',
                          ),
                          SizedBox(height: 10.h),
                          const CustomOtherProfileLocation(
                            location: '47 W ,13th Street, New York',
                          ),
                          SizedBox(height: 10.h),
                          const CustomOtherProfileDate(
                            memberSince: 'Nov, 2022',
                            lastSiteVisit: '24 Jun, 2024',
                          ),
                        ],
                      ),
                    ),

                    ///=====================Available Items for Swap===============
                    const CustomText(
                      text: AppStrings.availableItemsForSwap,
                      color: AppColors.black500,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(height: 20.h),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(4, (index) {
                          return CustomMyProduct(
                            isMargin: true,
                            image: AppConstants.electronics,
                            name: 'OnePlus V2 Android Smart LED TV',
                            onTap: () {},
                            value: '\$768',
                            editOnTap: () {},
                          );
                        }),
                      ),
                    ),
                    SizedBox(height: 20.h),

                    ///=====================Rating and Comments===============
                    const CustomText(
                      text: AppStrings.ratingAndComments,
                      color: AppColors.black500,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    Column(
                      children: List.generate(_isExpanded ? 10 : 3, (index) {
                        return CustomRatingCard(
                          name: 'Sakib',
                          date: '12/06/24',
                          imageUrl: AppConstants.userNtr,
                          rating: 5,
                          review:
                          'I highly recommend this swapper for anyone in need of a'
                              ' reliable service. My overall experience with it'
                              ' has been exceptionally positive.',
                        );
                      }),
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: _toggleExpanded,
                        child: CustomDetailContainer(
                          color: AppColors.white50,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomText(
                                text: _isExpanded ? 'ViewLess' : AppStrings.viewAll,
                                color: AppColors.blue500,
                              ),
                              Icon(
                                _isExpanded
                                    ? Icons.keyboard_arrow_up_rounded
                                    : Icons.keyboard_arrow_down_rounded,
                                color: AppColors.blue500,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
        }
      }),
    );
  }
}
