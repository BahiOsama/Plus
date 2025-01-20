import 'package:easy_localization/easy_localization.dart';
import 'package:first_project/app_images.dart';
import 'package:first_project/auth/domain/repos/authRepoImpl.dart';
import 'package:first_project/auth/persentation/cubit/cubit/auth_cubit.dart';
import 'package:first_project/auth/persentation/screens/forgetPasswordOtp.dart';
import 'package:first_project/helper/appColors.dart';
import 'package:first_project/helper/appPadding.dart';
import 'package:first_project/helper/getIt.dart';
import 'package:first_project/helper/page_route_fadeTransition.dart';
import 'package:first_project/helper/textStyles.dart';
import 'package:first_project/widget/confirmOrGoBackWidget.dart';
import 'package:first_project/widget/textField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotYourPassword extends StatefulWidget {
  const ForgotYourPassword({super.key});

  @override
  State<ForgotYourPassword> createState() => _ForgotYourPasswordState();
}

class _ForgotYourPasswordState extends State<ForgotYourPassword> {
  final TextEditingController emailEditingController = TextEditingController();
  @override
  void dispose() {
    emailEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(getIt.get<AuthRepoImpl>()),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthForgetPasswordSuccess) {
            Navigator.push(
                context,
                AnimationRoute(
                    page: ForgetPassOTP(
                  email: emailEditingController.text,
                )));
          } else {}
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                Padding(
                  padding: Apppadding.homepadding,
                ),
              ],
              title: Text(
                "change_password".tr(),
                style: AppTextStyle.medium16,
              ),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 22.r,
                    ),
                    Row(
                      children: [
                        Text(
                          'forgot_password'.tr(),
                          style: AppTextStyle.medium20,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.r,
                    ),
                    Text(
                      'enter_email_for_otp'.tr(),
                      style: AppTextStyle.regular14
                          .copyWith(color: Appcolors.secColor),
                    ),
                    SizedBox(
                      height: 28.r,
                    ),
                    TextFieldWidget(
                        hintText: "email".tr(),
                        textEditingController: emailEditingController,
                        suffixImage: AppImages.gmail),
                    SizedBox(
                      height: 36.r,
                    ),
                    ConfirmOrGoBackk(
                      onTap: () {
                        BlocProvider.of<AuthCubit>(context)
                            .forgetPassword(email: emailEditingController.text);
                      },
                      text: 'send'.tr(),
                    ),
                    SizedBox(
                      height: 350.r,
                    ),
                    Row(
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
          );
        },
      ),
    );
  }
}
