import 'package:first_project/app_images.dart';

class Contact {
  final String img, title;

  Contact({
    required this.img,
    required this.title,
  });
}

List<Contact> contact = [
  Contact(
    img: AppImages.facebook,
    title: 'فيسبوك',
  ),
  Contact(
    img: AppImages.whatsup,
    title: 'واتس اب',
  ),
  Contact(
    img: AppImages.x,
    title: 'x',
  ),
  Contact(
    img: AppImages.mail,
    title: 'الايميل',
  ),
  Contact(
    img: AppImages.linkedIn,
    title: 'لينكد ان',
  ),
  Contact(
    img: AppImages.telegram,
    title: 'تيليجرام',
  ),
  Contact(
    img: AppImages.insta,
    title: 'انستجرام',
  ),
];
