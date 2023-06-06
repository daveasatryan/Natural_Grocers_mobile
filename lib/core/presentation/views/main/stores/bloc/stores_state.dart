import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:natural_groceries/core/data/enums/store_page_type.dart';

part 'stores_state.freezed.dart';

@Freezed(equal: false)
class StoresState with _$StoresState {
  const factory StoresState.currentPage({
    required StorePageType page,
    required bool showLoading,
  }) = _$StoresStateCurrentPage;

  const factory StoresState.loading() = _$StoresStateLoading;
}

extension StoresStateExt on StoresState {
  bool buildWhen() => when(
        currentPage: (_, __) => true,
        loading: () => false,
      );

  bool listenWhen() => !buildWhen();
}
