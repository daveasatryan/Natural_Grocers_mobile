import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:natural_groceries/core/data/enums/dialog_icons.dart';
import 'package:natural_groceries/core/data/enums/validation_enum.dart';
import 'package:natural_groceries/core/data/enums/validation_valid_invalid.dart';
import 'package:natural_groceries/core/data/models/store/store_model.dart';
import 'package:natural_groceries/core/data/utilities/app_constants.dart';
import 'package:natural_groceries/core/data/utilities/bloc/bloc_factory.dart';
import 'package:natural_groceries/core/data/validation_utils.dart';
import 'package:natural_groceries/core/presentation/utilities/assets/app_assets.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/provider/user_provider.dart';
import 'package:natural_groceries/core/presentation/utilities/routes/app_routes.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/views/auth/sign_up/bloc/sign_up_bloc.dart';
import 'package:natural_groceries/core/presentation/views/auth/sign_up/bloc/sign_up_event.dart';
import 'package:natural_groceries/core/presentation/views/auth/sign_up/bloc/sign_up_state.dart';
import 'package:natural_groceries/core/presentation/widgets/app_scaffold.dart';
import 'package:natural_groceries/core/presentation/widgets/base/base_state.dart';
import 'package:natural_groceries/core/presentation/widgets/custom_widgets/base_app_bar_widget.dart';
import 'package:natural_groceries/core/presentation/widgets/custom_widgets/custom_button.dart';
import 'package:natural_groceries/core/presentation/widgets/custom_widgets/custom_text_filed.dart';
import 'package:natural_groceries/core/presentation/widgets/custom_widgets/dot_text_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> with BaseStateMixin {
  Timer? _debounce;
  bool hidePassword = true;
  bool hideConfirmPassword = true;
  bool isChecked = false;
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  String phoneNumberUnmask = '';
  final bool check = true;

  @override
  void dispose() {
    _debounce?.cancel();
    _debounce = null;
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Scaffold(
        backgroundColor: context.colors.whiteColor,
        appBar: BaseAppBarWidget(
          title: SvgPicture.asset(AppAssets.logoIcon),
          leading: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: InkWell(
              onTap: () => AppRoutes.back(),
              child: SvgPicture.asset(AppAssets.backIcon),
            ),
          ),
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
              create: (context) => context.read<BlocFactory>().create<SignUpBloc>(),
              child: BlocConsumer<SignUpBloc, SignUpState>(
                buildWhen: (previous, current) => current.buildWhen(),
                listenWhen: (previous, current) => current.listenWhen(),
                listener: (context, state) {
                  state.whenOrNull(
                    loading: () => showLoading(),
                    success: (user) {
                      context.read<UserProvider>().userModel = user;
                      showErrorDialog(
                          title: strings.title_sign_up_success,
                          msg: strings.msg_sign_up_success,
                          buttonText: strings.continue_,
                          icons: DialogIcons.done,
                          onPressed: () {
                            AppRoutes.goTo(AppRoutes.dashboardRoute, hasBack: false);
                          });
                    },
                    error: (msg) => showTwoOptionDialog(
                      icon: DialogIcons.error,
                      title: context.strings.title_error,
                      msg: context.strings.sign_up_error,
                      msgPadding: EdgeInsets.symmetric(horizontal: 70.sp),
                      negativeButtonText: context.strings.cancel,
                      positiveButtonText: context.strings.try_again,
                      positiveButtonClick: () {
                        phoneNumberUnmask = ValidationUtils.maskPhoneNumber.getUnmaskedText();
                        context.read<SignUpBloc>().add(
                              SignUpEvent.signUp(
                                emailController.text,
                                phoneNumberUnmask,
                                passwordController.text,
                                confirmPasswordController.text,
                              ),
                            );
                      },
                    ),
                  );
                },
                builder: (context, state) => state.maybeWhen(
                  orElse: () => Container(),
                  validation: (
                    email,
                    phoneNumber,
                    confirmPassword,
                    password,
                    passwordCharacter,
                    passwordLowerUpper,
                    passwordLeastCharacter,
                    passwordWordDigit,
                    preferred,
                    isButtonActive,
                    preferredStore,
                  ) {
                    hideLoading();
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              strings.create_power_account(AppConstants.nPower),
                              style: context.fonts.latoBlack.copyWith(
                                fontSize: 28.sp,
                              ),
                            ),
                          ),
                          SizedBox(height: 10.sp),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              context.strings.create_your_power_account_to_get(AppConstants.nPower),
                              style: context.fonts.latoRegular.copyWith(
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                          SizedBox(height: 30.sp),
                          CustomTextField(
                            errorText: email.errorMessageEmail,
                            onChanged: (value) {
                              if (_debounce?.isActive == true) _debounce?.cancel();
                              _debounce = Timer(
                                const Duration(milliseconds: 600),
                                () {
                                  context.read<SignUpBloc>().add(
                                        SignUpEvent.validateEmail(value),
                                      );
                                },
                              );
                            },
                            controller: emailController,
                            labelText: context.strings.email_label,
                            labelStyle: context.fonts.latoRegular,
                            textCapitalization: TextCapitalization.none,
                            borderColor: email == ValidationEnum.invalid
                                ? context.colors.errorColor
                                : email == ValidationEnum.valid
                                    ? context.colors.greenBorderColor
                                    : email == ValidationEnum.notEmpty
                                        ? context.colors.borderTrueColor
                                        : context.colors.blackOpacityColor,
                            hint: context.strings.email_hint,
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
                          SizedBox(height: 30.sp),
                          CustomTextField(
                            errorText: phoneNumber.errorMassagePhoneNumber,
                            onChanged: (value) {
                              if (_debounce?.isActive == true) _debounce?.cancel();
                              _debounce = Timer(
                                const Duration(milliseconds: 600),
                                () {
                                  context.read<SignUpBloc>().add(
                                        SignUpEvent.validatePhoneNumber(value),
                                      );
                                },
                              );
                            },
                            controller: phoneNumberController,
                            inputFormatters: [ValidationUtils.maskPhoneNumber],
                            keyboardType: TextInputType.phone,
                            labelText: context.strings.phone_number_label,
                            labelStyle: context.fonts.latoRegular,
                            borderColor: phoneNumber == ValidationEnum.invalid
                                ? context.colors.blackOpacityColor
                                : phoneNumber == ValidationEnum.valid
                                    ? context.colors.greenBorderColor
                                    : phoneNumber == ValidationEnum.notEmpty
                                        ? context.colors.borderTrueColor
                                        : context.colors.blackOpacityColor,
                            hint: context.strings.phone_number_hint,
                            hintStyle: context.fonts.latoRegular.copyWith(
                              color: context.colors.whisperColor,
                            ),
                            fillColor: context.colors.whiteColor,
                            isValidSuffixIcon: phoneNumber == ValidationEnum.valid
                                ? true
                                : phoneNumber == ValidationEnum.invalid
                                    ? false
                                    : null,
                          ),
                          SizedBox(height: 10.sp),
                          Align(
                            alignment: Alignment.topLeft,
                            child: DotTextWidget(
                              text: context.strings.digits_only_no_spaces_or_dashes,
                              style: context.fonts.latoBold.copyWith(
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                          SizedBox(height: 30.sp),
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
                                  context.read<SignUpBloc>().add(
                                        SignUpEvent.validatePassword(value),
                                      );
                                },
                              );
                            },
                            controller: passwordController,
                            isPasswordField: true,
                            suffixIconColor: context.colors.whisperColor,
                            textCapitalization: TextCapitalization.none,
                            hidePassword: hidePassword,
                            labelText: context.strings.password_label,
                            labelStyle: context.fonts.latoRegular,
                            borderColor: password == ValidationEnum.invalid
                                ? context.colors.blackOpacityColor
                                : password == ValidationEnum.valid
                                    ? context.colors.greenBorderColor
                                    : password == ValidationEnum.notEmpty
                                        ? context.colors.borderTrueColor
                                        : context.colors.blackOpacityColor,
                            hint: context.strings.password_hint,
                            hintStyle: context.fonts.latoRegular.copyWith(
                              color: context.colors.whisperColor,
                            ),
                            fillColor: context.colors.whiteColor,
                            isValidSuffixIcon: password == ValidationEnum.valid
                                ? true
                                : password == ValidationEnum.invalid
                                    ? false
                                    : null,
                          ),
                          SizedBox(height: 30.sp),
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
                                  context.read<SignUpBloc>().add(
                                        SignUpEvent.validateConfirmPassword(
                                          value,
                                          passwordController.text,
                                        ),
                                      );
                                },
                              );
                            },
                            isPasswordField: true,
                            hidePassword: hideConfirmPassword,
                            textCapitalization: TextCapitalization.none,
                            suffixIconColor: context.colors.whisperColor,
                            controller: confirmPasswordController,
                            labelText: context.strings.confirm_password_label,
                            labelStyle: context.fonts.latoRegular,
                            borderColor: confirmPassword == ValidationEnum.invalid
                                ? context.colors.blackOpacityColor
                                : confirmPassword == ValidationEnum.valid
                                    ? context.colors.greenBorderColor
                                    : confirmPassword == ValidationEnum.notEmpty
                                        ? context.colors.borderTrueColor
                                        : context.colors.blackOpacityColor,
                            hint: context.strings.confirm_your_password_hint,
                            hintStyle: context.fonts.latoRegular.copyWith(
                              color: context.colors.whisperColor,
                            ),
                            fillColor: context.colors.whiteColor,
                            isValidSuffixIcon: confirmPassword == ValidationEnum.valid
                                ? true
                                : confirmPassword == ValidationEnum.invalid
                                    ? false
                                    : null,
                          ),
                          SizedBox(height: 24.sp),
                          Text(
                            strings.tips_for_a_strong_password,
                            style: fonts.latoSemiBoldItalic.copyWith(
                              fontSize: 16.sp,
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
                          SizedBox(height: 25.sp),
                          InkWell(
                            onTap: () async {
                              StoreModel result = await AppRoutes.goTo(AppRoutes.signUpStores);

                              if (mounted) {
                                context.read<SignUpBloc>().add(
                                      SignUpEvent.setPreferredStore(result),
                                    );
                              }
                            },
                            child: CustomTextField(
                              borderColor: preferred == ValidationEnum.invalid
                                  ? context.colors.errorColor
                                  : preferred == ValidationEnum.valid
                                      ? context.colors.greenBorderColor
                                      : preferred == ValidationEnum.notEmpty
                                          ? context.colors.borderTrueColor
                                          : context.colors.blackOpacityColor,
                              labelStyle: context.fonts.latoRegular,
                              labelText: context.strings.preferred_store,
                              readOnly: true,
                              ignoring: true,
                              suffixIcon: Icon(Icons.keyboard_arrow_down, size: 25.sp),
                              style: context.fonts.latoRegular
                                  .copyWith(color: context.colors.black45Color),
                              hintStyle: context.fonts.latoRegular
                                  .copyWith(color: context.colors.black45Color),
                              hint: preferredStore?.fullTitle ??
                                  context.strings.select_your_preferred_store,
                              errorText: preferred.errorMessagePreferredStore,
                              fillColor: context.colors.whiteColor,
                            ),
                          ),
                          SizedBox(height: 40.sp),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: context.strings.by_creating_an_account,
                                  style: context.fonts.latoBold.copyWith(fontSize: 14.sp),
                                ),
                                TextSpan(
                                  text: context.strings.terms_and_conditions,
                                  style: context.fonts.latoBold.copyWith(
                                    fontSize: 14.sp,
                                    color: context.colors.orangeColor,
                                    decoration: TextDecoration.underline,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      launchUrl(
                                        Uri.parse(AppConstants.termsAndConditionsUrl),
                                        mode: LaunchMode.externalApplication,
                                      );
                                    },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 25.sp),
                          Align(
                            alignment: Alignment.center,
                            child: FractionallySizedBox(
                              widthFactor: .43,
                              child: CustomButton(
                                borderColor: isButtonActive
                                    ? context.colors.borderTrueColor
                                    : context.colors.whisperBorderColor,
                                color: context.colors.whiteColor,
                                showBorder: true,
                                isColorFilled: false,
                                ignorePointer: !isButtonActive,
                                onTap: () {
                                  hideKeyboard();
                                  phoneNumberUnmask =
                                      ValidationUtils.maskPhoneNumber.getUnmaskedText();
                                  context.read<SignUpBloc>().add(
                                        SignUpEvent.signUp(
                                          emailController.text,
                                          phoneNumberUnmask,
                                          passwordController.text,
                                          confirmPasswordController.text,
                                        ),
                                      );
                                },
                                padding: EdgeInsets.symmetric(
                                  vertical: 12.sp,
                                  horizontal: 15.sp,
                                ),
                                child: Text(
                                  context.strings.continue_,
                                  textAlign: TextAlign.center,
                                  style: context.fonts.latoMedium.copyWith(
                                    color: isButtonActive
                                        ? context.colors.borderTrueColor
                                        : context.colors.whisperBorderColor,
                                  ),
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
