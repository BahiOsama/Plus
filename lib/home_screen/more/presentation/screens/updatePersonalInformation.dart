import 'package:easy_localization/easy_localization.dart';
import 'package:first_project/app_images.dart';
import 'package:first_project/helper/getIt.dart';
import 'package:first_project/helper/page_route_fadeTransition.dart';
import 'package:first_project/helper/textStyles.dart';
import 'package:first_project/home_screen/more/domain/repo/moreRepoImpl.dart';
import 'package:first_project/home_screen/more/presentation/cubit/cubit/more_cubit.dart';
import 'package:first_project/home_screen/more/presentation/screens/updateInformationOtp.dart';
import 'package:first_project/widget/confirmOrGoBackWidget.dart';
import 'package:first_project/widget/textField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdatePersonalInformation extends StatefulWidget {
  const UpdatePersonalInformation({super.key});

  @override
  State<UpdatePersonalInformation> createState() =>
      _UpdatePersonalInformationState();
}

class _UpdatePersonalInformationState extends State<UpdatePersonalInformation> {
  TextEditingController textEditingController = TextEditingController();
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MoreCubit(getIt.get<MoreRepoImpl>()),
      child: BlocConsumer<MoreCubit, MoreCubitState>(
        listener: (context, state) {
          if (state is UpdateMailSuccess) {
            Navigator.push(
                context,
                AnimationRoute(
                    page: UpdateInfoOtp(
                  email: textEditingController.text,
                )));
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 18).r,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      AppImages.rightArrow,
                    ),
                  ),
                ),
              ],
              title: Text(
                " تعديل البيانات الشخصية".tr(),
                style: AppTextStyle.medium16,
              ),
              centerTitle: true,
            ),
            body: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 22, vertical: 18).r,
              child: Column(
                children: [
                  TextFieldWidget(
                    textEditingController: textEditingController,
                    hintText: 'البريد الالكترونى',
                    suffixImage: AppImages.gmail,
                  ),
                  SizedBox(
                    height: 32.r,
                  ),
                  ConfirmOrGoBackk(
                    onTap: () {
                      context.read<MoreCubit>().updateMaail(
                          email: textEditingController.text, testMode: 1);
                    },
                    text: 'حفظ التعديلات',
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
