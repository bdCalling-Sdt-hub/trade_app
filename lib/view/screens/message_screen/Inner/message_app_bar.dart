import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trade_app/view/components/custom_netwrok_image/custom_network_image.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';


class MessageAppBar extends StatelessWidget {
  const MessageAppBar({
    super.key,
    required this.img,
    required this.userName, required this.phoneNumber,
  });

  final String img;
  final String userName;
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [


                //=============================User Image===============================

                CustomNetworkImage(
                    boxShape: BoxShape.circle,
                    imageUrl: img,
                    height: 50.w,
                    width: 50.w),

                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //=============================User Name===============================

                      CustomText(fontWeight: FontWeight.w600,
                        text: userName,color: Colors.black),
                      SizedBox(height: 10.h,),
                      CustomText(fontWeight: FontWeight.w600,
                        text: phoneNumber,color:Colors.black),

                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: const Divider(),
          )
        ],
      ),
    );
  }
}