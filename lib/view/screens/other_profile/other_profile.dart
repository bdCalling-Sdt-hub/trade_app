import 'package:flutter/material.dart';
import 'package:trade_app/view/components/custom_app_bar/custom_app_bar.dart';

class OtherProfile extends StatelessWidget {
  const OtherProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarContent: 'Zahid ',),
    );
  }
}
