import 'package:dart_extensions_methods/dart_extension_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natural_groceries/core/data/models/store/store_model.dart';
import 'package:natural_groceries/core/data/utilities/helper.dart';
import 'package:natural_groceries/core/presentation/views/main/stores/widgets/find_store/bloc/find_store_bloc.dart';
import 'package:natural_groceries/core/presentation/views/main/stores/widgets/find_store/bloc/find_store_state.dart';
import 'package:natural_groceries/core/presentation/views/main/stores/widgets/find_store/widgets/store_card_widget.dart';

class ListStoreView extends StatelessWidget {
  const ListStoreView({
    super.key,
    required this.stores,
  });

  final List<StoreModel> stores;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FindStoreBloc, FindStoreState>(
      builder: (context, state) {
        final stores = state.searchKey.isNullOrEmpty()
            ? this.stores
            : this
                .stores
                .where((element) =>
                    element.fullTitle?.contains(state.searchKey ?? '') == true ||
                    element.fieldStoreAddress?.postalCode?.contains(state.searchKey ?? '') ==
                        true ||
                    element.fieldStoreAddress?.locality?.contains(state.searchKey ?? '') == true ||
                    element.fieldStoreAddress?.administrativeArea
                            ?.contains(state.searchKey ?? '') ==
                        true)
                .toList();
        return Padding(
          padding: EdgeInsets.only(top: 90.sp),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: stores.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(top: 8.sp, right: 20.sp, left: 20.sp),
                child: StoreCardWidget(
                  store: stores.getOrNull(index),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
