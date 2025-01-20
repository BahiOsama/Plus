import 'package:first_project/app_images.dart';
import 'package:first_project/helper/appColors.dart';
import 'package:first_project/helper/textStyles.dart';
import 'package:first_project/widget/confirmOrGoBackWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class ChangePasswordConfirm extends StatelessWidget {
  const ChangePasswordConfirm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18).r,
            child: InkWell(
              onTap: () {
                Navigator.canPop(context);
              },
              child: Image.asset(AppImages.rightArrow),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.r),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: 22.r,
              ),
              Text(
                'أدخل الرمز الذي تم إرساله الى ',
                style:
                    AppTextStyle.regular14.copyWith(color: Appcolors.mainColor),
              ),
              SizedBox(
                height: 8.r,
              ),
              Text(
                'ahmedosama555@gamil.com ',
                style:
                    AppTextStyle.regular14.copyWith(color: Appcolors.mainColor),
              ),
              SizedBox(
                height: 28.r,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Pinput(),
                ],
              ),
              SizedBox(
                height: 34.r,
              ),
              const ConfirmOrGoBackk(
                text: 'تعديل',
              ),
              SizedBox(
                height: 22.r,
              ),
              Center(
                child: Text(
                  'لم يصلك رمز ؟',
                  style: AppTextStyle.regular12
                      .copyWith(color: Appcolors.secColor),
                ),
              ),
              SizedBox(
                height: 4.r,
              ),
              Center(
                child: Text(
                  'إعادة الارسال',
                  style: AppTextStyle.medium14,
                ),
              ),
              SizedBox(
                height: 260.r,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    AppImages.authImage,
                    color: Colors.yellow.withOpacity(.3),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
