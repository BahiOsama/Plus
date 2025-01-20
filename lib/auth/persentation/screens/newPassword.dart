import 'package:first_project/app_images.dart';
import 'package:first_project/helper/appColors.dart';
import 'package:first_project/helper/appPadding.dart';
import 'package:first_project/helper/page_route_fadeTransition.dart';
import 'package:first_project/helper/textStyles.dart';
import 'package:first_project/home_screen/main/presentation/screens/homeScreen.dart';
import 'package:first_project/widget/confirmOrGoBackWidget.dart';
import 'package:first_project/widget/textField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final TextEditingController passwordEditingController =
      TextEditingController();
  final TextEditingController repasswordEditingController =
      TextEditingController();
  @override
  void dispose() {
    super.dispose();
    passwordEditingController.dispose();
    repasswordEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            width: 80.r,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.rightArrow),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: Apppadding.homepadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: 22.r,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'كلمة المرور الجديدة',
                  style: AppTextStyle.medium20,
                ),
              ],
            ),
            SizedBox(
              height: 8.r,
            ),
            Text(
              'أدخل كلمة المرور الجديدة',
              style: AppTextStyle.regular14.copyWith(color: Appcolors.secColor),
            ),
            SizedBox(
              height: 28.r,
            ),
            TextFieldWidget(
                visibleIcon: true,
                hintText: 'كلمة المرور الجديدة',
                textEditingController: passwordEditingController,
                suffixImage: AppImages.gmail),
            SizedBox(
              height: 8.r,
            ),
            Text(
              'يجب ان تكون كلمة المرور مكونة من 6 حروف على الأقل',
              style:
                  AppTextStyle.regular11.copyWith(color: Appcolors.textColor),
            ),
            SizedBox(
              height: 12.r,
            ),
            TextFieldWidget(
                visibleIcon: true,
                hintText: 'اعادة كلمة المرور الجديدة',
                textEditingController: repasswordEditingController,
                suffixImage: AppImages.gmail),
            SizedBox(
              height: 8.r,
            ),
            Text(
              '! كلمة المرور غير متطابقة ',
              style: AppTextStyle.regular11.copyWith(color: Colors.red),
            ),
            SizedBox(
              height: 36.r,
            ),
            ConfirmOrGoBackk(
              onTap: () {
                Navigator.push(
                    context, AnimationRoute(page: const HomeScreen()));
              },
              text: 'تأكيد',
            ),
            SizedBox(
              height: 200.r,
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
    );
  }
}
