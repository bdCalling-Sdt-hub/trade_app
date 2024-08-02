import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';
import 'package:trade_app/view/components/custom_text_field/custom_text_field.dart';

class CustomDropdown extends StatelessWidget {
  final String title;
  final Color textColor;
  final TextEditingController controller;
  final bool isDropdownVisible;
  final VoidCallback onTap;
  final List<String> options;
  final Function(int) onSelect;

  const CustomDropdown({super.key,
    required this.title,
    required this.textColor,
    required this.controller,
    required this.isDropdownVisible,
    required this.onTap,
    required this.options,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          onTap: onTap,
          readOnly: true,
          hintText: title,
          fieldBorderColor: AppColors.gray201,
          textEditingController: controller,
          suffixIcon: Icon(
            isDropdownVisible
                ? Icons.keyboard_arrow_up
                : Icons.keyboard_arrow_down_sharp,
            color: isDropdownVisible ? Colors.black : Colors.blue,
          ),
        ),
        isDropdownVisible
            ? Align(
          alignment: Alignment.bottomRight,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: const BoxDecoration(
              color: AppColors.white200,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                options.length,
                    (index) => GestureDetector(
                  onTap: () {
                    onSelect(index);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: AppColors.white200
                      ),
                      child: CustomText(
                        text: options[index],
                        fontWeight: FontWeight.w500,
                        bottom: 4.h,
                        color: AppColors.black500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
            : const SizedBox(height: 10,),
      ],
    );
  }
}
