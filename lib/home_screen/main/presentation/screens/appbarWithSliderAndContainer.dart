import 'package:carousel_slider/carousel_slider.dart';
import 'package:first_project/app_images.dart';
import 'package:first_project/helper/appColors.dart';
import 'package:first_project/helper/page_route_fadeTransition.dart';
import 'package:first_project/helper/textStyles.dart';
import 'package:first_project/home_screen/main/presentation/screens/notifications.dart';
import 'package:first_project/home_screen/more/presentation/screens/setting/presentation/screens/changepassword.dart';
import 'package:first_project/widget/textField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppbarWithSliderAndContainer extends StatelessWidget {
  const AppbarWithSliderAndContainer({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 12.r,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  AnimationRoute(
                    page: const ChangePassword(),
                  ),
                );
              },
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    AnimationRoute(
                      page: const NotificationScreen(),
                    ),
                  );
                },
                child: Image.asset(
                  AppImages.notificationIcon,
                ),
              ),
            ),
            SizedBox(
              width: 16.r,
            ),
            Flexible(
              child: SizedBox(
                height: 38.r,
                child: const TextFieldWidget(
                    containerColor: Appcolors.forthcolor,
                    textColor: Appcolors.textColor,
                    hintText: 'ابحث مطعم , مقهى',
                    suffixImage: AppImages.search),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 28.r,
        ),
        CarouselSlider.builder(
          itemCount: 15,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) =>
                  Container(
            padding: EdgeInsets.symmetric(horizontal: 12.r, vertical: 12.r),
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: Appcolors.mainColor.withOpacity(.2)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  AppImages.offer,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image.asset(
                      AppImages.logo,
                    ),
                    SizedBox(
                      height: 22.r,
                    ),
                    Text(
                      'احصل على خصم بحد',
                      style: AppTextStyle.medium12,
                    ),
                    Row(
                      children: [
                        Text(
                          'على',
                          style: AppTextStyle.regular11,
                        ),
                        const Text(
                          ' 25% ',
                          style: TextStyle(color: Appcolors.greenColor),
                        ),
                        Text(
                          'أقصى',
                          style: AppTextStyle.regular11,
                        ),
                      ],
                    ),
                    Text(
                      'مجموعة صيف 2024',
                      style: AppTextStyle.medium12
                          .copyWith(color: Appcolors.greenColor),
                    ),
                  ],
                ),
              ],
            ),
          ),
          options: CarouselOptions(
            height: 140.r,
            aspectRatio: 16 / 9,
            viewportFraction: 0.8,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            onPageChanged: (index, reason) {},
            scrollDirection: Axis.horizontal,
          ),
        ),
        SizedBox(
          height: 12.r,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 22.r),
              width: 175.r,
              height: 60.r,
              decoration: BoxDecoration(
                  color: Appcolors.forthcolor,
                  borderRadius: BorderRadius.circular(8.r)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'أخري',
                    style: AppTextStyle.medium12
                        .copyWith(color: Appcolors.whiteColor),
                  ),
                  SizedBox(
                    width: 16.r,
                  ),
                  Image.asset(AppImages.other),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 16.r),
              decoration: BoxDecoration(
                  color: Appcolors.textColor.withOpacity(.4),
                  borderRadius: BorderRadius.circular(8.r)),
              child: Row(
                children: [
                  Text(
                    'مطاعم وكافيهات',
                    style: AppTextStyle.medium12
                        .copyWith(color: Appcolors.textColor),
                  ),
                  SizedBox(
                    width: 12.r,
                  ),
                  Image.asset(AppImages.resturant),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30.r,
        ),
      ],
    );
  }
}
