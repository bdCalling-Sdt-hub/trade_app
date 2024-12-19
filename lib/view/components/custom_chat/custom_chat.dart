import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';

class CustomChat extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String subTitle;
  final String time;

  const CustomChat(
      {super.key,
      required this.imageUrl,
      required this.name,
      required this.subTitle,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.withOpacity(.3),
            width: 1
          )
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CustomNetworkImage(
              boxShape: BoxShape.circle,
              imageUrl: imageUrl,
              height: 40.h,
              width: 40.w,
            ),
            title: CustomText(
              textAlign: TextAlign.start,
              text: name,
              fontSize: 14.h,
              fontWeight: FontWeight.w600,
              color: AppColors.black500,
            ),
            subtitle: CustomText(
              textAlign: TextAlign.start,
              text: subTitle,
              fontSize: 12,
              maxLines: 3,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
            trailing: CustomText(
              text: time,
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
