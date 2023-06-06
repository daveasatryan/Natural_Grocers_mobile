import 'package:freezed_annotation/freezed_annotation.dart';

part 'find_store_state.freezed.dart';

@freezed
class FindStoreState with _$FindStoreState {
  const factory FindStoreState.searchStore(String? searchKey) = _$FindStoreStateSearchStore;
}
