import 'package:flutter/material.dart';
import 'package:trade_app/utils/app_strings/app_strings.dart';
import 'package:trade_app/view/components/custom_app_bar/custom_app_bar.dart';
import 'package:trade_app/view/components/nav_bar/nav_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(

      bottomNavigationBar: NavBar(currentIndex: 4),

      appBar: CustomAppBar(
        appBarContent: AppStrings.myProfile,
      )
    );
  }
}
