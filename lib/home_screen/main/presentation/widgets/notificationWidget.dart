import 'package:first_project/app_images.dart';
import 'package:first_project/helper/appColors.dart';
import 'package:first_project/helper/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14).r,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'كوبون خصم',
                    style: AppTextStyle.medium12,
                  ),
                  SizedBox(
                    height: 4.r,
                  ),
                  Text(
                    'لوريم إيبسوم هو ببساطة نص شكلي',
                    style: AppTextStyle.regular10,
                  ),
                  SizedBox(
                    height: 4.r,
                  ),
                  Text(
                    'منذ ساعة',
                    style: AppTextStyle.light10
                        .copyWith(color: Appcolors.textColor),
                  ),
                  SizedBox(
                    height: 16.r,
                  ),
                ],
              ),
              SizedBox(
                width: 8.r,
              ),
              Image.asset(
                AppImages.notificationicon2,
              ),
            ],
          ),
          Row(
            children: List.generate(
              12,
              (index) {
                return Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.r),
                    child: Container(
                      height: 1.r,
                      color: Appcolors.textColor,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
