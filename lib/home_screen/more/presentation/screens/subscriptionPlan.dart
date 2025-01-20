import 'package:dotted_border/dotted_border.dart';
import 'package:first_project/app_images.dart';
import 'package:first_project/helper/appColors.dart';
import 'package:first_project/helper/textStyles.dart';
import 'package:first_project/home_screen/more/presentation/widgets/subscriptionPlanWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubscriptionPlan extends StatelessWidget {
  const SubscriptionPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18).r,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(AppImages.rightArrow),
            ),
          ),
        ],
        title: Text(
          'خطة الأشتراك',
          style: AppTextStyle.medium16,
        ),
        centerTitle: true,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DottedBorder(
            color: Appcolors.orangecolor,
            dashPattern: const [18, 8],
            strokeWidth: 2,
            borderType: BorderType.RRect,
            radius: Radius.circular(12.r),
            padding: EdgeInsets.all(6.r),
            child: SizedBox(
              height: 400.r,
              width: MediaQuery.of(context).size.width * .9,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20).r,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              'ر.س / شهريا',
                              style: AppTextStyle.regular14,
                            ),
                            Text(
                              ' 20',
                              style: AppTextStyle.regular14,
                            )
                          ],
                        ),
                        Text(
                          ': خطة الاشتراك',
                          style: AppTextStyle.regular12LineHeight150,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16.r,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '25/5/2024',
                          style: AppTextStyle.regular12LineHeight150,
                        ),
                        Text(
                          'تاريخ الاشتراك:',
                          style: AppTextStyle.light10,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4.r,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '25/5/2024',
                          style: AppTextStyle.regular12LineHeight150,
                        ),
                        Text(
                          'تاريخ الانتهاء:',
                          style: AppTextStyle.light10,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4.r,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '25/5/2024',
                          style: AppTextStyle.regular12LineHeight150,
                        ),
                        Text(
                          'تاريخ الانتهاء:',
                          style: AppTextStyle.light10,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 36.r,
                    ),
                    Text(
                      'مميزات الاشتراك:',
                      style: AppTextStyle.regular12LineHeight150
                          .copyWith(color: Appcolors.textColor),
                    ),
                    SizedBox(
                      height: 12.r,
                    ),
                    const SubscriptionPlanWidget(
                      text: 'وصول غير محدود',
                      subtext:
                          'استمتع بوصول غير محدود إلى مجموعة واسعة من الكوبونات',
                      icon: AppImages.subscriptionPlan2,
                    ),
                    SizedBox(
                      height: 16.r,
                    ),
                    const SubscriptionPlanWidget(
                      text: 'عروض حصرية',
                      subtext:
                          'الوصول إلى خصومات وعروض حصرية متاحة فقط للمشتركين',
                      icon: AppImages.subscriptionPlan1,
                    ),
                    SizedBox(
                      height: 16.r,
                    ),
                    const SubscriptionPlanWidget(
                      text: 'الإشعارات',
                      subtext:
                          ' تلقي إشعارات فورية  مما يضمن عدم تفويت أي فرصة للتوفير',
                      icon: AppImages.subscriptionPlan3,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
