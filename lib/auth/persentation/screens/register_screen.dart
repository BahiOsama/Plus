import 'package:first_project/app_images.dart';
import 'package:first_project/auth/domain/repos/authRepoImpl.dart';
import 'package:first_project/auth/persentation/cubit/cubit/auth_cubit.dart';
import 'package:first_project/auth/persentation/screens/sendVerification.dart';
import 'package:first_project/helper/appColors.dart';
import 'package:first_project/helper/appPadding.dart';
import 'package:first_project/helper/getIt.dart';
import 'package:first_project/helper/page_route_fadeTransition.dart';
import 'package:first_project/helper/textStyles.dart';
import 'package:first_project/widget/confirmOrGoBackWidget.dart';
import 'package:first_project/widget/textField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController passwordEditingController =
      TextEditingController();
  final TextEditingController userNameEditingController =
      TextEditingController();
  final TextEditingController rePasswordEditingController =
      TextEditingController();
  var formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  Color passWordColor = Colors.white;

  @override
  void dispose() {
    emailEditingController.dispose();
    passwordEditingController.dispose();
    userNameEditingController.dispose();
    rePasswordEditingController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(getIt.get<AuthRepoImpl>()),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthRegisterSuccess) {
            Navigator.pushReplacement(
                context,
                AnimationRoute(
                    page: SendVerification(
                  email: emailEditingController.text,
                )));
          }
          if (state is AuthRegisterFaileur) {
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
            body: Form(
              autovalidateMode: autovalidateMode,
              key: formKey,
              child: Padding(
                padding: Apppadding.homepadding,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 120.r,
                      ),
                      Text(
                        'حساب جديد',
                        style: AppTextStyle.medium20,
                      ),
                      SizedBox(
                        height: 6.r,
                      ),
                      Text(
                        'أدخل البيانات المطلوبة',
                        style: AppTextStyle.regular14
                            .copyWith(color: Appcolors.secColor),
                      ),
                      SizedBox(
                        height: 28.r,
                      ),
                      TextFieldWidget(
                          validator: (value) {
                            if (value!.isEmpty ||
                                value.length < 10 ||
                                !value.contains('@')) {
                              return 'Please Enter Valid ';
                            } else {
                              return null;
                            }
                          },
                          hintText: 'البريد الالكترونى',
                          textEditingController: emailEditingController,
                          suffixImage: AppImages.gmail),
                      SizedBox(
                        height: 18.r,
                      ),
                      TextFieldWidget(
                          validator: (value) {
                            if (value!.isEmpty || value.length < 4) {
                              return 'Please Enter Valid ';
                            } else {
                              return null;
                            }
                          },
                          hintText: 'اسم المستخدم',
                          textEditingController: userNameEditingController,
                          suffixImage: AppImages.person),
                      SizedBox(
                        height: 18.r,
                      ),
                      TextFieldWidget(
                          validator: (value) {
                            if (value!.isEmpty || value.length < 4) {
                              return 'Please Enter Valid ';
                            } else {
                              return null;
                            }
                          },
                          visibleIcon: true,
                          prefixIcon: Container(
                            width: 22.r,
                            height: 22.r,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(AppImages.hiddenEye),
                              ),
                            ),
                          ),
                          hintText: 'كلمة المرور',
                          textEditingController: passwordEditingController,
                          suffixImage: AppImages.lock),
                      SizedBox(
                        height: 6.r,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'يجب ان تكون كلمة المرور مكونة من 6 حروف على الأقل',
                            style: AppTextStyle.regular11
                                .copyWith(color: Appcolors.secColor),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12.r,
                      ),
                      TextFieldWidget(
                          validator: (value) {
                            if (value!.isEmpty || value.length < 4) {
                              return 'Please Enter Valid ';
                            } else {
                              return null;
                            }
                          },
                          visibleIcon: true,
                          prefixIcon: Container(
                            width: 22.r,
                            height: 22.r,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(AppImages.hiddenEye))),
                          ),
                          hintText: 'اعادة كلمة المرور',
                          textEditingController: rePasswordEditingController,
                          suffixImage: AppImages.lock),
                      SizedBox(
                        height: 8.r,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '! كلمة المرور غير متطابقة ',
                            style: AppTextStyle.regular11.copyWith(
                              color: passWordColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 52.r,
                      ),
                      state is AuthRegisterLoading
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : ConfirmOrGoBackk(
                              onTap: () {
                                if (passwordEditingController.text ==
                                    rePasswordEditingController.text) {
                                  passWordColor = Colors.white;
                                } else {
                                  passWordColor = Colors.red;
                                }
                                if (formKey.currentState!.validate()) {
                                  BlocProvider.of<AuthCubit>(context).register(
                                      name: userNameEditingController.text,
                                      password: passwordEditingController.text,
                                      rePassword:
                                          rePasswordEditingController.text,
                                      email: emailEditingController.text);
                                } else {
                                  setState(
                                    () {
                                      autovalidateMode =
                                          AutovalidateMode.always;
                                    },
                                  );
                                }
                              },
                              text: 'حساب جديد',
                            ),
                      SizedBox(
                        height: 12.r,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'تسجيل دخول',
                              style: AppTextStyle.semiBold13
                                  .copyWith(color: Appcolors.mainColor),
                            ),
                          ),
                          Text(
                            '  لديك حساب باافعل ؟',
                            style: AppTextStyle.light12
                                .copyWith(color: Appcolors.textColor),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 60.r,
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
            ),
          );
        },
      ),
    );
  }
}
