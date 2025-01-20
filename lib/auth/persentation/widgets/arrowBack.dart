import 'package:first_project/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArrowBack extends StatelessWidget {
  const ArrowBack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.canPop(context);
      },
      child: Container(
        width: 80.r,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.rightArrow),
          ),
        ),
      ),
    );
  }
}
