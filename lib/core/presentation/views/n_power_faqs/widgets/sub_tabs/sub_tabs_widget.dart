import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:natural_groceries/core/data/models/faqs/faqs_single_model.dart';
import 'package:natural_groceries/core/data/utilities/bloc/bloc_factory.dart';
import 'package:natural_groceries/core/presentation/utilities/assets/app_assets.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/views/n_power_faqs/widgets/sub_tabs/bloc/sub_tabs_bloc.dart';
import 'package:natural_groceries/core/presentation/views/n_power_faqs/widgets/sub_tabs/bloc/sub_tabs_event.dart';
import 'package:natural_groceries/core/presentation/views/n_power_faqs/widgets/sub_tabs/bloc/sub_tabs_state.dart';

class SubTabsWidget extends StatefulWidget {
  final String title;
  final List<FaqsSingleModel>? faqsList;

  const SubTabsWidget({
    super.key,
    required this.faqsList,
    required this.title,
  });

  @override
  State<SubTabsWidget> createState() => _SubTabsWidgetState();
}

class _SubTabsWidgetState extends State<SubTabsWidget> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => context.read<BlocFactory>().create<SubTabsBloc>(),
      child: BlocBuilder<SubTabsBloc, SubTabsState>(
        builder: (context, state) {
          return state.when(
            initial: (_) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.title,
                    style: context.fonts.latoBoldItalic.copyWith(
                      color: context.colors.tabIndicatorColor,
                      fontSize: 24.sp,
                    ),
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: widget.faqsList?.length ?? 0,
                    separatorBuilder: (context, index) => Container(
                      height: 0.5.sp,
                      color: context.colors.borderTrueColor,
                    ),
                    itemBuilder: (context, index) {
                      FaqsSingleModel? faq = widget.faqsList?[index];
                      return ListTileTheme(
                        dense: true,
                        minLeadingWidth: 0,
                        horizontalTitleGap: 0,
                        minVerticalPadding: 0,
                        contentPadding: EdgeInsets.zero,
                        child: Theme(
                          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                          child: ExpansionTile(
                            childrenPadding: EdgeInsets.zero,
                            tilePadding: EdgeInsets.zero,
                            title: Text(
                              faq?.question ?? '',
                              style: context.fonts.latoBold.copyWith(
                                fontSize: 16.sp,
                                color: context.colors.borderTrueColor,
                              ),
                            ),
                            controlAffinity: ListTileControlAffinity.trailing,
                            trailing: faq?.isExpanded == true
                                ? SvgPicture.asset(AppAssets.expansionTileExpanded)
                                : SvgPicture.asset(AppAssets.expansionTileCollapsed),
                            children: faq?.isExpanded == true ? [
                                ListTile(title: Html(data: faq?.answer?.value)),
                            ] : [],
                            onExpansionChanged: (value) {
                              faq?.isExpanded = value;
                              context.read<SubTabsBloc>().add(
                                    SubTabsEvent.toggleExpansion(index),
                                  );
                            },
                          ),
                        ),
                      );
                    },
                  )
                ],
              );
            },
          );
        },
      ),
    );
  }
}
