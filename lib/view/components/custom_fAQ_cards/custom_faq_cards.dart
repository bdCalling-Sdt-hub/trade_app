import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFAQCard extends StatelessWidget {
  final String question;
  final VoidCallback onTap;

  const CustomFAQCard({required this.question, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: ListTile(
        title: Text(question, style: TextStyle(fontSize: 14.sp)),
        trailing: Icon(Icons.arrow_forward_ios, size: 14.sp),
        onTap: onTap,
      ),
    );
  }
}
