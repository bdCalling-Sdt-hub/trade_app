
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trade_app/core/routes/route_path.dart';
import 'package:trade_app/utils/app_colors/app_colors.dart';
import 'package:trade_app/utils/app_icons/app_icons.dart';
import 'package:trade_app/view/components/custom_image/custom_image.dart';
import 'package:trade_app/view/components/custom_text/custom_text.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final double appBarHeight;
  final double? appBarWidth;
  final Color appBarBgColor;
  final String? appBarContent;
  final IconData? iconData;

  const CustomAppBar({
    this.appBarHeight = 64,
    this.appBarWidth,
    this.appBarBgColor = Colors.white,
    this.appBarContent,
    super.key,
    this.iconData,
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size(appBarWidth ?? double.infinity, appBarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: widget.preferredSize,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsetsDirectional.only(start: 20, top: 24, end: 20),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(color: widget.appBarBgColor),
        child: Row(
          children: [
            GestureDetector(
              onTap: (){
                 context.pushNamed(RoutePath.homeScreen);
              },
              child: const CustomImage(
                  imageSrc: AppIcons.logo,
                  imageType: ImageType.svg),
            ),
            IconButton(
              icon: const CustomImage(imageSrc: AppIcons.arrowLeftAlt),
              color: AppColors.blue,
              onPressed: () {
                GoRouter.of(context).pop();
              },
            ),
            if (widget.appBarContent != null)
              CustomText(
                text: widget.appBarContent!,
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.black,
              ),

          ],
        ),
      ),
    );
  }
}