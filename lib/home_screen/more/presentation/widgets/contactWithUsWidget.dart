import 'package:first_project/helper/appColors.dart';
import 'package:first_project/helper/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactWithUsWidget extends StatelessWidget {
  const ContactWithUsWidget({
    super.key,
    required this.image,
    required this.text,
  });
  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.only(right: 12, left: 66, top: 12, bottom: 12).r,
      decoration: BoxDecoration(
          border: Border.all(
            color: Appcolors.textColor,
          ),
          borderRadius: BorderRadius.circular(8.r)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: AppTextStyle.regular12,
          ),
          SizedBox(
            width: 10.r,
          ),
          Image.asset(image),
        ],
      ),
    );
  }
}
