import 'package:first_project/app_images.dart';
import 'package:first_project/helper/appColors.dart';
import 'package:first_project/helper/getIt.dart';
import 'package:first_project/helper/textStyles.dart';
import 'package:first_project/home_screen/fav/domain/repos/favRepoImp.dart';
import 'package:first_project/home_screen/fav/presentation/cubit/cubit/fav_cubit.dart';
import 'package:first_project/home_screen/main/presentation/widgets/mainScreenShowModalBottomSheetWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Favourite extends StatelessWidget {
  const Favourite({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavCubit(getIt.get<FavRepoimpl>())..getFav(),
      child: BlocConsumer<FavCubit, FavState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is GetFavSuccess) {
            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                centerTitle: true,
                title: Text(
                  'المفضلة',
                  style: AppTextStyle.regular16,
                ),
              ),
              body: ListView.builder(
                itemCount: state.favModel.data!.length,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.only(top: 14.r),
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Image.asset(
                        AppImages.container2,
                      ),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            enableDrag: true,
                            isScrollControlled: true,
                            context: context,
                            builder: (context) {
                              return const MainScreenShowModalBottomSheetWidget();
                            },
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  height: 8.r,
                                ),
                                Text(
                                  'Free Delivery',
                                  style: AppTextStyle.medium12,
                                ),
                                Text(
                                  '50%',
                                  style: AppTextStyle.semiBold18,
                                ),
                                Container(
                                    margin: EdgeInsets.only(top: 12.r),
                                    padding: const EdgeInsets.symmetric(
                                            vertical: 6, horizontal: 12)
                                        .r,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            const Radius.circular(14).r),
                                        color: Appcolors.mainColor),
                                    child: Row(
                                      children: [
                                        Text(
                                          'نسخ',
                                          style: AppTextStyle.regular14
                                              .copyWith(
                                                  color: Appcolors.whiteColor),
                                        ),
                                        SizedBox(
                                          width: 6.r,
                                        ),
                                        Image.asset(AppImages.copyy),
                                      ],
                                    )),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SizedBox(
                                  height: 8.r,
                                ),
                                Container(
                                  decoration: const BoxDecoration(),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            state.favModel.data![index].name!,
                                            style: AppTextStyle.regular14,
                                          ),
                                          SizedBox(
                                            height: 3.r,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'العنوان',
                                                style: AppTextStyle.light11,
                                              ),
                                              SizedBox(
                                                width: 8.r,
                                              ),
                                              Image.asset(
                                                AppImages.location,
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        width: 12.r,
                                      ),
                                      Image.asset(AppImages.icon2),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 12.r),
                                  height: 50.r,
                                  width: 140.r,
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    'احصل على توصيل مجانا على طلبك بحد اني للطلب 100 ر.س',
                                    style: AppTextStyle.light11
                                        .copyWith(color: Appcolors.thirdcolor),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else if (state is GetFavFaileur) {
            return const Text('Faileur ..');
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
