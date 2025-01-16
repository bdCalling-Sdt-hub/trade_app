import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trade_app/controller/profile_controller.dart';

import 'package:trade_app/core/routes/route_path.dart';
import 'package:trade_app/global/error_screen/error_screen.dart';
import 'package:trade_app/global/general_controller/general_controller.dart';
import 'package:trade_app/global/no_internet/no_internet.dart';
import 'package:trade_app/helper/prefs_helper/prefs_helper.dart';
import 'package:trade_app/service/api_url.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_const/app_const.dart';
import 'package:trade_app/utils/app_icons/app_icons.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:trade_app/view/components/custom_loader/custom_loader.dart';
import 'package:trade_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:trade_app/view/components/custom_profile_card/custom_profile_card.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/components/nav_bar/nav_bar.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ProfileScreen extends StatefulWidget {
    ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
    final ProfileController controller = Get.find<ProfileController>();
    final GeneralController generalController = Get.find<GeneralController>();

    String? _savedVideoUrl;
    YoutubePlayerController? _youtubeController;
    bool _isPlaying = true;


    @override
    void initState() {
      super.initState();
      //_loadSavedUrl();
    }

    // void _togglePlayPause() {
    //   if (_youtubeController != null) {
    //     if (_isPlaying) {
    //       _youtubeController!.pause();
    //     } else {
    //       _youtubeController!.play();
    //     }
    //     setState(() {
    //       _isPlaying = !_isPlaying; // Toggle play state
    //     });
    //   }
    // }
    // // Load the saved URL from SharedPreferences
    // Future<void> _loadSavedUrl() async {
    //   SharedPreferences prefs = await SharedPreferences.getInstance();
    //   setState(() {
    //     _savedVideoUrl = prefs.getString('youtube_url');
    //     if (_savedVideoUrl != null) {
    //       _initializePlayer(_savedVideoUrl!);
    //     }
    //   });
    // }
    //
    //
    // // Initialize the YouTube player for audio playback
    // void _initializePlayer(String url) {
    //   final videoId = YoutubePlayer.convertUrlToId(url);
    //   if (videoId != null) {
    //     // _youtubeController?.dispose(); // Dispose the previous controller if any
    //     _youtubeController = YoutubePlayerController(
    //       initialVideoId: videoId,
    //       flags: YoutubePlayerFlags(
    //         autoPlay: false,
    //         mute: false,
    //         hideThumbnail: true, // Hide thumbnail to avoid showing visuals
    //         controlsVisibleAtStart: false, // Hide video controls
    //         disableDragSeek: true, // Disable seeking
    //         loop: true, // Enable looping video
    //         showLiveFullscreenButton: false, // Disable fullscreen button
    //         enableCaption: false, // Disable captions
    //       ),
    //     );
    //     setState(() {
    //       _isPlaying =false;
    //     }); // Update the state to reflect the new controller
    //   }
    // }
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){
      //     generalController.togglePlayPause;
      //     _isPlaying =! _isPlaying;
      //   },
      //   child: Icon(
      //     _isPlaying ? Icons.pause_circle : Icons.play_circle,
      //   ),
      // ),
      backgroundColor: AppColors.white,
      bottomNavigationBar: const NavBar(currentIndex: 4),

      ///==================My Profile Appbar===============
      appBar: CustomAppBar(
        appBarContent: AppStrings.myProfile.tr,
      ),
      body: Obx(() {
        switch (controller.rxRequestStatus.value) {
          case Status.loading:
            return const CustomLoader();
          case Status.internetError:
            return NoInternetScreen(
              onTap: () {
                controller.getProfile(context: context);
              },
            );
          case Status.error:
            return GeneralErrorScreen(
              onTap: () {
                controller.getProfile(context: context);
              },
            );
          case Status.noDataFound:
            return Center(
              child: CustomText(text: AppStrings.noDataFound),
            );
          case Status.completed:
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ///===================Profile Image================
                    CustomNetworkImage(
                        borderRadius: BorderRadius.circular(100.r),
                        imageUrl: controller.profileModel.value.data?.result?.profileImage
                            ?.startsWith('https') ??
                            false
                            ? controller.profileModel.value.data?.result?.profileImage ??
                            ""
                            : '${ApiUrl.baseUrl}${controller.profileModel.value.data?.result?.profileImage?? ""}',
                        height: 85.h,
                        width: 85.w),

                    ///=======================Name=================
                    CustomText(
                      text: controller.profileModel.value.data?.result?.name?? "",
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: AppColors.black500,
                    ),

                    ///===================Status==============
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: AppStrings.membershipStatus.tr,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: AppColors.black200,
                        ),
                        CustomText(
                          text: controller.profileModel.value.data?.result?.userType?? "",
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: AppColors.black200,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 29.h,
                    ),

                    ///=========================myMembership==============
                    CustomProfileCard(
                      onTap: () {
                        context.pushNamed(RoutePath.myMembershipScreen,);

                      },
                      text: AppStrings.myMembership.tr,
                      leadingIcon: AppIcons.cardMembership, isCevron: true,
                    ),

                    ///=====================My Products===============
                    CustomProfileCard(
                      isCevron: true,
                      onTap: () {
                        context.pushNamed(RoutePath.myProductsScreen);

                      },
                      text: AppStrings.myProducts.tr,
                      leadingIcon: AppIcons.package_2,
                    ),

                    ///====================Swap Request================
                    CustomProfileCard(
                      isCevron: true,
                      onTap: () {
                        context.pushNamed(RoutePath.swapRequestScreen);
                      },
                      text: AppStrings.swapRequests.tr,
                      leadingIcon: AppIcons.swapHoriz,
                    ),

                    ///<===================== Swap History =======================>
                    CustomProfileCard(
                      isCevron: true,
                      onTap: () {
                        context.pushNamed(RoutePath.swapHistoryScreen);
                      },
                      text: AppStrings.swapHistory.tr,
                      leadingIcon: AppIcons.history,
                    ),

                    ///====================myRatingAndComments================
                    CustomProfileCard(
                      isCevron: true,
                      onTap: () {
                        context.pushNamed(RoutePath.myRatingScreen);

                      },
                      text: AppStrings.myRatingAndComments.tr,
                      leadingIcon: AppIcons.reviews,
                    ),

                    ///====================settings================
                    CustomProfileCard(
                      isCevron: true,
                      onTap: () {
                        context.pushNamed(RoutePath.settingScreen);

                      },
                      text: AppStrings.settings.tr,
                      leadingIcon: AppIcons.settings,
                    ),

                    ///==================== audio ================
                    CustomProfileCard(
                      isCevron: true,
                      onTap: () {
                        context.pushNamed(RoutePath.audioScreen);

                      },
                      text: "Audio",
                      leadingIcon: AppIcons.checkCircle,
                    ),
                    ///====================LogOut================
                    CustomProfileCard(
                      isCevron: false,
                      onTap: () {
                        SharePrefsHelper.remove(AppConstants.isRememberMe);
                        context.pushNamed(RoutePath.signInScreen);
                      },
                      text: AppStrings.logOut.tr,
                      leadingIcon: AppIcons.vector,
                    ),
                    // SizedBox(
                    //   height: 0,
                    //   child: YoutubePlayer(
                    //     controller: generalController.youtubeController!,
                    //     showVideoProgressIndicator: false,
                    //     bottomActions: [], // Hide all bottom actions
                    //   ),
                    // ),
                  ],
                ),
              ),
            );
        }
      }),
    );
  }
}
