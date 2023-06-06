import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natural_groceries/core/data/utilities/bloc/bloc_factory.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/views/communication_preferences/bloc/communication_preferences_bloc.dart';
import 'package:natural_groceries/core/presentation/views/communication_preferences/bloc/communication_preferences_state.dart';
import 'package:natural_groceries/core/presentation/views/communication_preferences/widgets/communication_preferences_footer.dart';
import 'package:natural_groceries/core/presentation/views/communication_preferences/widgets/communication_preferences_header.dart';
import 'package:natural_groceries/core/presentation/widgets/app_scaffold.dart';
import 'package:natural_groceries/core/presentation/widgets/base/base_state.dart';
import 'package:natural_groceries/core/presentation/widgets/custom_widgets/header_widget.dart';

class CommunicationPreferences extends StatefulWidget {
  const CommunicationPreferences({super.key});

  @override
  State<CommunicationPreferences> createState() => _CommunicationPreferencesState();
}

class _CommunicationPreferencesState extends State<CommunicationPreferences> with BaseStateMixin {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Scaffold(
        backgroundColor: context.colors.whiteColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.sp),
          child: HeaderWidget(
            text: strings.communication_preferences,
            height: 80.sp,
            fillColor: colors.greenScreenColor,
            textStyle: fonts.latoMediumItalic.copyWith(
              fontSize: 24.sp,
              color: colors.whiteColor,
            ),
          ),
        ),
        body: BlocProvider(
          create: (context) => context.read<BlocFactory>().create<CommunicationPreferencesBloc>(),
          child: BlocBuilder<CommunicationPreferencesBloc, CommunicationPreferencesState>(
            builder: (context, state) {
              return state.when(
                initial: (blocModel) {
                  return SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 25.sp),
                      child: Column(
                        children: [
                          CommunicationPreferencesHeader(blocModel: blocModel),
                          SizedBox(height: 45.sp),
                          CommunicationPreferencesFooter(blocModel: blocModel),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
