import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:first_project/helper/blockObserver.dart';
import 'package:first_project/helper/getIt.dart';
import 'package:first_project/helper/local_data/shared_pref.dart';
import 'package:first_project/home.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CashedSharedPrefrances.cachInitialization();
  getItSetUp();

  CashedSharedPrefrances.getData(key: 'token');

  await EasyLocalization.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('ar'),
        Locale('en'),
      ],
      fallbackLocale: const Locale('en', 'US'),
      startLocale: const Locale('ar'),
      path: 'assets/translation',
      child: const MyApp(),
    ),
  );
}
