import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:natural_groceries/core/data/models/communication_preferences_bloc_model.dart';
import 'package:natural_groceries/core/data/models/communication_preferences_model.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/views/communication_preferences/bloc/communication_preferences_bloc.dart';
import 'package:natural_groceries/core/presentation/views/communication_preferences/bloc/communication_preferences_event.dart';
import 'package:natural_groceries/core/presentation/views/communication_preferences/widgets/notification_options.dart';
import 'package:provider/provider.dart';

class CommunicationPreferencesHeader extends StatelessWidget {
  final CommunicationPreferencesBlocModel? blocModel;

  CommunicationPreferencesHeader({
    super.key,
    required this.blocModel,
  });

  final List<String> preferencesList = CommunicationPreferencesModel.getCommunicationPreferences;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          context.strings.communication_preferences_test,
          style: context.fonts.latoRegularItalic.copyWith(fontSize: 14.sp),
        ),
        SizedBox(height: 45.sp),
        NotificationOptions(
          headerRow: Row(
            children: [
              Expanded(
                flex: 3,
                child: Text(
                  context.strings.options,
                  style: context.fonts.latoLightItalic.copyWith(
                    color: context.colors.blackOpacityColor,
                    fontSize: 20.sp,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  context.strings.email_option,
                  style: context.fonts.latoLightItalic.copyWith(
                    color: context.colors.blackOpacityColor,
                    fontSize: 20.sp,
                  ),
                ),
              ),
              SizedBox(width: 25.sp),
              Expanded(
                child: Text(
                  context.strings.push_option,
                  style: context.fonts.latoLightItalic.copyWith(
                    color: context.colors.blackOpacityColor,
                    fontSize: 20.sp,
                  ),
                ),
              )
            ],
          ),
          contentView: ListView.separated(
            itemCount: preferencesList.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => SizedBox(height: 19.sp),
            itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      preferencesList[index],
                    ),
                  ),
                  Expanded(
                    child: FlutterSwitch(
                      height: 23.sp,
                      width: 50.sp,
                      value: blocModel?.emailNotificationsList?.contains(index) ?? false,
                      activeColor: context.colors.greenScreenColor,
                      inactiveColor: context.colors.appSecondaryColor,
                      onToggle: (value) {
                        context.read<CommunicationPreferencesBloc>().add(
                              CommunicationPreferencesEvent.toggleEmailNotifications(
                                index: index,
                                isEmailEnabled: !value,
                              ),
                            );
                      },
                    ),
                  ),
                  Expanded(
                    child: FlutterSwitch(
                      height: 23.sp,
                      width: 50.sp,
                      value: blocModel?.pushNotificationsList?.contains(index) ?? false,
                      activeColor: context.colors.greenScreenColor,
                      inactiveColor: context.colors.appSecondaryColor,
                      onToggle: (value) {
                        context.read<CommunicationPreferencesBloc>().add(
                              CommunicationPreferencesEvent.togglePushNotifications(
                                index: index,
                                isPushEnabled: !value,
                              ),
                            );
                      },
                    ),
                  )
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
