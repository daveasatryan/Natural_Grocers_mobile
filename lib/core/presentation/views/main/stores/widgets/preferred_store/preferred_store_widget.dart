import 'package:dart_extensions_methods/dart_extension_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:natural_groceries/core/presentation/utilities/provider/user_provider.dart';
import 'package:natural_groceries/core/presentation/views/main/stores/bloc/stores_bloc.dart';
import 'package:natural_groceries/core/presentation/views/main/stores/widgets/preferred_store/bloc/preferred_store_bloc.dart';
import 'package:natural_groceries/core/presentation/views/main/stores/widgets/store_details/store_details_widget.dart';

class PreferredStoreWidget extends StatelessWidget {
  const PreferredStoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => context.read<PreferredStoreBloc>(),
      child: StoreDetailsWidget(
        isMyPreferredStore: true,
        store: context.read<StoresBloc>().stores.firstWhereOrNull(
              (element) => element.nid == context.read<UserProvider>().userModel?.preferredStore,
            ),
      ),
    );
  }
}
