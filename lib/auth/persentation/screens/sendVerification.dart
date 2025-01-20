import 'package:first_project/app_images.dart';
import 'package:first_project/auth/domain/repos/authRepoImpl.dart';
import 'package:first_project/auth/persentation/cubit/cubit/auth_cubit.dart';
import 'package:first_project/helper/appColors.dart';
import 'package:first_project/helper/appPadding.dart';
import 'package:first_project/helper/getIt.dart';
import 'package:first_project/helper/page_route_fadeTransition.dart';
import 'package:first_project/helper/textStyles.dart';
import 'package:first_project/home_screen/bottomNavBarScreen.dart';
import 'package:first_project/widget/confirmOrGoBackWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class SendVerification extends StatefulWidget {
  final String email;
  const SendVerification({
    super.key,
    required this.email,
  });

  @override
  State<SendVerification> createState() => _OTPState();
}

class _OTPState extends State<SendVerification> {
  final TextEditingController codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(getIt.get<AuthRepoImpl>()),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthVertificationSuccess) {
            Navigator.pushReplacement(
                context, AnimationRoute(page: const BottomNavBarScreen()));
          }
          if (state is AuthVertificationLoading) {
            const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is AuthVertificationFaileur) {
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
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Appcolors.whiteColor,
              automaticallyImplyLeading: false,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 14),
                  child: InkWell(
                    onTap: () {
                      Navigator.canPop(context);
                    },
                    child: InkWell(
                      onTap: Navigator.of(context).pop,
                      child: Image.asset(
                        AppImages.rightArrow,
                      ),
                    ),
                  ),
                ),
              ],
              centerTitle: true,
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
                          ' رمز التأكيد',
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
                      'ahmedosama555@gamil.com ',
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
                        context.read<AuthCubit>().vertification(
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
          );
        },
      ),
    );
  }
}
