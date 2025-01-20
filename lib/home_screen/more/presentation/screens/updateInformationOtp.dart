import 'package:first_project/app_images.dart';
import 'package:first_project/helper/appColors.dart';
import 'package:first_project/helper/appPadding.dart';
import 'package:first_project/helper/getIt.dart';
import 'package:first_project/helper/page_route_fadeTransition.dart';
import 'package:first_project/helper/textStyles.dart';
import 'package:first_project/home_screen/bottomNavBarScreen.dart';
import 'package:first_project/home_screen/more/domain/repo/moreRepoImpl.dart';
import 'package:first_project/home_screen/more/presentation/cubit/cubit/more_cubit.dart';
import 'package:first_project/widget/confirmOrGoBackWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class UpdateInfoOtp extends StatefulWidget {
  const UpdateInfoOtp({
    super.key,
    required this.email,
  });
  final String email;
  @override
  State<UpdateInfoOtp> createState() => _OTPState();
}

class _OTPState extends State<UpdateInfoOtp> {
  final TextEditingController codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MoreCubit(getIt.get<MoreRepoImpl>()),
      child: BlocConsumer<MoreCubit, MoreCubitState>(
        listener: (context, state) {
          if (state is VerfiMailSuccess) {
            Navigator.of(context).pushReplacement(
                AnimationRoute(page: const BottomNavBarScreen()));
          }
        },
        builder: (context, state) {
          return Scaffold(
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
                      widget.email,
                      style: AppTextStyle.regular14
                          .copyWith(color: Appcolors.secColor),
                    ),
                    SizedBox(
                      height: 18.r,
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
                        context.read<MoreCubit>().verfiMaail(
                            newEmail: widget.email, code: codeController.text);
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
