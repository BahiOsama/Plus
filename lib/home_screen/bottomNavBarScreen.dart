import 'package:animations/animations.dart';
import 'package:first_project/app_images.dart';
import 'package:first_project/helper/appColors.dart';
import 'package:first_project/home_screen/fav/presentation/screens/favourite.dart';
import 'package:first_project/home_screen/main/presentation/screens/homeScreen.dart';
import 'package:first_project/home_screen/more/presentation/screens/more.dart';
import 'package:first_project/home_screen/search/presentation/screens/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

List list = [
  const More(),
  const Favourite(),
  const Search(),
  const HomeScreen(),
];

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  var currentIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AnimatedContainer(
        curve: Curves.bounceIn,
        duration: const Duration(microseconds: 500),
        height: 100.r,
        child: BottomNavigationBar(
          unselectedItemColor: Appcolors.textColor,
          unselectedIconTheme: const IconThemeData(
            color: Appcolors.greenColor,
          ),
          backgroundColor: Colors.white,
          selectedFontSize: 16.r,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Appcolors.mainColor,
          currentIndex: currentIndex,
          onTap: (index) => setState(() {
            currentIndex = index;
          }),
          items: [
            BottomNavigationBarItem(
              icon: Container(
                height: 33.r,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                        currentIndex == 0
                            ? Appcolors.orangecolor
                            : Appcolors.thirdcolor,
                        BlendMode.color),
                    image: const AssetImage(
                      AppImages.moreMenu,
                    ),
                  ),
                ),
              ),
              label: 'المذيد',
            ),
            BottomNavigationBarItem(
              icon: Container(
                height: 33.r,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      currentIndex == 1
                          ? Appcolors.orangecolor
                          : Appcolors.mainColor,
                      BlendMode.color),
                  image: const AssetImage(AppImages.fav),
                )),
              ),
              label: 'المفضلة',
            ),
            BottomNavigationBarItem(
              icon: Container(
                height: 33.r,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        colorFilter: ColorFilter.mode(
                            currentIndex == 2
                                ? Appcolors.orangecolor
                                : Appcolors.mainColor,
                            BlendMode.color),
                        image: const AssetImage(AppImages.search2))),
              ),
              label: 'البحث',
            ),
            BottomNavigationBarItem(
              icon: Container(
                height: 33.r,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                        currentIndex == 3
                            ? Appcolors.orangecolor
                            : Appcolors.mainColor,
                        BlendMode.color),
                    image: const AssetImage(AppImages.home),
                  ),
                ),
              ),
              label: 'الرئيسية',
            ),
          ],
        ),
      ),
      body: PageTransitionSwitcher(
        child: list[currentIndex],
        transitionBuilder: (child, primaryAnimation, secondaryAnimation) =>
            FadeTransition(
          opacity: primaryAnimation,
          child: child,
        ),
      ),
    );
  }
}
