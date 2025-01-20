import 'package:first_project/app_images.dart';
import 'package:first_project/helper/appColors.dart';
import 'package:first_project/helper/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingWidget extends StatelessWidget {
  const SettingWidget({
    super.key,
    required this.text,
    required this.img,
    this.textColor,
    this.iconColor,
    this.nopreficIcon = true,
    this.onTap,
  });
  final String text;
  final String img;
  final Color? textColor;
  final Color? iconColor;
  final bool? nopreficIcon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(8.r),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10).r,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: Appcolors.textColor,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            nopreficIcon == true ? Image.asset(AppImages.right) : Container(),
            const Spacer(),
            Text(
              text,
              style: AppTextStyle.regular12LineHeight150
                  .copyWith(color: textColor ?? Appcolors.mainColor),
            ),
            SizedBox(
              width: 24.r,
            ),
            Image.asset(
              img,
              color: iconColor,
            ),
          ],
        ),
      ),
    );
  }
}
