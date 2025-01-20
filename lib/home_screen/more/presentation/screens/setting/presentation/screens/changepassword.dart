import 'package:easy_localization/easy_localization.dart';
import 'package:first_project/app_images.dart';
import 'package:first_project/helper/appColors.dart';
import 'package:first_project/helper/textStyles.dart';
import 'package:first_project/widget/confirmOrGoBackWidget.dart';
import 'package:first_project/widget/textField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18, left: 18).r,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(AppImages.rightArrow),
            ),
          ),
        ],
        title: Text(
          'تغيير كلمة المرور',
          style: AppTextStyle.medium16,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'ادخل كلمة المرور القديمة',
              style:
                  AppTextStyle.regular12.copyWith(color: Appcolors.textColor),
            ),
            SizedBox(
              height: 12.r,
            ),
            TextFieldWidget(
              visibleIcon: true,
              hintText: 'كلمة المرور القديمة',
              prefixIcon: Image.asset(AppImages.mail),
              suffixImage: AppImages.lock,
            ),
            SizedBox(
              height: 24.r,
            ),
            Text(
              'ادخل كلمة المرور الجديدة',
              style:
                  AppTextStyle.regular12.copyWith(color: Appcolors.textColor),
            ),
            SizedBox(
              height: 12.r,
            ),
            TextFieldWidget(
              visibleIcon: true,
              hintText: 'كلمة المرور الجديدة',
              prefixIcon: Image.asset(AppImages.mail),
              suffixImage: AppImages.lock,
            ),
            SizedBox(
              height: 4.r,
            ),
            Text(
              'يجب ان تكون كلمة المرور مكونة من 6 حروف على الأقل',
              style:
                  AppTextStyle.regular12.copyWith(color: Appcolors.textColor),
            ),
            SizedBox(
              height: 14.r,
            ),
            TextFieldWidget(
              visibleIcon: true,
              hintText: 'تأكيد كلمة المرور',
              prefixIcon: Image.asset(AppImages.mail),
              suffixImage: AppImages.lock,
            ),
            SizedBox(
              height: 34.r,
            ),
            ConfirmOrGoBackk(
              onTap: () {
                if (context.locale == const Locale('en')) {
                  context.setLocale(const Locale('ar'));
                } else {
                  context.setLocale(const Locale('en'));
                }
              },
              text: 'التالى',
            )
          ],
        ),
      ),
    );
  }
}
