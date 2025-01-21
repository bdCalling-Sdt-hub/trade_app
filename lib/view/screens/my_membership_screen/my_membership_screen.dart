import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:trade_app/controller/membership_controller/membership_controller.dart';
import 'package:trade_app/controller/profile_controller.dart';

import 'package:trade_app/core/routes/route_path.dart';
import 'package:trade_app/global/error_screen/error_screen.dart';
import 'package:trade_app/global/no_internet/no_internet.dart';
import 'package:trade_app/service/api_url.dart';
import 'package:trade_app/utils/ToastMsg/toast_message.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_const/app_const.dart';
import 'package:trade_app/utils/app_icons/app_icons.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:trade_app/view/components/custom_button/custom_button.dart';
import 'package:trade_app/view/components/custom_details_container/custom_details_container.dart';
import 'package:trade_app/view/components/custom_image/custom_image.dart';
import 'package:trade_app/view/components/custom_loader/custom_loader.dart';
import 'package:trade_app/view/components/custom_membership_profile_card/custom_membership_profile_card.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/components/nav_bar/nav_bar.dart';
import 'package:trade_app/view/screens/my_membership_screen/payment_controller/payment_controller.dart';

class MyMembershipScreen extends StatefulWidget {
  MyMembershipScreen({super.key});

  @override
  State<MyMembershipScreen> createState() => _MyMembershipScreenState();
}

class _MyMembershipScreenState extends State<MyMembershipScreen> {
  final MembershipController membershipController =
      Get.find<MembershipController>();

  final PaymentController controller = Get.find<PaymentController>();
  final ProfileController profileController = Get.find<ProfileController>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      membershipController.getMemberShipProfile(
          userId: profileController.profileModel.value.data?.result?.id ?? "",
          context: context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      bottomNavigationBar: const NavBar(currentIndex: 4),

      ///=============== ===myMembership Appbar===============
      appBar: CustomAppBar(
        appBarContent: AppStrings.myMembership.tr,
      ),
      body: RefreshIndicator(
        onRefresh: ()async{
          await  membershipController.getMemberShipProfile(
              context: context,
              userId: profileController
                  .profileModel.value.data?.result?.id ??
                  "");
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: SingleChildScrollView(
            child: Obx(() {
              switch (membershipController.rxRequestStatus.value) {
                case Status.loading:
                  return const CustomLoader();
                case Status.internetError:
                  return NoInternetScreen(
                    onTap: () {
                      membershipController.getMemberShipProfile(
                          context: context,
                          userId: profileController
                                  .profileModel.value.data?.result?.id ??
                              "");
                    },
                  );
                case Status.error:
                  return GeneralErrorScreen(
                    onTap: () {
                      membershipController.getMemberShipProfile(
                          context: context,
                          userId: profileController
                                  .profileModel.value.data?.result?.id ??
                              "");
                    },
                  );
                case Status.noDataFound:
                  return Center(
                    child: CustomText(text: AppStrings.noDataFound),
                  );
                case Status.completed:
                  var data = membershipController.memberShipProfileModel.value;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///======================Header Card==================
                      membershipController.isLoader.value
                          ? const CustomLoader()
                          : CustomMembershipProfileCard(
                              imageUrl:data.data?.profile?.profileImage
                                  ?.startsWith('https') ??
                                  false
                                  ?data.data?.profile?.profileImage ?? "":
                                  '${ApiUrl.baseUrl}${data.data?.profile?.profileImage ?? ""}',
                              name: data.data?.profile?.name ?? "",
                              membershipStatus:
                                  data.data?.profile?.userType ?? "",
                              controller: membershipController,
                              onTap: () {
                                context
                                    .pushNamed(RoutePath.membershipDetailsScreen);
                              },
                              points: (data.data?.profile?.points ?? 0),
                            ),

                      ///=======================Total Points Earn=============
                      GestureDetector(
                        onTap: () {
                          context.pushNamed(RoutePath.pointsEarnedScreen);
                        },
                        child: CustomDetailContainer(
                          isBorder: true,
                          color: AppColors.white200,
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: AppStrings.totalPointsEarn.tr,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: AppColors.gray900,
                                  ),
                                  CustomText(
                                    text: (data.data?.point ?? 0).toString(),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                    color: AppColors.blue500,
                                    bottom: 10,
                                  ),
                                ],
                              ),
                              const Spacer(),
                              const CustomImage(
                                  imageSrc: AppIcons.arrowForwardIos),
                            ],
                          ),
                        ),
                      ),

                      ///============================Monthly Subscription fee card========================
                      CustomDetailContainer(
                        isBorder: true,
                        color: AppColors.white200,
                        child: Column(
                          children: [
                            CustomText(
                              text: AppStrings.monthlySubscriptionFee.tr,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: AppColors.gray900,
                            ),
                            CustomText(
                              text: '\$${data.data?.plan?.amount ?? 0}',
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              color: AppColors.blue500,
                              bottom: 10,
                            ),

                            ///<============================== pay now button ======================== >
                            data.data?.plan?.status == "approved" ?
                            CustomButton(
                                    onTap: () {
                                      controller.makePayment(
                                          amount: data.data?.plan?.amount ?? 0,
                                          context: context,
                                          userId: profileController.profileModel
                                                  .value.data?.result?.id ??
                                              "",
                                          planId: data.data?.plan?.id ?? "",
                                          subscriptionId:
                                              data.data?.plan?.planId?.id ?? "");
                                    },
                                    title: AppStrings.payNow.tr,
                                  )
                                : CustomButton(
                                    onTap: () {
                                      toastMessage(message: 'Waiting for admin approval',color: Colors.red);
                                    },
                                    fillColor: Colors.grey,
                                    title: AppStrings.payNow,
                                  ),
                            CustomText(
                              textAlign: TextAlign.start,
                              text: AppStrings.payYourSubscriptionFeeInTime.tr,
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: AppColors.gray900,
                              bottom: 10,
                              top: 10,
                              maxLines: 2,
                            ),
                          ],
                        ),
                      ),

                      ///=========================Your Member ship benefits==================
                      CustomText(
                        text: AppStrings.yourMembershipBenefits.tr,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: AppColors.black500,
                        bottom: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                            membershipController.membershipItem.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              children: [
                                CustomImage(
                                  imageSrc: AppIcons.checkCircle,
                                  size: 20.sp,
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Expanded(
                                  child: CustomText(
                                    textAlign: TextAlign.start,
                                    text: membershipController.membershipItem[index],
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.sp,
                                    maxLines: 2,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                    ],
                  );
              }
            }),
          ),
        ),
      ),
    );
  }
}
