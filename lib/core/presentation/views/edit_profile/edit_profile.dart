import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natural_groceries/core/data/enums/validation_enum.dart';
import 'package:natural_groceries/core/data/enums/validation_valid_invalid.dart';
import 'package:natural_groceries/core/data/utilities/bloc/bloc_factory.dart';
import 'package:natural_groceries/core/data/utilities/storage/preferences_manager.dart';
import 'package:natural_groceries/core/data/validation_utils.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/provider/user_provider.dart';
import 'package:natural_groceries/core/presentation/utilities/routes/app_routes.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/views/edit_profile/bloc/edit_profile_bloc.dart';
import 'package:natural_groceries/core/presentation/views/edit_profile/bloc/edit_profile_event.dart';
import 'package:natural_groceries/core/presentation/views/edit_profile/bloc/edit_profile_state.dart';
import 'package:natural_groceries/core/presentation/widgets/app_scaffold.dart';
import 'package:natural_groceries/core/presentation/widgets/base/base_state.dart';
import 'package:natural_groceries/core/presentation/widgets/custom_widgets/custom_button.dart';
import 'package:natural_groceries/core/presentation/widgets/custom_widgets/custom_text_filed.dart';
import 'package:natural_groceries/core/presentation/widgets/custom_widgets/dot_text_widget.dart';
import 'package:natural_groceries/core/presentation/widgets/custom_widgets/header_widget.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> with BaseStateMixin {

  Timer? _debounce;
  bool hidePassword = true;
  bool hideCurrentPassword = true;
  bool hideConfirmPassword = true;
  bool isChecked = false;
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final passwordCurrentController = TextEditingController();
  String phoneNumberUnmask = '';

  @override
  void initState() {
    emailController.text = PreferencesManager.user?.email ?? '';
    phoneNumberController.text =
        ValidationUtils.maskPhoneNumber.maskText(PreferencesManager.user?.userPhoneNumber ?? '');
    super.initState();
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    passwordCurrentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Scaffold(
        backgroundColor: context.colors.whiteColor,
        body: SingleChildScrollView(
          child: BlocProvider(
            create: (context) => context.read<BlocFactory>().create<EditProfileBloc>(),
            child: BlocConsumer<EditProfileBloc, EditProfileState>(
              buildWhen: (previous, current) => current.buildWhen(),
              listenWhen: (previous, current) => current.listenWhen(),
              listener: (context, state) {
                state.whenOrNull(
                  success: (user) {
                    hideLoading();
                    context.read<UserProvider>().userModel = user;
                    AppRoutes.back();
                  },
                  loading: () => showLoading(),
                  error: (msg) => showErrorDialog(msg: msg),
                );
              },
              builder: (context, state) => state.maybeWhen(
                orElse: () => Container(),
                validation: (
                  email,
                  phoneNumber,
                  confirmPassword,
                  currentPassword,
                  password,
                  passwordCharacter,
                  passwordLowerUpper,
                  passwordLeastCharacter,
                  passwordWordDigit,
                  saveButton,
                ) {
                  return Column(
                    children: [
                      HeaderWidget(
                        text: strings.edit_personal_information,
                        height: 97.sp,
                        textStyle: context.fonts.latoBlackItalic.copyWith(
                          fontSize: 26.sp,
                          color: context.colors.whiteColor,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          left: 20.sp,
                          right: 20.sp,
                        ),
                        decoration: BoxDecoration(
                          color: context.colors.whiteColor,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              strings.email_option,
                              style: fonts.latoSemiBoldItalic.copyWith(
                                fontSize: 20.sp,
                                color: colors.blackOpacityColor,
                              ),
                            ),
                            SizedBox(height: 10.sp),
                            CustomTextField(
                              errorText: email.errorMessageEmail,
                              textCapitalization: TextCapitalization.none,
                              onChanged: (value) {
                                if (_debounce?.isActive == true) _debounce?.cancel();
                                _debounce = Timer(
                                  const Duration(milliseconds: 600),
                                  () {
                                    context.read<EditProfileBloc>().add(
                                          EditProfileEvent.validateEmail(value),
                                        );
                                  },
                                );
                              },
                              controller: emailController,
                              labelText: context.strings.email_label,
                              labelStyle: context.fonts.latoRegular,
                              borderColor: email == ValidationEnum.invalid
                                  ? context.colors.errorColor
                                  : context.colors.blackOpacityColor,
                              hint: context.strings.email_hint,
                              hintStyle: context.fonts.latoRegular.copyWith(
                                color: context.colors.whisperColor,
                              ),
                              fillColor: context.colors.whiteColor,
                            ),
                            SizedBox(height: 20.sp),
                            Text(
                              strings.phone_number,
                              style: fonts.latoSemiBoldItalic.copyWith(
                                fontSize: 20.sp,
                                color: colors.blackOpacityColor,
                              ),
                            ),
                            SizedBox(height: 10.sp),
                            CustomTextField(
                              errorText: phoneNumber.errorMassagePhoneNumber,
                              onChanged: (value) {
                                if (_debounce?.isActive == true) _debounce?.cancel();
                                _debounce = Timer(
                                  const Duration(milliseconds: 600),
                                  () {
                                    context.read<EditProfileBloc>().add(
                                          EditProfileEvent.validatePhoneNumber(
                                            ValidationUtils.maskPhoneNumber.unmaskText(value),
                                          ),
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
                                  ? context.colors.errorColor
                                  : context.colors.blackOpacityColor,
                              hint: context.strings.phone_number_hint,
                              hintStyle: context.fonts.latoRegular.copyWith(
                                color: context.colors.whisperColor,
                              ),
                              fillColor: context.colors.whiteColor,
                            ),
                            SizedBox(height: 20.sp),
                            Text(
                              strings.password_edit_label,
                              style: fonts.latoSemiBoldItalic.copyWith(
                                fontSize: 20.sp,
                                color: colors.blackOpacityColor,
                              ),
                            ),
                            SizedBox(height: 10.sp),
                            CustomTextField(
                              togglePasswordVisibility: () {
                                setState(
                                  () {
                                    hideCurrentPassword = !hideCurrentPassword;
                                  },
                                );
                              },
                              errorText: currentPassword.errorMassageCurrentPassword,
                              onChanged: (value) {
                                if (_debounce?.isActive == true) _debounce?.cancel();
                                _debounce = Timer(
                                  const Duration(milliseconds: 600),
                                  () {
                                    context.read<EditProfileBloc>().add(
                                          EditProfileEvent.validateCurrentPassword(value),
                                        );
                                  },
                                );
                              },
                              controller: passwordCurrentController,
                              isPasswordField: true,
                              suffixIconColor: context.colors.whisperColor,
                              hidePassword: hideCurrentPassword,
                              labelText: context.strings.current_password_label,
                              textCapitalization: TextCapitalization.none,
                              labelStyle: context.fonts.latoRegular,
                              borderColor: currentPassword == ValidationEnum.invalid
                                  ? context.colors.errorColor
                                  : context.colors.blackOpacityColor,
                              hint: context.strings.current_password_hint,
                              hintStyle: context.fonts.latoRegular.copyWith(
                                color: context.colors.whisperColor,
                              ),
                              fillColor: context.colors.whiteColor,
                            ),
                            SizedBox(height: 37.sp),
                            CustomTextField(
                              togglePasswordVisibility: () {
                                setState(
                                  () {
                                    hidePassword = !hidePassword;
                                  },
                                );
                              },
                              errorText: password.errorMassagePassword,
                              onChanged: (value) {
                                if (_debounce?.isActive == true) _debounce?.cancel();
                                _debounce = Timer(
                                  const Duration(milliseconds: 600),
                                  () {
                                    context.read<EditProfileBloc>().add(
                                          EditProfileEvent.validatePassword(value),
                                        );
                                  },
                                );
                              },
                              controller: passwordController,
                              isPasswordField: true,
                              suffixIconColor: context.colors.whisperColor,
                              hidePassword: hidePassword,
                              labelText: context.strings.new_password_label,
                              textCapitalization: TextCapitalization.none,
                              labelStyle: context.fonts.latoRegular,
                              borderColor: password == ValidationEnum.invalid
                                  ? context.colors.errorColor
                                  : context.colors.blackOpacityColor,
                              hint: context.strings.new_password_hint_edit,
                              hintStyle: context.fonts.latoRegular.copyWith(
                                color: context.colors.whisperColor,
                              ),
                              fillColor: context.colors.whiteColor,
                            ),
                            SizedBox(height: 37.sp),
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
                                    context.read<EditProfileBloc>().add(
                                          EditProfileEvent.validateConfirmPassword(
                                            value,
                                            passwordController.text,
                                          ),
                                        );
                                  },
                                );
                              },
                              isPasswordField: true,
                              hidePassword: hideConfirmPassword,
                              suffixIconColor: context.colors.whisperColor,
                              controller: confirmPasswordController,
                              labelText: context.strings.new_confirm_password_label,
                              textCapitalization: TextCapitalization.none,
                              labelStyle: context.fonts.latoRegular,
                              borderColor: confirmPassword == ValidationEnum.invalid
                                  ? context.colors.blackOpacityColor
                                  : context.colors.blackOpacityColor,
                              hint: context.strings.new_confirm_password_edit_hint,
                              hintStyle: context.fonts.latoRegular.copyWith(
                                color: context.colors.whisperColor,
                              ),
                              fillColor: context.colors.whiteColor,
                            ),
                            SizedBox(height: 37.sp),
                            Text(
                              context.strings.tips_for_a_strong_password,
                              style: context.fonts.latoSemiBoldItalic.copyWith(
                                fontSize: 16.sp,
                                color: context.colors.blackOpacityColor,
                              ),
                            ),
                            SizedBox(height: 10.sp),
                            DotTextWidget(
                              text: context.strings.at_least_8_characters_the,
                              style: context.fonts.latoBold.copyWith(
                                fontSize: 14.sp,
                                color: passwordLeastCharacter == ValidationValidInvalid.invalid
                                    ? context.colors.errorColor
                                    : context.colors.blackOpacityColor,
                              ),
                            ),
                            SizedBox(height: 5.sp),
                            DotTextWidget(
                              text: context.strings.a_mixture_of_both_uppercase,
                              style: context.fonts.latoBold.copyWith(
                                fontSize: 14.sp,
                                color: passwordLowerUpper == ValidationValidInvalid.invalid
                                    ? context.colors.errorColor
                                    : context.colors.blackOpacityColor,
                              ),
                            ),
                            SizedBox(height: 5.sp),
                            DotTextWidget(
                              text: context.strings.a_mixture_of_letters,
                              style: context.fonts.latoBold.copyWith(
                                fontSize: 14..sp,
                                color: passwordWordDigit == ValidationValidInvalid.invalid
                                    ? context.colors.errorColor
                                    : context.colors.blackOpacityColor,
                              ),
                            ),
                            SizedBox(height: 5.sp),
                            DotTextWidget(
                              text: context.strings.inclusion_of_at_least,
                              style: context.fonts.latoBold.copyWith(
                                fontSize: 14.sp,
                                color: passwordCharacter == ValidationValidInvalid.invalid
                                    ? context.colors.errorColor
                                    : context.colors.blackOpacityColor,
                              ),
                            ),
                            SizedBox(height: 8.sp),
                            Center(
                              child: TextButton(
                                onPressed: () {
                                  hideKeyboard();
                                },
                                child: Text(
                                  strings.delete_account,
                                  style: fonts.latoBold.copyWith(
                                    fontSize: 18.sp,
                                    color: colors.deleteColor,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 25.sp),
                          ],
                        ),
                      ),
                      SizedBox(height: 25.sp),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 25.sp),
                        color: context.colors.footerColor,
                        width: double.maxFinite,
                        child: FractionallySizedBox(
                          widthFactor: .66,
                          child: CustomButton(
                            color: context.colors.borderTrueColor,
                            showBorder: true,
                            isColorFilled: false,
                            onTap: () {
                              hideKeyboard();
                              phoneNumberUnmask = ValidationUtils.maskPhoneNumber
                                  .unmaskText(phoneNumberController.text);
                              context.read<EditProfileBloc>().add(
                                    EditProfileEvent.save(
                                      emailController.text,
                                      phoneNumberUnmask,
                                      passwordCurrentController.text,
                                      passwordController.text,
                                      confirmPasswordController.text,
                                    ),
                                  );
                            },
                            padding: EdgeInsets.symmetric(
                              vertical: 8.sp,
                              horizontal: 20.sp,
                            ),
                            child: Text(
                              context.strings.save_text,
                              textAlign: TextAlign.center,
                              style: context.fonts.latoMedium.copyWith(
                                color: colors.whiteColor,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
