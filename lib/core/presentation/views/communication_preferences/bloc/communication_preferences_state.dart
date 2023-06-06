import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:natural_groceries/core/data/models/communication_preferences_bloc_model.dart';

part 'communication_preferences_state.freezed.dart';

@freezed
class CommunicationPreferencesState with _$CommunicationPreferencesState {
  const factory CommunicationPreferencesState.initial(
      {CommunicationPreferencesBlocModel? blocModel}) = _$CommunicationPreferencesStateInitial;
}
