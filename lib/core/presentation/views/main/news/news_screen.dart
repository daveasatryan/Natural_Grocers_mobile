import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natural_groceries/core/data/utilities/bloc/bloc_factory.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/views/main/news/bloc/news_bloc.dart';
import 'package:natural_groceries/core/presentation/views/main/news/bloc/news_state.dart';
import 'package:natural_groceries/core/presentation/views/main/news/widgets/news_widget.dart';
import 'package:natural_groceries/core/presentation/widgets/custom_widgets/header_widget.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.whiteColor,
      body: BlocProvider(
        create: (context) => context.read<BlocFactory>().create<NewsBloc>(),
        child: BlocBuilder<NewsBloc, NewsState>(builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(bottom: 100.sp),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  HeaderWidget(
                    text: context.strings.what_new,
                    hasBack: false,
                    height: 97.sp,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 5,
                      itemBuilder: (context, index) => const NewsWidget(),
                      separatorBuilder: (context, index) => SizedBox(
                        height: 11.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
