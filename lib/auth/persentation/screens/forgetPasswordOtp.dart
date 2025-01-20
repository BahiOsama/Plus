import 'package:first_project/app_images.dart';
import 'package:first_project/auth/domain/repos/authRepoImpl.dart';
import 'package:first_project/auth/persentation/cubit/cubit/auth_cubit.dart';
import 'package:first_project/auth/persentation/screens/newPassword.dart';
import 'package:first_project/helper/appColors.dart';
import 'package:first_project/helper/appPadding.dart';
import 'package:first_project/helper/getIt.dart';
import 'package:first_project/helper/page_route_fadeTransition.dart';
import 'package:first_project/helper/textStyles.dart';
import 'package:first_project/widget/confirmOrGoBackWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class ForgetPassOTP extends StatefulWidget {
  final String email;
  const ForgetPassOTP({super.key, required this.email});

  @override
  State<ForgetPassOTP> createState() => _ForgetPassOTPState();
}

class _ForgetPassOTPState extends State<ForgetPassOTP> {
  final TextEditingController codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(getIt.get<AuthRepoImpl>()),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthCheckCodeSuccess) {
            Navigator.push(context, AnimationRoute(page: const NewPassword()));
          }
          if (state is AuthCheckCodeFaileur) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text(state.err),
                );
              },
            );
          }
        },
        builder: (BuildContext context, AuthState state) => Scaffold(
          appBar: AppBar(
            actions: [
              Container(
                width: 80.r,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppImages.rightArrow),
                  ),
                ),
              ),
            ],
          ),
          body: Padding(
            padding: Apppadding.homepadding,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 22.r,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        ' OTP رمز ال ',
                        style: AppTextStyle.medium20,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8.r,
                  ),
                  Text(
                    'أدخل الرمز الذي تم إرساله الى ',
                    style: AppTextStyle.regular14
                        .copyWith(color: Appcolors.secColor),
                  ),
                  SizedBox(
                    height: 8.r,
                  ),
                  Text(
                    widget.email,
                    style: AppTextStyle.regular14
                        .copyWith(color: Appcolors.secColor),
                  ),
                  SizedBox(
                    height: 28.r,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Pinput(
                        controller: codeController,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 34.r,
                  ),
                  ConfirmOrGoBackk(
                    onTap: () {
                      context.read<AuthCubit>().forgetPasswordchechCode(
                          email: widget.email, code: codeController.text);
                    },
                    text: 'التالى',
                  ),
                  SizedBox(
                    height: 22.r,
                  ),
                  Center(
                    child: Text(
                      'لم يصلك رمز ؟',
                      style: AppTextStyle.regular12
                          .copyWith(color: Appcolors.secColor),
                    ),
                  ),
                  SizedBox(
                    height: 4.r,
                  ),
                  Center(
                    child: Text(
                      'إعادة الارسال',
                      style: AppTextStyle.medium14,
                    ),
                  ),
                  SizedBox(
                    height: 220.r,
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
  }
}
