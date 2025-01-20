import 'package:first_project/app_images.dart';
import 'package:first_project/helper/appColors.dart';
import 'package:first_project/helper/appPadding.dart';
import 'package:first_project/helper/getIt.dart';
import 'package:first_project/helper/textStyles.dart';
import 'package:first_project/home_screen/main/domain/models/get_categories_model/get_categories_model.dart';
import 'package:first_project/home_screen/main/domain/repos/mainScreenRepoImpl.dart';
import 'package:first_project/home_screen/main/presentation/cubit/cubit/add_click_cubit.dart';
import 'package:first_project/home_screen/main/presentation/cubit/cubit/get_category_cubit.dart';
import 'package:first_project/home_screen/main/presentation/cubit/cubit/get_store_cubit.dart';
import 'package:first_project/home_screen/main/presentation/screens/appbarWithSliderAndContainer.dart';
import 'package:first_project/home_screen/main/presentation/widgets/mainScreenShowModalBottomSheetWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GetCategoriesModel? categoryModel;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  GetCategoriiesCubit(getIt.get<MainScreenRepoImpl>())
                    ..getCategories(),
            ),
            BlocProvider(
              create: (context) =>
                  GetStoreCubit(getIt.get<MainScreenRepoImpl>()),
            ),
            BlocProvider(
              create: (context) =>
                  AddClickCubit(getIt.get<MainScreenRepoImpl>()),
            ),
          ],
          child: BlocBuilder<GetCategoriiesCubit, GetCategoryState>(
            builder: (context, state) {
              return Padding(
                padding: Apppadding.homepadding,
                child: CustomScrollView(
                  slivers: [
                    const SliverToBoxAdapter(
                      child: AppbarWithSliderAndContainer(),
                    ),
                    SliverToBoxAdapter(
                      child:
                          BlocConsumer<GetCategoriiesCubit, GetCategoryState>(
                        listener:
                            (BuildContext context, GetCategoryState state) {
                          if (state is GetCategoriesSuccess) {
                            if (state.getCategoriesModel.data?.first
                                    .subCategories?.first.id !=
                                null) {
                              context.read<GetStoreCubit>().getStores(
                                  categoryId: state.getCategoriesModel.data
                                      ?.first.subCategories?.first.id);
                            }
                          }
                        },
                        builder: (context, state) {
                          if (state is GetCategoriesSuccess) {
                            return SizedBox(
                              height: 100.r,
                              child: ListView.builder(
                                  reverse: true,
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: state.getCategoriesModel.data?[0]
                                          .subCategories?.length ??
                                      0,
                                  itemBuilder: (context, index) {
                                    categoryModel = state.getCategoriesModel;
                                    return InkWell(
                                      onTap: () {
                                        context.read<GetStoreCubit>().getStores(
                                            categoryId: state
                                                .getCategoriesModel
                                                .data
                                                ?.first
                                                .subCategories?[index]
                                                .id);
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.r),
                                        child: Column(
                                          children: [
                                            Image.network(
                                              state.getCategoriesModel.data![0]
                                                  .subCategories![index].photo!,
                                              width: 33,
                                              height: 33,
                                            ),
                                            SizedBox(
                                              height: 4.r,
                                            ),
                                            Text(
                                                state
                                                    .getCategoriesModel
                                                    .data![0]
                                                    .subCategories![index]
                                                    .title!,
                                                style: AppTextStyle.regular11),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            );
                          } else if (state is GetCategoriesLoading) {
                            return const Shimmer(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.red,
                                  Colors.green,
                                  Color(0xFFEBEBF4),
                                ],
                                stops: [
                                  1,
                                  2,
                                  0.4,
                                ],
                                begin: Alignment(-1.0, -0.3),
                                end: Alignment(1.0, 0.3),
                                tileMode: TileMode.clamp,
                              ),
                              child: Text(''),
                            );
                          } else {
                            return Container();
                          }
                        },
                      ),
                    ),
                    BlocBuilder<GetStoreCubit, GetStoreState>(
                      builder: (context, state) {
                        if (state is GetStoresSuccess) {
                          return SliverToBoxAdapter(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      ' متاجر',
                                      style: AppTextStyle.medium12,
                                    ),
                                    const Text(' '),
                                    Text(
                                      '${state.storeModel.data?.length}',
                                      style: AppTextStyle.medium12,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 24.r,
                                ),
                                ...List.generate(
                                    state.storeModel.data?.length ?? 0,
                                    (index) => InkWell(
                                          onTap: () {
                                            context
                                                .read<AddClickCubit>()
                                                .addClick(
                                                    categoryid: categoryModel
                                                        ?.data?[index].id,
                                                    storeId: state.storeModel
                                                        .data![index].id);
                                            showModalBottomSheet(
                                              isScrollControlled: true,
                                              context: context,
                                              builder: (context) =>
                                                  MainScreenShowModalBottomSheetWidget(
                                                storeModel: state
                                                    .storeModel.data?[index],
                                              ),
                                            );
                                          },
                                          child: Container(
                                            margin:
                                                EdgeInsets.only(bottom: 14.r),
                                            padding: EdgeInsets.all(8.r),
                                            decoration: BoxDecoration(
                                                border: Border.fromBorderSide(
                                                    BorderSide(
                                                        color: Appcolors
                                                            .mainColor
                                                            .withOpacity(.2)))),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Column(
                                                  children: [
                                                    Text(
                                                      state
                                                              .storeModel
                                                              .data![index]
                                                              .name ??
                                                          "",
                                                      style: AppTextStyle
                                                          .regular14,
                                                    ),
                                                    SizedBox(
                                                      height: 3.r,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          'العنوان',
                                                          style: AppTextStyle
                                                              .light11,
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
                                        ))
                              ],
                            ),
                          );
                        } else if (state is GetStoresFaileur) {
                          return const SliverToBoxAdapter(
                            child: Text("failures"),
                          );
                        } else {
                          return const SliverToBoxAdapter(
                            child: Center(
                              child: Shimmer(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFFEBEBF4),
                                    Color(0xFFF4F4F4),
                                    Color(0xFFEBEBF4),
                                  ],
                                  stops: [
                                    0.1,
                                    0.3,
                                    0.4,
                                  ],
                                  begin: Alignment(-1.0, -0.3),
                                  end: Alignment(1.0, 0.3),
                                  tileMode: TileMode.clamp,
                                ),
                                child: Text(''),
                              ),
                            ),
                          );
                        }
                      },
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
