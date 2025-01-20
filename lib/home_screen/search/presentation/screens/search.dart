import 'package:first_project/app_images.dart';
import 'package:first_project/helper/appColors.dart';
import 'package:first_project/helper/page_route_fadeTransition.dart';
import 'package:first_project/helper/textStyles.dart';
import 'package:first_project/home_screen/bottomNavBarScreen.dart';
import 'package:first_project/home_screen/search/presentation/widgets/shopWidgetForSearch.dart';
import 'package:first_project/widget/textField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolors.whiteColor,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 18.r),
            child: InkWell(
              onTap: () {
                Navigator.canPop(context);
              },
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      AnimationRoute(page: const BottomNavBarScreen()));
                },
                child: Image.asset(
                  AppImages.rightArrow,
                ),
              ),
            ),
          ),
        ],
        title: const SizedBox(
          height: 38,
          child: TextFieldWidget(
              textColor: Appcolors.textColor,
              hintText: 'ابحث مطعم , مقهى',
              suffixImage: AppImages.search),
        ),
        //           ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 18, left: 12, top: 12).r,
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'متاجر متوفرين',
                  style: AppTextStyle.medium14,
                ),
                Text(
                  ' 5',
                  style: AppTextStyle.medium14,
                ),
              ],
            ),
            SizedBox(
              height: 22.r,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .80,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 22,
                itemBuilder: (context, index) {
                  return const ShopWidgetForSearch();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
