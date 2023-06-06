import 'package:dart_extensions_methods/dart_extension_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natural_groceries/core/data/models/store/store_model.dart';
import 'package:natural_groceries/core/data/utilities/helper.dart';
import 'package:natural_groceries/core/presentation/views/auth/sign_up_store_screen/widgets/sign_up_store_card_widget.dart';

class SignUpListStoreView extends StatelessWidget {
  const SignUpListStoreView({super.key, required this.stores, required this.searchKey});

  final List<StoreModel> stores;
  final String searchKey;

  @override
  Widget build(BuildContext context) {
    final stores = searchKey.isNullOrEmpty()
        ? this.stores
        : this
            .stores
            .where((element) =>
                element.fullTitle?.contains(searchKey) == true ||
                element.fieldStoreAddress?.postalCode?.contains(searchKey) == true ||
                element.fieldStoreAddress?.locality?.contains(searchKey) == true ||
                element.fieldStoreAddress?.administrativeArea?.contains(searchKey) == true)
            .toList();
    return Padding(
      padding: EdgeInsets.only(top: 30.sp),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: stores.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(top: 8.sp, right: 20.sp, left: 20.sp),
            child: SignUpStoreCardWidget(
              store: stores.getOrNull(index),
            ),
          );
        },
      ),
    );
  }
}
