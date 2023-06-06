import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natural_groceries/core/data/enums/hotline_magazine_page_enum.dart';
import 'package:natural_groceries/core/data/utilities/bloc/bloc_factory.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/views/main/hotline_magazine/bloc/hotline_magazine_bloc.dart';
import 'package:natural_groceries/core/presentation/views/main/hotline_magazine/bloc/hotline_magazine_state.dart';
import 'package:natural_groceries/core/presentation/views/main/hotline_magazine/widgets/hotline_magazine_footer.dart';
import 'package:natural_groceries/core/presentation/views/main/hotline_magazine/widgets/hotline_magazine_header.dart';
import 'package:natural_groceries/core/presentation/views/main/hotline_magazine/widgets/search_view.dart';
import 'package:natural_groceries/core/presentation/views/main/hotline_magazine/widgets/table_of_contents.dart';
import 'package:natural_groceries/core/presentation/views/main/hotline_magazine/widgets/thumbnails.dart';
import 'package:natural_groceries/core/presentation/widgets/app_scaffold.dart';
import 'package:natural_groceries/core/presentation/widgets/custom_widgets/header_widget.dart';

class HotlineMagazine extends StatelessWidget {
  const HotlineMagazine({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: BlocProvider(
        create: (context) => context.read<BlocFactory>().create<HotlineMagazineBloc>(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeaderWidget(
                text: context.strings.hotline_magazine,
                textStyle: context.fonts.latoBlackItalic.copyWith(color: context.colors.whiteColor),
                isNested: true,
                height: 97.sp,
              ),
              BlocBuilder<HotlineMagazineBloc, HotlineMagazineState>(
                builder: (context, state) {
                  return state.when(
                    initial: (page, index) {
                      if (page == HotlineMagazinePageEnum.slideView) {
                        return SingleChildScrollView(
                          child: Column(
                            children: [
                              const HotlineMagazineHeader(),
                              SizedBox(height: 10.sp),
                              HotlineMagazineFooter(imageIndex: index),
                            ],
                          ),
                        );
                      }
                      if (page == HotlineMagazinePageEnum.thumbnails) {
                        return const Thumbnails();
                      }
                      if (page == HotlineMagazinePageEnum.tableOfContents) {
                        return TableOfContents();
                      }
                      if (page == HotlineMagazinePageEnum.search) {
                        return const SearchView();
                      }
                      return Container();
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
