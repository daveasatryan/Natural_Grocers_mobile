import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natural_groceries/core/data/models/communication_preferences_bloc_model.dart';
import 'package:natural_groceries/core/data/utilities/app_constants.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/views/communication_preferences/bloc/communication_preferences_bloc.dart';
import 'package:natural_groceries/core/presentation/views/communication_preferences/bloc/communication_preferences_event.dart';
import 'package:natural_groceries/core/presentation/widgets/base/base_stateless_mixin.dart';
import 'package:natural_groceries/core/presentation/widgets/custom_widgets/custom_button.dart';

class CommunicationPreferencesFooter extends StatelessWidget with BaseStatelessMixin {
  final CommunicationPreferencesBlocModel? blocModel;

  const CommunicationPreferencesFooter({
    super.key,
    required this.blocModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10.sp),
          child: Text(
            context.strings.unsubscribe,
            style: context.fonts.latoRegularItalic.copyWith(
              color: context.colors.whisperBorderColor,
              fontSize: 20.sp,
            ),
          ),
        ),
        ListTile(
          onTap: () {
            context.read<CommunicationPreferencesBloc>().add(
                  CommunicationPreferencesEvent.toggleRadioButton(
                    isUnsubscribeFromAllSelected:
                        !(blocModel?.isUnsubscribeFromAllSelected ?? false),
                  ),
                );
          },
          minLeadingWidth: 0.sp,
          title: Text(
            context.strings.unsubscribe_from_all,
            style: context.fonts.latoRegular.copyWith(fontSize: 14.sp),
          ),
          leading: Container(
            height: 23.sp,
            width: 23.sp,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1.sp,
                color: context.colors.whisperBorderColor,
              ),
              color: context.colors.greenScreenColor,
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.all((blocModel?.isUnsubscribeFromAllSelected ?? false) ? 5.sp : 0),
            child: Container(
              decoration: BoxDecoration(
                color: context.colors.whiteColor,
                shape: BoxShape.circle,
                border: Border.all(
                  width: 1.sp,
                  color: (blocModel?.isUnsubscribeFromAllSelected ?? false)
                      ? context.colors.whisperBorderColor
                      : context.colors.transparent,
                ),
              ),
            ),
          ),
        ),
        ListTile(
          onTap: () {
            context.read<CommunicationPreferencesBloc>().add(
                  CommunicationPreferencesEvent.toggleRadioButton(
                    isUnsubscribeFromAllEmailsSelected:
                        !(blocModel?.isUnsubscribeFromAllEmailsSelected ?? false),
                  ),
                );
          },
          minLeadingWidth: 0.sp,
          title: Text(
            context.strings.unsubscribe_from_all_npower_emails(AppConstants.nPower),
            style: context.fonts.latoRegular.copyWith(fontSize: 14.sp),
          ),
          leading: Container(
            height: 23.sp,
            width: 23.sp,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1.sp,
                color: context.colors.whisperBorderColor,
              ),
              color: context.colors.greenScreenColor,
              shape: BoxShape.circle,
            ),
            padding:
                EdgeInsets.all((blocModel?.isUnsubscribeFromAllEmailsSelected ?? false) ? 5.sp : 0),
            child: Container(
              decoration: BoxDecoration(
                color: context.colors.whiteColor,
                shape: BoxShape.circle,
                border: Border.all(
                  width: 1.sp,
                  color: (blocModel?.isUnsubscribeFromAllEmailsSelected ?? false)
                      ? context.colors.whisperBorderColor
                      : context.colors.transparent,
                ),
              ),
            ),
          ),
        ),
        ListTile(
          onTap: () {
            context.read<CommunicationPreferencesBloc>().add(
                  CommunicationPreferencesEvent.toggleRadioButton(
                    isUnsubscribeFromAllNotificationsSelected:
                        !(blocModel?.isUnsubscribeFromAllNotificationsSelected ?? false),
                  ),
                );
          },
          minLeadingWidth: 0.sp,
          title: Text(
            context.strings.unsubscribe_from_all_push_notifications,
            style: context.fonts.latoRegular.copyWith(fontSize: 14.sp),
          ),
          leading: Container(
            height: 23.sp,
            width: 23.sp,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1.sp,
                color: context.colors.whisperBorderColor,
              ),
              color: context.colors.greenScreenColor,
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.all(
                (blocModel?.isUnsubscribeFromAllNotificationsSelected ?? false) ? 5.sp : 0),
            child: Container(
              decoration: BoxDecoration(
                color: context.colors.whiteColor,
                shape: BoxShape.circle,
                border: Border.all(
                  width: 1.sp,
                  color: (blocModel?.isUnsubscribeFromAllNotificationsSelected ?? false)
                      ? context.colors.whisperBorderColor
                      : context.colors.transparent,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 80.sp),
        Align(
          alignment: Alignment.center,
          child: FractionallySizedBox(
            widthFactor: .42,
            child: CustomButton(
              isColorFilled: false,
              showBorder: true,
              borderColor: context.colors.borderTrueColor,
              padding: EdgeInsets.symmetric(vertical: 12.sp),
              child: Center(
                child: Text(
                  context.strings.save_text,
                ),
              ),
              onTap: () {
                if ((blocModel?.isUnsubscribeFromAllSelected ?? false) ||
                    (blocModel?.isUnsubscribeFromAllEmailsSelected ?? false) ||
                    (blocModel?.isUnsubscribeFromAllNotificationsSelected ?? false)) {
                  showTwoOptionDialog(
                    context,
                    showHeaderIcon: false,
                    title: context.strings.are_you_sure,
                    msgPadding: EdgeInsets.symmetric(horizontal: 15.sp),
                    msgStyle: context.fonts.latoRegularItalic,
                    msg: (blocModel?.isUnsubscribeFromAllSelected ?? false)
                        ? context.strings.unsubscribe_from_all_popup_msg
                        : (blocModel?.isUnsubscribeFromAllEmailsSelected ?? false)
                            ? context.strings.unsubscribe_from_emails_popup_msg
                            : context.strings.unsubscribe_from_push_popup_msg,
                    negativeButtonText: context.strings.cancel,
                    positiveButtonText: context.strings.yes_i_am,
                    positiveButtonClick: () {
                      context
                          .read<CommunicationPreferencesBloc>()
                          .add(const CommunicationPreferencesEvent.saveChanges());
                    },
                  );
                }
              },
            ),
          ),
        )
      ],
    );
  }
}
