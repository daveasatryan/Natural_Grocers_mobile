import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natural_groceries/core/data/models/store/store_model.dart';
import 'package:natural_groceries/core/data/utilities/helper.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/views/main/stores/widgets/store_details/store_details_widget.dart';
import 'package:natural_groceries/core/presentation/widgets/app_scaffold.dart';
import 'package:natural_groceries/core/presentation/widgets/custom_widgets/header_widget.dart';

class StoreDetailsScreen extends StatelessWidget {
  const StoreDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final StoreModel? store = ModalRoute.of(context)?.settings.arguments.nullableCast<StoreModel>();

    return AppScaffold(
      child: Scaffold(
        backgroundColor: context.colors.whiteColor,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              HeaderWidget(
                text: context.strings.title_store_details,
                height: 97.sp,
                isNested: true,
              ),
              SizedBox(height: 24.sp),
              Padding(
                padding: EdgeInsets.only(bottom: 100.sp),
                child: StoreDetailsWidget(store: store),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
