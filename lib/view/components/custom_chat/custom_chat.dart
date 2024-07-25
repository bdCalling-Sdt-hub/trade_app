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

  const CustomChat({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.subTitle,
    required this.time
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        Container(
          padding: EdgeInsets.all(10.r),
          child: ListTile(
            leading: CustomNetworkImage(
              boxShape: BoxShape.circle,
              imageUrl: imageUrl,
              height: 40.h,
              width: 40.w,
            ),
            title: CustomText(
              textAlign: TextAlign.start,
              text: name,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.black500,
            ),
            subtitle: CustomText(
              textAlign: TextAlign.start,
              text: subTitle,
              fontSize: 12,
              maxLines: 2,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
            trailing: CustomText(
              text: time,
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),

          ),

        ),

      ],
    );

  }
}