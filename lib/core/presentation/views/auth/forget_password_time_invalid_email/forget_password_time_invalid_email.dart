import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:natural_groceries/core/data/enums/validation_enum.dart';
import 'package:natural_groceries/core/data/utilities/bloc/bloc_factory.dart';
import 'package:natural_groceries/core/presentation/utilities/assets/app_assets.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/routes/app_routes.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/views/auth/forget_password_time_invalid_email/bloc/forget_password_time_invalid_email_bloc.dart';
import 'package:natural_groceries/core/presentation/views/auth/forget_password_time_invalid_email/bloc/forget_password_time_invalid_email_event.dart';
import 'package:natural_groceries/core/presentation/views/auth/forget_password_time_invalid_email/bloc/forget_password_time_invalid_email_state.dart';
import 'package:natural_groceries/core/presentation/widgets/app_scaffold.dart';
import 'package:natural_groceries/core/presentation/widgets/base/base_state.dart';
import 'package:natural_groceries/core/presentation/widgets/custom_widgets/base_app_bar_widget.dart';
import 'package:natural_groceries/core/presentation/widgets/custom_widgets/custom_button.dart';
import 'package:natural_groceries/core/presentation/widgets/custom_widgets/custom_text_filed.dart';

class ForgetPasswordTimeInvalidEmail extends StatefulWidget {
  const ForgetPasswordTimeInvalidEmail({super.key});

  @override
  State<ForgetPasswordTimeInvalidEmail> createState() => _ForgetPasswordTimeInvalidEmailState();
}

class _ForgetPasswordTimeInvalidEmailState extends State<ForgetPasswordTimeInvalidEmail>
    with BaseStateMixin {
  Timer? _debounce;
  bool hidePassword = true;
  bool hideConfirmPassword = true;
  bool isChecked = false;
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: BlocProvider(
        create: (context) =>
            context.read<BlocFactory>().create<ForgetPasswordTimeInvalidEmailBloc>(),
        child:
            BlocConsumer<ForgetPasswordTimeInvalidEmailBloc, ForgetPasswordTimeInvalidEmailState>(
          buildWhen: (previous, current) => current.buildWhen(),
          listenWhen: (previous, current) => current.listenWhen(),
          listener: (context, state) => state.whenOrNull(
            success: () => AppRoutes.goTo(AppRoutes.forgetPasswordEnterEmailRoute),
            loading: () => showLoading(),
            error: (msg, code) => showErrorDialog(msg: msg),
          ),
          builder: (context, state) => state.maybeWhen(
            orElse: () => Container(),
            validation: (
              email,
              button,
            ) {
              hideLoading();
              return Scaffold(
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
                  title:
                      Image.asset(AppAssets.logoDashboardAppBarIcon, height: 49.sp, width: 208.sp),
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
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            context.strings.reset_your_password,
                            style: context.fonts.latoBlack.copyWith(
                              fontSize: 24.sp,
                            ),
                          ),
                          SizedBox(height: 25.sp),
                          Text(
                            context.strings.oops_something_happened,
                            style: context.fonts.latoRegular.copyWith(fontSize: 16.sp),
                          ),
                          SizedBox(height: 30.sp),
                          Text(
                            context.strings.you_have_tried_to_use,
                            style: context.fonts.latoRegular.copyWith(fontSize: 16.sp),
                          ),
                          SizedBox(height: 150.sp),
                          Text(
                            context.strings.please_enter_the_email,
                            style: context.fonts.latoRegular.copyWith(fontSize: 16.sp),
                          ),
                          SizedBox(height: 30.sp),
                          CustomTextField(
                            errorText: email.errorMessageEmail,
                            onChanged: (value) {
                              if (_debounce?.isActive == true) _debounce?.cancel();
                              _debounce = Timer(
                                const Duration(milliseconds: 600),
                                () {
                                  context.read<ForgetPasswordTimeInvalidEmailBloc>().add(
                                        ForgetPasswordTimeInvalidEmailEvent.validEmail(value),
                                      );
                                },
                              );
                            },
                            controller: emailController,
                            labelText: context.strings.email_label,
                            labelStyle: context.fonts.latoRegular,
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
                          SizedBox(height: 40.sp),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                context.strings.password_reset_instructions,
                                style: context.fonts.latoRegular.copyWith(
                                  fontSize: 16.sp,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 10.sp),
                              CustomButton(
                                color: context.colors.borderTrueColor,
                                showBorder: true,
                                isColorFilled: false,
                                onTap: () {
                                  context.read<ForgetPasswordTimeInvalidEmailBloc>().add(
                                        ForgetPasswordTimeInvalidEmailEvent.submit(
                                          emailController.text,
                                        ),
                                      );
                                },
                                padding: EdgeInsets.symmetric(
                                  vertical: 12.sp,
                                  horizontal: 45.sp,
                                ),
                                child: Text(
                                  context.strings.submit,
                                  textAlign: TextAlign.center,
                                  style: context.fonts.latoBold.copyWith(
                                    color: context.colors.whiteColor,
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
