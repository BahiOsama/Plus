import 'package:first_project/app_images.dart';

class More {
  final String img, title;

  More({
    required this.img,
    required this.title,
  });
}

List<More> more = [
  More(
    img: AppImages.person2,
    title: 'تعديل البيانات الشخصية',
  ),
  More(
    img: AppImages.plan,
    title: 'خطة الأشتراك',
  ),
  More(
    img: AppImages.star,
    title: 'تقييم التطبيق',
  ),
  More(
    img: AppImages.box,
    title: 'سجل متجرك',
  ),
  More(
    img: AppImages.setting,
    title: 'الاعدادات',
  ),
  More(
    img: AppImages.message,
    title: 'تواصل معنا',
  ),
  More(
    img: AppImages.who,
    title: 'من نحن',
  ),
  More(
    img: AppImages.suggest,
    title: 'اقتراح وشكاوي',
  ),
  More(
    img: AppImages.signout,
    title: 'تسجيل الخروج',
  ),
];
