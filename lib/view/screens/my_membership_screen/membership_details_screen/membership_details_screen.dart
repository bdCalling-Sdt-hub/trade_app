import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/view/components/custom_app_bar/custom_app_bar.dart';

class MembershipDetailsScreen extends StatelessWidget {
  const MembershipDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      ///======================Details Appbar==================
      appBar: CustomAppBar(appBarContent: 'Membership Details'.tr,),
    );
  }
}
