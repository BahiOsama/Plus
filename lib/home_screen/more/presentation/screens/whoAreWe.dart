import 'package:first_project/app_images.dart';
import 'package:first_project/helper/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WhoAreWe extends StatelessWidget {
  const WhoAreWe({super.key});

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
          'من نحن',
          style: AppTextStyle.medium16,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(19).r,
        child: Column(
          children: [
            Text(
              textAlign: TextAlign.center,
              'لوريم إيبسوم هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف.',
              style: AppTextStyle.regular12LineHeight160,
            )
          ],
        ),
      ),
    );
  }
}
