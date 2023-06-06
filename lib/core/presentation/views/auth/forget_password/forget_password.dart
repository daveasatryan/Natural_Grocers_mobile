import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:natural_groceries/core/data/enums/validation_enum.dart';
import 'package:natural_groceries/core/data/enums/validation_valid_invalid.dart';
import 'package:natural_groceries/core/data/utilities/bloc/bloc_factory.dart';
import 'package:natural_groceries/core/presentation/utilities/assets/app_assets.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/routes/app_routes.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/views/auth/forget_password/bloc/forget_password_bloc.dart';
import 'package:natural_groceries/core/presentation/views/auth/forget_password/bloc/forget_password_event.dart';
import 'package:natural_groceries/core/presentation/views/auth/forget_password/bloc/forget_password_state.dart';
import 'package:natural_groceries/core/presentation/widgets/app_scaffold.dart';
import 'package:natural_groceries/core/presentation/widgets/base/base_state.dart';
import 'package:natural_groceries/core/presentation/widgets/custom_widgets/base_app_bar_widget.dart';
import 'package:natural_groceries/core/presentation/widgets/custom_widgets/custom_button.dart';
import 'package:natural_groceries/core/presentation/widgets/custom_widgets/custom_text_filed.dart';
import 'package:natural_groceries/core/presentation/widgets/custom_widgets/dot_text_widget.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> with BaseStateMixin {
  Timer? _debounce;
  bool hidePassword = true;
  bool hideConfirmPassword = true;
  bool isChecked = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Scaffold(
        backgroundColor: context.colors.whiteColor,
        appBar: BaseAppBarWidget(
          leading: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset(AppAssets.backIcon),
            ),
          ),
          title: Image.asset(AppAssets.logoDashboardAppBarIcon, height: 49.sp, width: 208.sp),
        ),
        body: ConstrainedBox(
          constraints: BoxConstraints(minHeight: context.sizes.height),
          child: Container(
            padding: EdgeInsets.only(
              left: 20.sp,
              right: 20.sp,
            ),
            width: context.sizes.width,
            decoration: BoxDecoration(
              color: context.colors.whiteColor,
            ),
            child: BlocProvider(
              create: (context) => context.read<BlocFactory>().create<ForgetPasswordBloc>(),
              child: BlocConsumer<ForgetPasswordBloc, ForgetPasswordState>(
                buildWhen: (previous, current) => current.buildWhen(),
                listenWhen: (previous, current) => current.listenWhen(),
                listener: (context, state) => state.whenOrNull(
                  success: () => AppRoutes.goTo(AppRoutes.signInRoute),
                  loading: () => showLoading(),
                  error: (msg, code) => showErrorDialog(msg: msg),
                ),
                builder: (context, state) => state.maybeWhen(
                  orElse: () => Container(),
                  validation: (
                    email,
                    confirmPassword,
                    password,
                    passwordCharacter,
                    passwordLowerUpper,
                    passwordLeastCharacter,
                    passwordWordDigit,
                    forgetPasswordButton,
                  ) {
                    hideLoading();
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              context.strings.reset_your_password,
                              style: context.fonts.latoBlack.copyWith(
                                fontSize: 24.sp,
                              ),
                            ),
                          ),
                          SizedBox(height: 10.sp),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              context.strings.you_have_just_used_your_text,
                              style: context.fonts.latoRegular.copyWith(fontSize: 16.sp),
                            ),
                          ),
                          SizedBox(height: 40.sp),
                          CustomTextField(
                            errorText: email.errorMessageEmail,
                            onChanged: (value) {
                              if (_debounce?.isActive == true) _debounce?.cancel();
                              _debounce = Timer(
                                const Duration(milliseconds: 600),
                                () {
                                  context.read<ForgetPasswordBloc>().add(
                                        ForgetPasswordEvent.validateEmail(
                                          value,
                                          confirmPasswordController.text,
                                          passwordController.text,
                                        ),
                                      );
                                },
                              );
                            },
                            controller: emailController,
                            labelText: context.strings.email_label,
                            labelStyle: context.fonts.latoRegular,
                            style: fonts.latoBold.copyWith(fontSize: 16.sp),
                            borderColor: email == ValidationEnum.invalid
                                ? context.colors.errorColor
                                : email == ValidationEnum.valid
                                    ? context.colors.greenBorderColor
                                    : email == ValidationEnum.notEmpty
                                        ? context.colors.borderTrueColor
                                        : context.colors.blackOpacityColor,
                            hint: context.strings.email_hint,
                            textCapitalization: TextCapitalization.none,
                            hintStyle: context.fonts.latoRegular.copyWith(
                              color: context.colors.whisperColor,
                            ),
                            fillColor: context.colors.whiteColor,
                            isValidSuffixIcon: email == ValidationEnum.valid
                                ? true
                                : email == ValidationEnum.invalid
                                    ? false
                                    : null,
                          ),
                          SizedBox(height: 25.sp),
                          CustomTextField(
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
                                  context.read<ForgetPasswordBloc>().add(
                                        ForgetPasswordEvent.validatePassword(
                                          emailController.text,
                                          confirmPasswordController.text,
                                          value,
                                        ),
                                      );
                                },
                              );
                            },
                            style: fonts.latoBold.copyWith(fontSize: 16.sp),
                            controller: passwordController,
                            isPasswordField: true,
                            hidePassword: hidePassword,
                            suffixIconColor: context.colors.whisperColor,
                            labelText: context.strings.new_password_label,
                            textCapitalization: TextCapitalization.none,
                            labelStyle: context.fonts.latoRegular,
                            borderColor: password == ValidationEnum.invalid
                                ? context.colors.errorColor
                                : password == ValidationEnum.valid
                                ? context.colors.greenBorderColor
                                : password == ValidationEnum.notEmpty
                                ? context.colors.borderTrueColor
                                : context.colors.blackOpacityColor,
                            hint: context.strings.new_password_hint,
                            hintStyle: context.fonts.latoRegular
                                .copyWith(color: context.colors.whisperColor),
                            fillColor: context.colors.whiteColor,
                          ),
                          SizedBox(height: 20.sp),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              context.strings.tips_for_a_strong_password,
                              style: context.fonts.latoSemiBoldItalic.copyWith(
                                fontSize: 16,
                                color: passwordLeastCharacter == ValidationValidInvalid.invalid ||
                                        passwordLowerUpper == ValidationValidInvalid.invalid ||
                                        passwordCharacter == ValidationValidInvalid.invalid ||
                                        passwordWordDigit == ValidationValidInvalid.invalid
                                    ? context.colors.errorColor
                                    : context.colors.blackOpacityColor,
                              ),
                            ),
                          ),
                          SizedBox(height: 10.sp),
                          Align(
                            alignment: Alignment.topLeft,
                            child: DotTextWidget(
                              text: context.strings.at_least_8_characters_the,
                              style: context.fonts.latoBold.copyWith(
                                fontSize: 14.sp,
                                color: passwordLeastCharacter == ValidationValidInvalid.invalid
                                    ? context.colors.errorColor
                                    : context.colors.blackOpacityColor,
                              ),
                            ),
                          ),
                          SizedBox(height: 5.sp),
                          Align(
                            alignment: Alignment.topLeft,
                            child: DotTextWidget(
                              text: context.strings.a_mixture_of_both_uppercase,
                              style: context.fonts.latoBold.copyWith(
                                fontSize: 14.sp,
                                color: passwordLowerUpper == ValidationValidInvalid.invalid
                                    ? context.colors.errorColor
                                    : context.colors.blackOpacityColor,
                              ),
                            ),
                          ),
                          SizedBox(height: 5.sp),
                          Align(
                            alignment: Alignment.topLeft,
                            child: DotTextWidget(
                              text: context.strings.a_mixture_of_letters,
                              style: context.fonts.latoBold.copyWith(
                                fontSize: 14.sp,
                                color: passwordWordDigit == ValidationValidInvalid.invalid
                                    ? context.colors.errorColor
                                    : context.colors.blackOpacityColor,
                              ),
                            ),
                          ),
                          SizedBox(height: 5.sp),
                          Align(
                            alignment: Alignment.topLeft,
                            child: DotTextWidget(
                              text: context.strings.inclusion_of_at_least,
                              style: context.fonts.latoBold.copyWith(
                                fontSize: 14.sp,
                                color: passwordCharacter == ValidationValidInvalid.invalid
                                    ? context.colors.errorColor
                                    : context.colors.blackOpacityColor,
                              ),
                            ),
                          ),
                          SizedBox(height: 50.sp),
                          CustomTextField(
                            togglePasswordVisibility: () {
                              setState(() {
                                hideConfirmPassword = !hideConfirmPassword;
                              });
                            },
                            errorText: confirmPassword.errorMassageConfirmPassword,
                            onChanged: (value) {
                              if (_debounce?.isActive == true) _debounce?.cancel();
                              _debounce = Timer(
                                const Duration(milliseconds: 600),
                                () {
                                  context
                                      .read<ForgetPasswordBloc>()
                                      .add(ForgetPasswordEvent.validateConfirmPassword(
                                        emailController.text,
                                        value,
                                        passwordController.text,
                                      ));
                                },
                              );
                            },
                            isPasswordField: true,
                            hidePassword: hideConfirmPassword,
                            controller: confirmPasswordController,
                            suffixIconColor: context.colors.whisperColor,
                            labelText: context.strings.confirm_password_label,
                            style: fonts.latoBold.copyWith(fontSize: 16.sp),
                            labelStyle: context.fonts.latoRegular,
                            textCapitalization: TextCapitalization.none,
                            borderColor: context.colors.blackOpacityColor,
                            hint: context.strings.confirm_your_password_hint,
                            hintStyle: context.fonts.latoRegular
                                .copyWith(color: context.colors.whisperColor),
                            fillColor: context.colors.whiteColor,
                          ),
                          SizedBox(height: 55.sp),
                          SizedBox(
                            width: context.sizes.width * .43,
                            child: CustomButton(
                              borderColor: forgetPasswordButton == ValidationValidInvalid.valid
                                  ? context.colors.borderTrueColor
                                  : context.colors.whisperBorderColor,
                              color: context.colors.whiteColor,
                              showBorder: true,
                              isColorFilled: false,
                              onTap: forgetPasswordButton == ValidationValidInvalid.valid
                                  ? () {
                                      context.read<ForgetPasswordBloc>().add(
                                            ForgetPasswordEvent.forgetPasswordButton(
                                              emailController.text,
                                              confirmPasswordController.text,
                                              passwordController.text,
                                            ),
                                          );
                                    }
                                  : () {},
                              padding: EdgeInsets.symmetric(
                                vertical: 12.sp,
                                horizontal: 15.sp,
                              ),
                              child: Text(
                                context.strings.continue_,
                                textAlign: TextAlign.center,
                                style: context.fonts.latoMedium.copyWith(
                                  color: forgetPasswordButton == ValidationValidInvalid.valid
                                      ? context.colors.borderTrueColor
                                      : context.colors.whisperBorderColor,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 30.sp),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
