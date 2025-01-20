import 'package:dio/dio.dart';
import 'package:first_project/api/api_services.dart';
import 'package:first_project/app_images.dart';
import 'package:first_project/helper/appColors.dart';
import 'package:first_project/helper/textStyles.dart';
import 'package:first_project/home_screen/fav/domain/repos/favRepoImp.dart';
import 'package:first_project/home_screen/fav/presentation/cubit/cubit/fav_cubit.dart';
import 'package:first_project/home_screen/main/domain/models/store_model/datum.dart';
import 'package:first_project/home_screen/main/presentation/widgets/shopWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainScreenShowModalBottomSheetWidget extends StatefulWidget {
  final DataStoreModel? storeModel;
  const MainScreenShowModalBottomSheetWidget({
    super.key,
    this.storeModel,
  });

  @override
  State<MainScreenShowModalBottomSheetWidget> createState() =>
      _MainScreenShowModalBottomSheetWidgetState();
}

class _MainScreenShowModalBottomSheetWidgetState
    extends State<MainScreenShowModalBottomSheetWidget> {
  var copied = false;
  @override
  Widget build(BuildContext context) {
    var code = 'PFHJA482035489';

    return BlocProvider(
      create: (context) =>
          FavCubit(FavRepoimpl(apiServices: ApiServices(dio: Dio()))),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Appcolors.whiteColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28).r,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    AppImages.close,
                  ),
                ),
              ),
              SizedBox(
                height: 22.r,
              ),
              ShopWidget(
                name: widget.storeModel!.name,
              ),
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  'الكوبون',
                  style: AppTextStyle.medium12,
                ),
              ),
              SizedBox(
                height: 12.r,
              ),
              Stack(
                children: [
                  Image.asset(AppImages.container),
                  Container(
                    padding: EdgeInsets.only(left: 12.r),
                    margin: EdgeInsets.symmetric(horizontal: 16.r),
                    height: 170.r,
                    width: 180.r,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 12.r,
                        ),
                        Text(
                          '50%',
                          style: AppTextStyle.semiBold20,
                        ),
                        SizedBox(
                          height: 12.r,
                        ),
                        Text(
                          'Free Delivery',
                          style: AppTextStyle.medium14,
                        ),
                        SizedBox(
                          height: 12.r,
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          'احصل على توصيل مجانا على طلبك بحد اني للطلب.',
                          style: AppTextStyle.light12
                              .copyWith(color: Appcolors.thirdcolor),
                        ),
                        SizedBox(
                          height: 2.r,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              textAlign: TextAlign.center,
                              ' ر.س',
                              style: AppTextStyle.light12
                                  .copyWith(color: Appcolors.thirdcolor),
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              '100  ',
                              style: AppTextStyle.light12
                                  .copyWith(color: Appcolors.thirdcolor),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 26.r,
              ),
              BlocBuilder<FavCubit, FavState>(
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          InkWell(
                              onTap: () {
                                widget.storeModel?.isLiked == true
                                    ? widget.storeModel?.isLiked = false
                                    : widget.storeModel?.isLiked = true;

                                context
                                    .read<FavCubit>()
                                    .addFav(widget.storeModel?.id ?? 0);
                              },
                              child: Image.asset(
                                  widget.storeModel?.isLiked == true
                                      ? AppImages.fav3
                                      : AppImages.fav2)),
                          SizedBox(
                            height: 4.r,
                          ),
                          Text(
                            'المفضلة',
                            style: AppTextStyle.regular12,
                          )
                        ],
                      ),
                      SizedBox(
                        width: 18.r,
                      ),
                      Column(
                        children: [
                          Image.asset(AppImages.shop),
                          SizedBox(
                            height: 4.r,
                          ),
                          Text(
                            'تسوق الان',
                            style: AppTextStyle.regular12,
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
              SizedBox(
                height: 22.r,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 18.r),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: Appcolors.mainColor.withOpacity(.05)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          copied = true;
                        });
                        if (code.isNotEmpty) {
                          try {
                            Clipboard.setData(
                              ClipboardData(text: code),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Copied to Clipboard!'),
                              ),
                            );
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Failed to copy to clipboard.'),
                              ),
                            );
                          }
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.all(12.r),
                        padding: EdgeInsets.all(6.r),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.r)),
                            color: copied == true
                                ? Appcolors.greenColor
                                : Appcolors.forthcolor),
                        child: copied == false
                            ? Row(
                                children: [
                                  Text(
                                    'نسخ',
                                    style: AppTextStyle.regular14
                                        .copyWith(color: Appcolors.whiteColor),
                                  ),
                                  SizedBox(
                                    width: 6.r,
                                  ),
                                  Image.asset(AppImages.copyy),
                                ],
                              )
                            : Text(
                                'تم النسخ',
                                style: AppTextStyle.regular14
                                    .copyWith(color: Appcolors.whiteColor),
                              ),
                      ),
                    ),
                    Text(
                      code,
                      style: AppTextStyle.regular16,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
