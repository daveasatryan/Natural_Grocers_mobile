import 'package:freezed_annotation/freezed_annotation.dart';

part 'find_store_event.freezed.dart';

@freezed
class FindStoreEvent with _$FindStoreEvent {
  const factory FindStoreEvent.search(String? searchKey) = Search;
}
