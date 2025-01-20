import 'package:first_project/app_images.dart';
import 'package:first_project/helper/appColors.dart';
import 'package:first_project/helper/page_route_fadeTransition.dart';
import 'package:first_project/helper/textStyles.dart';
import 'package:first_project/home_screen/more/presentation/screens/setting/presentation/screens/changepassword.dart';
import 'package:first_project/home_screen/more/presentation/screens/setting/presentation/widget/language_widget.dart';
import 'package:first_project/home_screen/more/presentation/screens/setting/presentation/widget/notification_setting_widget.dart';
import 'package:first_project/home_screen/more/presentation/screens/setting/presentation/widget/setting_widget.dart';
import 'package:first_project/home_screen/more/presentation/screens/setting/presentation/widget/signoutWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

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
          'الاعدادات',
          style: AppTextStyle.medium16,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0.r),
        child: Column(
          children: [
            SizedBox(
              height: 16.r,
            ),
            SettingWidget(
              onTap: () {
                Navigator.of(context)
                    .push(AnimationRoute(page: const ChangePassword()));
              },
              text: 'تغيير كلمة المرور',
              img: AppImages.lock,
            ),
            SizedBox(
              height: 16.r,
            ),
            SettingWidget(
              text: 'اللغة',
              img: AppImages.language,
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return const LanguageWidget();
                  },
                );
              },
            ),
            SizedBox(
              height: 16.r,
            ),
            SettingWidget(
              text: 'الاشعارات',
              img: AppImages.notification,
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return const NofificationSettingWidget();
                  },
                );
              },
            ),
            SizedBox(
              height: 16.r,
            ),
            SettingWidget(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const SignoutWidget();
                  },
                );
              },
              text: 'حذف الحساب',
              nopreficIcon: false,
              img: AppImages.notification,
              textColor: Appcolors.redColor,
              iconColor: Colors.red,
            ),
            SizedBox(
              height: 16.r,
            ),
          ],
        ),
      ),
    );
  }
}



// else if (state is LogOutLoading) {
//             return const Text('Loading');
//           } else {
//             return const Text('Faileur');
//           }