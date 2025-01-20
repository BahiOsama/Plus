import 'package:first_project/app_images.dart';
import 'package:first_project/helper/appColors.dart';
import 'package:first_project/helper/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConfirmOrGoBackk extends StatelessWidget {
  const ConfirmOrGoBackk(
      {super.key,
      required this.text,
      this.containerColor,
      this.textColor,
      this.onTap,
      this.width,
      this.height,
      this.visibleIcon});
  final String text;
  final Color? containerColor, textColor;
  final Function()? onTap;
  final double? width, height;
  final bool? visibleIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 50.r,
      child: ElevatedButton.icon(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            containerColor ?? Appcolors.forthcolor,
          ),
        ),
        icon: Visibility(
          visible: visibleIcon ?? true,
          child: Image.asset(
            AppImages.leftArrow,
          ),
        ),
        onPressed: onTap,
        label: Text(
          text,
          style: AppTextStyle.regular16
              .copyWith(color: textColor ?? Appcolors.whiteColor),
        ),
      ),
    );
  }
}
