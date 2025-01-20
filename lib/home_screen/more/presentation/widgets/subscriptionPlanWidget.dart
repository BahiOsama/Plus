import 'package:first_project/helper/appColors.dart';
import 'package:first_project/helper/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubscriptionPlanWidget extends StatelessWidget {
  const SubscriptionPlanWidget({
    super.key,
    required this.icon,
    required this.text,
    required this.subtext,
  });
  final String icon;
  final String text;
  final String subtext;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              text,
              style: AppTextStyle.regular12,
            ),
            Text(
              subtext,
              style: AppTextStyle.light10LineHeight150
                  .copyWith(color: Appcolors.textColor),
            )
          ],
        ),
        SizedBox(
          width: 8.r,
        ),
        Image.asset(icon),
      ],
    );
  }
}
