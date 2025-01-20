import 'package:easy_localization/easy_localization.dart';
import 'package:first_project/auth/persentation/screens/login_screen.dart';
import 'package:first_project/helper/local_data/shared_pref.dart';
import 'package:first_project/home_screen/bottomNavBarScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(411, 890),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Alexandria',
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
        ),
        home: CashedSharedPrefrances.getData(key: 'token') != ""
            ? const BottomNavBarScreen()
            : const LoginScreen(),
        // home: const LoginScreen(),
      ),
    );
  }
}
