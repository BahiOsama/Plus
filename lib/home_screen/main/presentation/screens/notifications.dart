import 'package:first_project/app_images.dart';
import 'package:first_project/helper/appColors.dart';
import 'package:first_project/helper/textStyles.dart';
import 'package:first_project/home_screen/main/presentation/widgets/notificationWidget.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolors.whiteColor,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 14),
            child: InkWell(
              onTap: () {
                Navigator.canPop(context);
              },
              child: InkWell(
                onTap: Navigator.of(context).pop,
                child: Image.asset(
                  AppImages.rightArrow,
                ),
              ),
            ),
          ),
        ],
        title: Text(
          'الإشعارات',
          style: AppTextStyle.medium16,
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => const NotificationWidget(),
      ),
    );
  }
}
