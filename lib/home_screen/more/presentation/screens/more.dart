import 'package:first_project/helper/appColors.dart';
import 'package:first_project/helper/appPadding.dart';
import 'package:first_project/helper/getIt.dart';
import 'package:first_project/helper/page_route_fadeTransition.dart';
import 'package:first_project/helper/textStyles.dart';
import 'package:first_project/home_screen/more/domain/models/more.dart';
import 'package:first_project/home_screen/more/domain/repo/moreRepoImpl.dart';
import 'package:first_project/home_screen/more/presentation/cubit/cubit/more_cubit.dart';
import 'package:first_project/home_screen/more/presentation/screens/contactWithUs.dart';
import 'package:first_project/home_screen/more/presentation/screens/setting/presentation/screens/setting.dart';
import 'package:first_project/home_screen/more/presentation/screens/setting/presentation/widget/signoutWidget.dart';
import 'package:first_project/home_screen/more/presentation/screens/subscriptionPlan.dart';
import 'package:first_project/home_screen/more/presentation/screens/suggestAndComplain.dart';
import 'package:first_project/home_screen/more/presentation/screens/updatePersonalInformation.dart';
import 'package:first_project/home_screen/more/presentation/screens/whoAreWe.dart';
import 'package:first_project/home_screen/more/presentation/widgets/moreWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class More extends StatelessWidget {
  const More({super.key});
  @override
  Widget build(BuildContext context) {
    List list = [
      const UpdatePersonalInformation(),
      const SubscriptionPlan(),
      Scaffold(
        appBar: AppBar(),
      ),
      Scaffold(
        appBar: AppBar(),
      ),
      const Setting(),
      const ContactWithUs(),
      const WhoAreWe(),
      const SuggestAndComplain(),
      const SignoutWidget(),
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Appcolors.whiteColor,
        centerTitle: true,
        title: Text(
          'المزيد',
          style: AppTextStyle.medium16,
        ),
      ),
      body: BlocProvider(
        create: (context) =>
            MoreCubit(getIt.get<MoreRepoImpl>())..profileDetails(),
        child: BlocBuilder<MoreCubit, MoreCubitState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            if (state is ProfileDetailsSuccess) {
              return Padding(
                padding: Apppadding.homepadding,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 12.r,
                      ),
                      Text(
                        state.profileDetails.data!.name!,
                        style: AppTextStyle.medium14,
                      ),
                      Text(
                        state.profileDetails.data!.email!,
                        style: AppTextStyle.regular12LineHeight150
                            .copyWith(color: Appcolors.thirdcolor),
                      ),
                      SizedBox(
                        height: 22.r,
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: more.length,
                          itemBuilder: (context, index) {
                            return MoreWidget(
                              onTap: () {
                                list.length - 1 == index
                                    ? showDialog(
                                        context: context,
                                        builder: (context) =>
                                            const SignoutWidget(),
                                      )
                                    : Navigator.of(context).push(
                                        AnimationRoute(page: list[index]));
                              },
                              text: more[index].title,
                              img: more[index].img,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else if (state is ProfileDetailsLoading) {
              return const Shimmer(
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
              );
            } else {
              return const Text('Faileur');
            }
          },
        ),
      ),
    );
  }
}
