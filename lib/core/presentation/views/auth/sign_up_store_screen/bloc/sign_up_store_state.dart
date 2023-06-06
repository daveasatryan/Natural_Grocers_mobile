import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:natural_groceries/core/data/enums/meal_deals_view_enum.dart';
import 'package:natural_groceries/core/data/models/store/store_model.dart';

part 'sign_up_store_state.freezed.dart';

@freezed
class SignUpStoreState with _$SignUpStoreState {
  const factory SignUpStoreState.loading() = _$SignUpStoreStateLoading;

  const factory SignUpStoreState.searchStore(String? searchKey) = _$SignUpStoreStateSearchStore;

  const factory SignUpStoreState.success({
    required List<StoreModel> stores,
    required ListViewType listViewType,
    String? searchKey,
  }) = _$SignUpStoreStateSuccess;

  const factory SignUpStoreState.error({
    required String msg,
  }) = _$SignUpStoreStateError;
}

extension SignUpStoreStateExt on SignUpStoreState {
  bool buildWhen() => when(
        loading: () => true,
        success: (_, __, ___) => true,
        error: (_) => false,
        searchStore: (_) => false,
      );

  bool listenWhen() => !buildWhen();
}
