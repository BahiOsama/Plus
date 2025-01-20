import 'package:easy_localization/easy_localization.dart';
import 'package:first_project/app_images.dart';
import 'package:first_project/auth/domain/repos/authRepoImpl.dart';
import 'package:first_project/auth/persentation/cubit/cubit/auth_cubit.dart';
import 'package:first_project/auth/persentation/screens/forgot_your_password.dart';
import 'package:first_project/auth/persentation/screens/register_screen.dart';
import 'package:first_project/helper/appColors.dart';
import 'package:first_project/helper/appPadding.dart';
import 'package:first_project/helper/getIt.dart';
import 'package:first_project/helper/page_route_fadeTransition.dart';
import 'package:first_project/helper/textStyles.dart';
import 'package:first_project/home_screen/bottomNavBarScreen.dart';
import 'package:first_project/widget/confirmOrGoBackWidget.dart';
import 'package:first_project/widget/textField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController passwordEditingController =
      TextEditingController();
  var formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(getIt.get<AuthRepoImpl>()),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthLoginSuccess) {
            Navigator.pushReplacement(
                context, AnimationRoute(page: const BottomNavBarScreen()));
          }
          if (state is AuthLogFaileur) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text(state.err.toString()),
                );
              },
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Form(
              autovalidateMode: autovalidateMode,
              key: formKey,
              child: Center(
                child: Padding(
                  padding: Apppadding.homepadding,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 120.r,
                        ),
                        Text(
                          'login'.tr(),
                          style: AppTextStyle.regular20,
                        ),
                        SizedBox(
                          height: 18.r,
                        ),
                        Text(
                          "email_password_prompt".tr(),
                          style: AppTextStyle.regular14
                              .copyWith(color: Appcolors.secColor),
                        ),
                        SizedBox(
                          height: 18.r,
                        ),
                        TextFieldWidget(
                            autovalidateMode: autovalidateMode,
                            validator: (value) {
                              if (value!.isEmpty ||
                                  value.length < 10 ||
                                  !value.contains('@')) {
                                return 'Please Enter Valid ';
                              } else {
                                return null;
                              }
                            },
                            hintText: 'email'.tr(),
                            textEditingController: emailEditingController,
                            suffixImage: AppImages.gmail),
                        SizedBox(
                          height: 16.r,
                        ),
                        TextFieldWidget(
                            autovalidateMode: autovalidateMode,
                            validator: (value) {
                              if (value!.isEmpty || value.length < 8) {
                                return 'Please Enter Valid  ';
                              } else {
                                return null;
                              }
                            },
                            visibleIcon: true,
                            prefixIcon: const Icon(
                              Icons.visibility_off,
                              color: Colors.black26,
                            ),
                            hintText: 'password'.tr(),
                            textEditingController: passwordEditingController,
                            suffixImage: AppImages.lock),
                        SizedBox(
                          height: 12.r,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    AnimationRoute(
                                        page: const ForgotYourPassword()));
                              },
                              child: Text("forgot_password".tr(),
                                  style: AppTextStyle.regular12
                                      .copyWith(color: Appcolors.mainColor)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 55.r,
                        ),
                        state is AuthLogLoading
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : ConfirmOrGoBackk(
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    BlocProvider.of<AuthCubit>(context).login(
                                        email: emailEditingController.text,
                                        password:
                                            passwordEditingController.text);
                                  } else {
                                    setState(() {
                                      autovalidateMode =
                                          AutovalidateMode.always;
                                    });
                                  }
                                },
                                text: 'login'.tr(),
                              ),
                        SizedBox(
                          height: 26.r,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(AnimationRoute(
                                    page: const RegisterScreen()));
                              },
                              child: Text(
                                style: AppTextStyle.semiBold13
                                    .copyWith(color: Appcolors.mainColor),
                                "new_account".tr(),
                              ),
                            ),
                            const Text(' '),
                            Text("no_account".tr(),
                                style: AppTextStyle.light12),
                          ],
                        ),
                        SizedBox(
                          height: 150.r,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              AppImages.authImage,
                              color: Colors.yellow.withOpacity(.3),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
