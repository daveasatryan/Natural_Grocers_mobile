import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natural_groceries/core/data/enums/validation_enum.dart';
import 'package:natural_groceries/core/data/utilities/app_constants.dart';
import 'package:natural_groceries/core/data/utilities/bloc/bloc_factory.dart';
import 'package:natural_groceries/core/presentation/utilities/assets/app_assets.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/provider/user_provider.dart';
import 'package:natural_groceries/core/presentation/utilities/routes/app_routes.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/views/auth/sign_in/bloc/sign_in_bloc.dart';
import 'package:natural_groceries/core/presentation/views/auth/sign_in/bloc/sign_in_event.dart';
import 'package:natural_groceries/core/presentation/views/auth/sign_in/bloc/sign_in_state.dart';
import 'package:natural_groceries/core/presentation/widgets/app_scaffold.dart';
import 'package:natural_groceries/core/presentation/widgets/base/base_state.dart';
import 'package:natural_groceries/core/presentation/widgets/custom_widgets/base_app_bar_widget.dart';
import 'package:natural_groceries/core/presentation/widgets/custom_widgets/custom_button.dart';
import 'package:natural_groceries/core/presentation/widgets/custom_widgets/custom_text_filed.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> with BaseStateMixin {
  Timer? _debounce;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool hidePassword = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    _debounce?.cancel();
    _debounce = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Scaffold(
        backgroundColor: context.colors.greenScreenColor,
        appBar: BaseAppBarWidget(
          title: Image.asset(AppAssets.logoDashboardAppBarIcon, height: 49.sp, width: 208.sp),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: context.sizes.width,
                child: AspectRatio(
                  aspectRatio: 375 / 240,
                  child: Image.asset(
                    AppAssets.signInIcon,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 30.sp),
              BlocProvider(
                create: (context) => context.read<BlocFactory>().create<SignInBloc>(),
                child: BlocConsumer<SignInBloc, SignInState>(
                  buildWhen: (_, current) => current.buildWhen(),
                  listenWhen: (_, current) => current.listenWhen(),
                  listener: (context, state) => state.whenOrNull(
                    success: (user) {
                      context.read<UserProvider>().userModel = user;
                      AppRoutes.goTo(AppRoutes.dashboardRoute, hasBack: false);
                      return;
                    },
                    loading: () => showLoading(),
                    error: (msg) => showErrorDialog(msg: msg),
                  ),
                  builder: (context, state) => state.maybeWhen(
                    orElse: () => Container(),
                    validation: (email, password) {
                      hideLoading();
                      return Container(
                        padding: EdgeInsets.only(
                          left: 20.sp,
                          right: 20.sp,
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  context.strings.power_account(AppConstants.nPower),
                                  style: context.fonts.latoBlack.copyWith(
                                    fontSize: 28.sp,
                                    color: colors.whiteColor,
                                  ),
                                ),
                              ),
                              SizedBox(height: 5.sp),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  context.strings
                                      .sign_in_with_your_power_account(AppConstants.nPower),
                                  style: context.fonts.latoRegular.copyWith(
                                    fontSize: 20.sp,
                                    color: context.colors.whiteColor.withOpacity(0.4),
                                  ),
                                ),
                              ),
                              SizedBox(height: 30.sp),
                              CustomTextField(
                                textColor: context.colors.whiteColor,
                                errorText: email.errorMessageEmail,
                                cursorColor: context.colors.whiteColor,
                                textCapitalization: TextCapitalization.none,
                                onChanged: (value) {
                                  if (_debounce?.isActive == true) _debounce?.cancel();
                                  _debounce = Timer(
                                    const Duration(milliseconds: 600),
                                    () {
                                      context.read<SignInBloc>().add(
                                            SignInEvent.validateEmail(value),
                                          );
                                    },
                                  );
                                },
                                controller: emailController,
                                labelText: context.strings.email_label,
                                labelStyle: context.fonts.latoRegular
                                    .copyWith(color: context.colors.whiteColor),
                                borderColor: context.colors.whiteColor,
                                hint: context.strings.email_hint,
                                hintStyle: context.fonts.latoRegular
                                    .copyWith(color: context.colors.whiteColor),
                                fillColor: context.colors.greenScreenColor,
                              ),
                              SizedBox(height: 30.sp),
                              CustomTextField(
                                textColor: context.colors.whiteColor,
                                cursorColor: context.colors.whiteColor,
                                textCapitalization: TextCapitalization.none,
                                togglePasswordVisibility: () {
                                  setState(() {
                                    hidePassword = !hidePassword;
                                  });
                                },
                                errorText: password.errorMassagePassword,
                                onChanged: (value) {
                                  if (_debounce?.isActive == true) _debounce?.cancel();
                                  _debounce = Timer(
                                    const Duration(milliseconds: 600),
                                    () {
                                      context.read<SignInBloc>().add(
                                            SignInEvent.validatePassword(value),
                                          );
                                    },
                                  );
                                },
                                controller: passwordController,
                                isPasswordField: true,
                                hidePassword: hidePassword,
                                labelText: context.strings.password_label,
                                labelStyle: context.fonts.latoRegular
                                    .copyWith(color: context.colors.whiteColor),
                                borderColor: password == ValidationEnum.notEmpty
                                    ? context.colors.whiteColor
                                    : context.colors.whiteColor,
                                hint: context.strings.password_hint,
                                hintStyle: context.fonts.latoRegular
                                    .copyWith(color: context.colors.whiteColor),
                                fillColor: context.colors.greenScreenColor,
                              ),
                              SizedBox(height: 12.sp),
                              Align(
                                alignment: Alignment.topRight,
                                child: InkWell(
                                  onTap: () {
                                    AppRoutes.goTo(AppRoutes.forgetPasswordEnterEmailRoute);
                                  },
                                  child: Text(
                                    context.strings.forgot_password,
                                    style: context.fonts.latoRegularItalic.copyWith(
                                      color: colors.whiteColor,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20.sp),
                              SizedBox(
                                width: context.sizes.width * .43,
                                child: CustomButton(
                                  color: context.colors.borderTrueColor,
                                  showBorder: false,
                                  isColorFilled: false,
                                  onTap: () {
                                    hideKeyboard();
                                    context.read<SignInBloc>().add(
                                          SignInEvent.signIn(
                                            emailController.text,
                                            passwordController.text,
                                          ),
                                        );
                                  },
                                  padding: EdgeInsets.symmetric(
                                    vertical: 12.sp,
                                    horizontal: 15.sp,
                                  ),
                                  child: Text(
                                    context.strings.sign_in,
                                    textAlign: TextAlign.center,
                                    style: context.fonts.latoBlack.copyWith(
                                      color: context.colors.whiteColor,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 22.sp),
                              SizedBox(
                                width: context.sizes.width * .43,
                                child: CustomButton(
                                  borderColor: context.colors.whiteColor,
                                  color: context.colors.greenScreenColor,
                                  showBorder: true,
                                  isColorFilled: false,
                                  onTap: () {
                                    AppRoutes.goTo(AppRoutes.signUpRoute);
                                  },
                                  padding: EdgeInsets.symmetric(
                                    vertical: 12.sp,
                                    horizontal: 15.sp,
                                  ),
                                  child: Text(
                                    context.strings.create_account,
                                    textAlign: TextAlign.center,
                                    style: context.fonts.latoMedium.copyWith(
                                      color: context.colors.whiteColor,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 30.sp),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
