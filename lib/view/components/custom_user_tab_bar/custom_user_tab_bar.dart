import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';

class CustomUserTabBar extends StatelessWidget {
  final List<String> userList;
  final RxInt selectedIndex;
  final Function(int) onTap;

  const CustomUserTabBar({
    super.key,
    required this.userList,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 2, color: AppColors.black50),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          userList.length,
              (index) => GestureDetector(
            onTap: () => onTap(index),
            child: Container(
              padding: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                border: Border(
                  bottom: selectedIndex.value == index
                      ? const BorderSide(
                    color: AppColors.blue500,
                    width: 2.0,
                  )
                      : const BorderSide(
                    color: Colors.transparent,
                    width: 2.0,
                  ),
                ),
              ),
              child: CustomText(
                textAlign: TextAlign.start,
                text: userList[index],
                color: selectedIndex.value == index
                    ? AppColors.blue500
                    : AppColors.black500,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
