import 'package:easy_localization/easy_localization.dart';
import 'package:first_project/app_images.dart';
import 'package:first_project/helper/appColors.dart';
import 'package:first_project/helper/textStyles.dart';
import 'package:first_project/widget/confirmOrGoBackWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LanguageWidget extends StatefulWidget {
  const LanguageWidget({
    super.key,
  });

  @override
  State<LanguageWidget> createState() => _NofificationSettingWidgetState();
}

List<String> options = ['option1', 'option2'];

class _NofificationSettingWidgetState extends State<LanguageWidget> {
  String currentOption = options[0];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Appcolors.whiteColor,
          borderRadius: BorderRadius.circular(12.r)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 34, horizontal: 16).r,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(
                AppImages.close,
              ),
            ),
            SizedBox(
              height: 26.r,
            ),
            Text(
              'اختر اللغة',
              style: AppTextStyle.regular20,
            ),
            SizedBox(
              height: 12.r,
            ),
            Text(
              'ما هي اللغة التى تفضلها ؟',
              style: AppTextStyle.regular12,
            ),
            SizedBox(
              height: 26.r,
            ),
            TextField(
              onTap: () {
                setState(() {
                  currentOption = options[0];
                });
              },
              readOnly: true,
              textAlign: TextAlign.end,
              decoration: InputDecoration(
                prefixIcon: Radio(
                  value: options[0],
                  groupValue: currentOption,
                  onChanged: (value) {
                    setState(() {
                      currentOption = value.toString();
                    });
                  },
                ),
                suffixIcon: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(44.r)),
                    color: Appcolors.fifthcolor,
                  ),
                  margin: EdgeInsets.all(12.r),
                  padding: EdgeInsets.all(6.r),
                  child: const Text(
                    'EN',
                    style: TextStyle(color: Appcolors.whiteColor),
                  ),
                ),
                fillColor: Colors.white,
                hintText: 'English',
                hintStyle: AppTextStyle.regular12,
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black26),
                    borderRadius: BorderRadius.all(Radius.circular(8.r))),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Appcolors.textColor),
                    borderRadius: BorderRadius.all(Radius.circular(8.r))),
                filled: true,
                errorBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.redAccent),
                ),
              ),
            ),
            SizedBox(
              height: 12.r,
            ),
            TextField(
              onTap: () {
                setState(() {
                  currentOption = options[1];
                });
              },
              readOnly: true,
              textAlign: TextAlign.end,
              decoration: InputDecoration(
                suffixIcon: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(44.r)),
                    color: Appcolors.fifthcolor,
                  ),
                  margin: EdgeInsets.all(12.r),
                  padding: const EdgeInsets.only(
                          left: 12, right: 12, top: 4, bottom: 9)
                      .r,
                  child: const Text(
                    'ع',
                    style: TextStyle(color: Appcolors.whiteColor),
                  ),
                ),
                prefixIcon: Radio(
                  value: options[1],
                  groupValue: currentOption,
                  onChanged: (value) {
                    setState(() {
                      currentOption = value.toString();
                    });
                  },
                ),
                fillColor: Colors.white,
                hintText: 'العربية',
                hintStyle: AppTextStyle.regular12,
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black26),
                    borderRadius: BorderRadius.all(Radius.circular(8.r))),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Appcolors.textColor),
                    borderRadius: BorderRadius.all(Radius.circular(8.r))),
                filled: true,
                errorBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.redAccent),
                ),
              ),
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
              text: 'متابعة',
            )
          ],
        ),
      ),
    );
  }
}



//  onTap: () {
//                 if (context.locale == const Locale('en')) {
//                   context.setLocale(const Locale('ar'));
//                 } else {
//                   context.setLocale(const Locale('en'));
//                 }
//               },