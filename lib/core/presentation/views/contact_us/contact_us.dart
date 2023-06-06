import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natural_groceries/core/data/utilities/bloc/bloc_factory.dart';
import 'package:natural_groceries/core/presentation/utilities/assets/app_assets.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/views/contact_us/bloc/contact_us_bloc.dart';
import 'package:natural_groceries/core/presentation/views/contact_us/bloc/contact_us_event.dart';
import 'package:natural_groceries/core/presentation/views/contact_us/bloc/contact_us_state.dart';
import 'package:natural_groceries/core/presentation/views/contact_us/widgets/contact_us_footer.dart';
import 'package:natural_groceries/core/presentation/views/contact_us/widgets/contact_us_header.dart';
import 'package:natural_groceries/core/presentation/widgets/app_scaffold.dart';
import 'package:natural_groceries/core/presentation/widgets/base/base_stateless_mixin.dart';
import 'package:natural_groceries/core/presentation/widgets/custom_widgets/header_widget.dart';

class ContactUs extends StatelessWidget with BaseStatelessMixin {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Scaffold(
        backgroundColor: context.colors.whiteColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(115.sp),
          child: HeaderWidget(
            text: context.strings.contact_us,
            textStyle: context.fonts.latoBoldItalic.copyWith(
              fontSize: 34.sp,
              color: context.colors.whiteColor,
            ),
            height: 115.sp,
            headerImagePath: AppAssets.contactUsHeaderImage,
          ),
        ),
        body: BlocProvider(
          create: (context) => context.read<BlocFactory>().create<ContactUsBloc>()
            ..add(const ContactUsEvent.getStores()),
          child: BlocConsumer<ContactUsBloc, ContactUsState>(
            buildWhen: (prev, cur) => cur.buildWhen(),
            listenWhen: (prev, cur) => cur.listenWhen(),
            listener: (context, state) {
              state.whenOrNull(error: (msg) => showErrorDialog(context, msg: msg));
            },
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () => Container(),
                loading: () => const Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
                initial: (validationModel) {
                  return SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 35.sp, horizontal: 21.sp),
                      child: Column(
                        children: [
                          const ContactUsHeader(),
                          SizedBox(height: 22.sp),
                          ContactUsFooter(validationModel: validationModel),
                        ],
                      ),
                    ),
                  );
                }
              );
            },
          )
        )
      ),
    );
  }
}
