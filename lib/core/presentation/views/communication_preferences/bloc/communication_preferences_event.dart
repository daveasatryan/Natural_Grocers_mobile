import 'package:freezed_annotation/freezed_annotation.dart';

part 'communication_preferences_event.freezed.dart';

@freezed
class CommunicationPreferencesEvent with _$CommunicationPreferencesEvent {
  const factory CommunicationPreferencesEvent.toggleRadioButton({
    bool? isUnsubscribeFromAllSelected,
    bool? isUnsubscribeFromAllEmailsSelected,
    bool? isUnsubscribeFromAllNotificationsSelected,
  }) = ToggleRadioButton;

  const factory CommunicationPreferencesEvent.toggleEmailNotifications({
    required int index,
    required bool isEmailEnabled,
  }) = ToggleEmailNotifications;

  const factory CommunicationPreferencesEvent.togglePushNotifications({
    required int index,
    required bool isPushEnabled,
  }) = TogglePushNotifications;

  const factory CommunicationPreferencesEvent.saveChanges() = SaveChanges;
}
