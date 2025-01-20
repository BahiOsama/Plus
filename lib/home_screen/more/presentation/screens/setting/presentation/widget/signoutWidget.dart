import 'package:dio/dio.dart';
import 'package:first_project/api/api_services.dart';
import 'package:first_project/app_images.dart';
import 'package:first_project/auth/persentation/screens/login_screen.dart';
import 'package:first_project/helper/page_route_fadeTransition.dart';
import 'package:first_project/helper/textStyles.dart';
import 'package:first_project/home_screen/more/domain/repo/moreRepoImpl.dart';
import 'package:first_project/home_screen/more/presentation/cubit/cubit/more_cubit.dart';
import 'package:first_project/widget/confirmOrGoBackWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignoutWidget extends StatelessWidget {
  const SignoutWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MoreCubit(MoreRepoImpl(apiServices: ApiServices(dio: Dio()))),
      child: BlocConsumer<MoreCubit, MoreCubitState>(
        builder: (context, state) {
          return AlertDialog(
            actions: [
              Padding(
                padding: EdgeInsets.all(16.r),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        AppImages.close,
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Column(
                  children: [
                    Image.asset(AppImages.warning),
                    Text(
                      'تريد حذف الحساب ؟',
                      style: AppTextStyle.medium20,
                    ),
                    SizedBox(
                      height: 12.r,
                    ),
                    const ConfirmOrGoBackk(
                      text: 'الغاء',
                    ),
                    SizedBox(
                      height: 16.r,
                    ),
                    ConfirmOrGoBackk(
                      onTap: () async {
                        await context.read<MoreCubit>().logOut();
                      },
                      text: 'تأكيد',
                    )
                  ],
                ),
              )
            ],
          );
        },
        listener: (BuildContext context, MoreCubitState state) {
          if (state is LogOutSuccess) {
            Navigator.of(context).pushAndRemoveUntil(
              AnimationRoute(page: const LoginScreen()),
              (route) => false,
            );
          }
        },
      ),
    );
  }
}
