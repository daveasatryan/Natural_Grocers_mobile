import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:natural_groceries/core/data/models/store/store_model.dart';

part 'my_preferred_store_state.freezed.dart';

@freezed
class MyPreferredStoreState with _$MyPreferredStoreState {
  const factory MyPreferredStoreState.loading() = _$MyPreferredStoreStateLoading;

  const factory MyPreferredStoreState.success({required List<StoreModel>? stores}) =
      _$MyPreferredStoreStateSuccess;

  const factory MyPreferredStoreState.error({
    required String msg,
  }) = _$MyPreferredStoreStateError;
}

extension MyPreferredStoreStateExt on MyPreferredStoreState {
  bool buildWhen() => when(
        success: (_) => true,
        loading: () => true,
        error: (_) => false,
      );

  bool listenWhen() => !buildWhen();
}
