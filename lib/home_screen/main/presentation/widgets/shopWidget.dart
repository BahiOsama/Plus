import 'package:first_project/app_images.dart';
import 'package:first_project/helper/appColors.dart';
import 'package:first_project/helper/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShopWidget extends StatelessWidget {
  const ShopWidget({
    super.key,
    this.onTap,
    this.name,
  });
  final void Function()? onTap;
  final dynamic name;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 14.r),
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
            border: Border.fromBorderSide(
                BorderSide(color: Appcolors.mainColor.withOpacity(.2)))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              children: [
                Text(
                  name,
                  style: AppTextStyle.regular14,
                ),
                SizedBox(
                  height: 3.r,
                ),
                Row(
                  children: [
                    Text(
                      'العنوان',
                      style: AppTextStyle.light11,
                    ),
                    SizedBox(
                      width: 8.r,
                    ),
                    Image.asset(
                      AppImages.location,
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              width: 12.r,
            ),
            Image.asset(AppImages.icon2),
          ],
        ),
      ),
    );
  }
}
