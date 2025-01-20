import 'package:first_project/app_images.dart';
import 'package:first_project/helper/appColors.dart';
import 'package:first_project/helper/getIt.dart';
import 'package:first_project/helper/textStyles.dart';
import 'package:first_project/home_screen/more/domain/repo/moreRepoImpl.dart';
import 'package:first_project/home_screen/more/presentation/cubit/cubit/more_cubit.dart';
import 'package:first_project/widget/confirmOrGoBackWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuggestAndComplain extends StatefulWidget {
  const SuggestAndComplain({super.key});

  @override
  State<SuggestAndComplain> createState() => _SuggestAndComplainState();
}

class _SuggestAndComplainState extends State<SuggestAndComplain> {
  final TextEditingController textEditingController = TextEditingController();
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
          if (state is AddSuggestationsuccess) {
            showDialog(
              context: context,
              builder: (context) {
                return const AlertDialog(
                  title: Text('Thanks'),
                );
              },
            );
            textEditingController.clear();
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: 18.r),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(AppImages.rightArrow),
                  ),
                ),
              ],
              title: Text(
                'اقتراح وشكاوي',
                style: AppTextStyle.medium16,
              ),
              centerTitle: true,
            ),
            body: Padding(
              padding: EdgeInsets.all(22.r),
              child: ListView(
                children: [
                  TextField(
                    controller: textEditingController,
                    maxLines: 8,
                    textAlign: TextAlign.end,
                    decoration: InputDecoration(
                      hintText: 'ادخل المقترح او الشكوي',
                      hintStyle: const TextStyle(fontSize: 12),
                      fillColor: Appcolors.whiteColor,
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Appcolors.orangecolor),
                          borderRadius: BorderRadius.all(Radius.circular(8.r))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black12),
                          borderRadius: BorderRadius.all(Radius.circular(8.r))),
                      filled: true,
                      errorBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.redAccent),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 34.r,
                  ),
                  ConfirmOrGoBackk(
                    text: 'ارسال',
                    onTap: () {
                      context
                          .read<MoreCubit>()
                          .addsugest(text: textEditingController.text);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
