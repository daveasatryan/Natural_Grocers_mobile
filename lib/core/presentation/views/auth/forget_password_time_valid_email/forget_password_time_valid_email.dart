import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:natural_groceries/core/data/utilities/bloc/bloc_factory.dart';
import 'package:natural_groceries/core/presentation/utilities/assets/app_assets.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/routes/app_routes.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/views/auth/forget_password_time_valid_email/bloc/forget_password_time_valid_email_bloc.dart';
import 'package:natural_groceries/core/presentation/views/auth/forget_password_time_valid_email/bloc/forget_password_time_valid_email_state.dart';
import 'package:natural_groceries/core/presentation/widgets/app_scaffold.dart';
import 'package:natural_groceries/core/presentation/widgets/base/base_state.dart';
import 'package:natural_groceries/core/presentation/widgets/custom_widgets/base_app_bar_widget.dart';
import 'package:natural_groceries/core/presentation/widgets/custom_widgets/custom_button.dart';

class ForgetPasswordTimeValidEmail extends StatefulWidget {
  const ForgetPasswordTimeValidEmail({super.key});

  @override
  State<ForgetPasswordTimeValidEmail> createState() => _ForgetPasswordTimeValidEmailState();
}

class _ForgetPasswordTimeValidEmailState extends State<ForgetPasswordTimeValidEmail>
    with BaseStateMixin {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: BlocProvider(
        create: (context) => context.read<BlocFactory>().create<ForgetPasswordTimeValidEmailBloc>(),
        child: BlocConsumer<ForgetPasswordTimeValidEmailBloc, ForgetPasswordTimeValidEmailState>(
          buildWhen: (previous, current) => current.buildWhen(),
          listenWhen: (previous, current) => current.listenWhen(),
          listener: (context, state) => state.whenOrNull(
            success: () => AppRoutes.goTo(AppRoutes.forgetPasswordRoute),
            loading: () => showLoading(),
            error: (msg, code) => showErrorDialog(msg: msg),
          ),
          builder: (context, state) => state.maybeWhen(
            orElse: () => Container(),
            initial: () {
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              context.strings.this_is_a_one_ime_login,
                              style: context.fonts.latoRegular.copyWith(fontSize: 16.sp),
                            ),
                          ),
                          SizedBox(height: 30.sp),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              context.strings.click_the_log_ln_button,
                              style: context.fonts.latoRegular.copyWith(fontSize: 16.sp),
                            ),
                          ),
                          SizedBox(height: 30.sp),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              context.strings.this_login_can_be,
                              style: context.fonts.latoRegular.copyWith(fontSize: 16.sp),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                bottomNavigationBar: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 85.sp),
                      child: CustomButton(
                        color: context.colors.borderTrueColor,
                        isColorFilled: false,
                        onTap: () {
                          AppRoutes.goTo(AppRoutes.forgetPasswordRoute);
                        },
                        padding: EdgeInsets.symmetric(
                          vertical: 12.sp,
                          horizontal: 45.sp,
                        ),
                        child: Text(
                          context.strings.login_text,
                          textAlign: TextAlign.center,
                          style: context.fonts.latoBold.copyWith(
                            color: context.colors.whiteColor,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                    ),
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
