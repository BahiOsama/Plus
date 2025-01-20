// import 'package:dio/dio.dart';
// import 'package:first_project/api/api_services.dart';
// import 'package:first_project/helper/textStyles.dart';
// import 'package:first_project/home_screen/main/domain/models/get_categories_model/get_categories_model.dart';
// import 'package:first_project/home_screen/main/domain/repos/mainScreenRepoImpl.dart';
// import 'package:first_project/home_screen/main/presentation/cubit/cubit/main_screen_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class HorizintalListViewWidget extends StatelessWidget {
//   const HorizintalListViewWidget({
//     super.key,
//     required this.getCategoriesModel,
//   });
//   final GetCategoriesModel getCategoriesModel;
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => MainScreenCubit(
//           MainScreenRepoImpl(apiServices: ApiServices(dio: Dio()))),
//       child: SizedBox(
//         height: 100.r,
//         child: ListView.builder(
//           reverse: true,
//           scrollDirection: Axis.horizontal,
//           shrinkWrap: true,
//           itemCount: getCategoriesModel.data?.length,
//           itemBuilder: (context, index) => InkWell(
//             onTap: () {
//               context
//                   .read<MainScreenCubit>()
//                   .getStores(categoryId: getCategoriesModel.data![index].id);
//             },
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 8.r),
//               child: Column(
//                 children: [
//                   Image.network(
//                     getCategoriesModel.data![0].subCategories![index].photo!,
//                     width: 33,
//                     height: 33,
//                   ),
//                   SizedBox(
//                     height: 4.r,
//                   ),
//                   Text(getCategoriesModel.data![0].subCategories![index].title!,
//                       style: AppTextStyle.regular11),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
