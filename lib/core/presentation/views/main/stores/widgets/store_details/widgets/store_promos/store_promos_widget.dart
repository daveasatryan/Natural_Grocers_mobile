import 'package:dart_extensions_methods/dart_extension_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:natural_groceries/core/data/models/store/store_promo_model.dart';
import 'package:natural_groceries/core/data/utilities/bloc/bloc_factory.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/views/main/stores/widgets/store_details/widgets/store_promos/bloc/store_promos_bloc.dart';
import 'package:natural_groceries/core/presentation/views/main/stores/widgets/store_details/widgets/store_promos/bloc/store_promos_event.dart';
import 'package:natural_groceries/core/presentation/views/main/stores/widgets/store_details/widgets/store_promos/bloc/store_promos_state.dart';
import 'package:natural_groceries/core/presentation/widgets/app_loading.dart';
import 'package:natural_groceries/core/presentation/widgets/app_network_image.dart';

class StorePromosWidget extends StatefulWidget {
  const StorePromosWidget({
    super.key,
    this.storeId,
  });

  final String? storeId;

  @override
  State<StorePromosWidget> createState() => _StorePromosWidgetState();
}

class _StorePromosWidgetState extends State<StorePromosWidget> {
  bool hasPromos = true;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: hasPromos,
      child: BlocProvider(
        create: (context) => context.read<BlocFactory>().create<StorePromosBloc>()
          ..add(StorePromosEvent.getPromos(widget.storeId)),
        child: AspectRatio(
          aspectRatio: 375 / 133,
          child: BlocBuilder<StorePromosBloc, StorePromosState>(
            builder: (context, state) => state.when(
              loading: () => const AppLoadingWidget(),
              error: (msg) => Center(
                child: Text(
                  msg,
                  style: context.fonts.latoMediumItalic,
                ),
              ),
              success: (data) {
                if (data.isNullOrEmpty()) {
                  setState(() {
                    hasPromos = false;
                  });
                }
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final model = data[index];
                    return Padding(
                      padding: EdgeInsets.only(
                        left: index == 0 ? 12.sp : 5.sp,
                        right: data.length - 1 == index ? 12.sp : 0,
                      ),
                      child: AspectRatio(
                        aspectRatio: 332 / 133,
                        child: AppNetworkImage(model.image),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
