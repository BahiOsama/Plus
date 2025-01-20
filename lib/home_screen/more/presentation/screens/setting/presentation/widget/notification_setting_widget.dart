import 'package:first_project/app_images.dart';
import 'package:first_project/helper/appColors.dart';
import 'package:first_project/helper/textStyles.dart';
import 'package:first_project/widget/confirmOrGoBackWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NofificationSettingWidget extends StatefulWidget {
  const NofificationSettingWidget({
    super.key,
  });

  @override
  State<NofificationSettingWidget> createState() =>
      _NofificationSettingWidgetState();
}

bool switchValue = false;

class _NofificationSettingWidgetState extends State<NofificationSettingWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Appcolors.whiteColor, borderRadius: BorderRadius.circular(12)),
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
              'اعدادات الاشعارات',
              style: AppTextStyle.regular20,
            ),
            SizedBox(
              height: 26.r,
            ),
            TextField(
              readOnly: true,
              textAlign: TextAlign.end,
              decoration: InputDecoration(
                prefixIcon: Switch(
                  activeColor: Appcolors.forthcolor,
                  value: switchValue,
                  onChanged: (value) {
                    setState(() {
                      switchValue = value;
                    });
                  },
                ),
                fillColor: Colors.white,
                hintText: 'تفعيل',
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
            const ConfirmOrGoBackk(
              text: 'متابعة',
            )
          ],
        ),
      ),
    );
  }
}
