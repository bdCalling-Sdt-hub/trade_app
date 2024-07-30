import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomHelpCard extends StatelessWidget {
  final String contactText;
  final String subText;
  final VoidCallback onTap;

  const CustomHelpCard({required this.contactText, required this.subText, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.call, color: Colors.red, size: 24.sp),
        title: Text(contactText, style: TextStyle(fontSize: 14.sp)),
        subtitle: Text(subText, style: TextStyle(fontSize: 12.sp)),
        onTap: onTap,
      ),
    );
  }
}
