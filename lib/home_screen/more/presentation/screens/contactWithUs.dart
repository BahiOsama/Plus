import 'package:first_project/app_images.dart';
import 'package:first_project/helper/textStyles.dart';
import 'package:first_project/home_screen/more/domain/models/contact.dart';
import 'package:first_project/home_screen/more/presentation/widgets/contactWithUsWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactWithUs extends StatelessWidget {
  const ContactWithUs({super.key});

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
          'تواصل معنا',
          style: AppTextStyle.medium16,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(22.r),
        child: GridView.builder(
          itemCount: contact.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 3,
            crossAxisCount: 2,
            crossAxisSpacing: 18.r,
            mainAxisSpacing: 18.r,
          ),
          itemBuilder: (context, index) {
            return ContactWithUsWidget(
              image: contact[index].img,
              text: contact[index].title,
            );
          },
        ),
      ),
    );
  }
}
