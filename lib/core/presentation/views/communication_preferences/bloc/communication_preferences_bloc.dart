import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:natural_groceries/core/data/models/communication_preferences_bloc_model.dart';
import 'package:natural_groceries/core/presentation/views/communication_preferences/bloc/communication_preferences_event.dart';
import 'package:natural_groceries/core/presentation/views/communication_preferences/bloc/communication_preferences_state.dart';

@injectable
class CommunicationPreferencesBloc
    extends Bloc<CommunicationPreferencesEvent, CommunicationPreferencesState> {
  late CommunicationPreferencesBlocModel blocModel;

  CommunicationPreferencesBloc()
      : super(CommunicationPreferencesState.initial(
            blocModel: CommunicationPreferencesBlocModel.initial())) {
    blocModel = state.whenOrNull(initial: (validationModel) => validationModel) ??
        CommunicationPreferencesBlocModel.initial();

    on<ToggleRadioButton>(_onToggleRadioButton);
    on<ToggleEmailNotifications>(_onToggleEmailNotifications);
    on<TogglePushNotifications>(_onTogglePushNotifications);
    on<SaveChanges>(_onSaveChanges);
  }

  List<int> emailNotificationsList = [];
  List<int> pushNotificationsList = [];

  void _onToggleRadioButton(ToggleRadioButton event, Emitter<CommunicationPreferencesState> emit) {
    if (event.isUnsubscribeFromAllSelected == true) {
      blocModel = CommunicationPreferencesBlocModel(
        isUnsubscribeFromAllSelected: true,
        isUnsubscribeFromAllNotificationsSelected: false,
        isUnsubscribeFromAllEmailsSelected: false,
        emailNotificationsList: emailNotificationsList,
        pushNotificationsList: pushNotificationsList,
      );
    }

    if (event.isUnsubscribeFromAllEmailsSelected == true) {
      blocModel = CommunicationPreferencesBlocModel(
        isUnsubscribeFromAllEmailsSelected: true,
        isUnsubscribeFromAllSelected: false,
        isUnsubscribeFromAllNotificationsSelected: false,
        emailNotificationsList: emailNotificationsList,
        pushNotificationsList: pushNotificationsList,
      );
    }

    if (event.isUnsubscribeFromAllNotificationsSelected == true) {
      blocModel = CommunicationPreferencesBlocModel(
        isUnsubscribeFromAllNotificationsSelected: true,
        isUnsubscribeFromAllSelected: false,
        isUnsubscribeFromAllEmailsSelected: false,
        emailNotificationsList: emailNotificationsList,
        pushNotificationsList: pushNotificationsList,
      );
    }

    emit(CommunicationPreferencesState.initial(blocModel: blocModel));
  }

  void _onToggleEmailNotifications(
      ToggleEmailNotifications event, Emitter<CommunicationPreferencesState> emit) {
    if (emailNotificationsList.contains(event.index)) {
      emailNotificationsList.remove(event.index);
    } else {
      emailNotificationsList.add(event.index);
    }

    blocModel = CommunicationPreferencesBlocModel(
      emailNotificationsList: emailNotificationsList,
      pushNotificationsList: pushNotificationsList,
      isUnsubscribeFromAllSelected: blocModel.isUnsubscribeFromAllSelected,
      isUnsubscribeFromAllNotificationsSelected: blocModel.isUnsubscribeFromAllEmailsSelected,
      isUnsubscribeFromAllEmailsSelected: blocModel.isUnsubscribeFromAllEmailsSelected,
    );

    emit(CommunicationPreferencesState.initial(blocModel: blocModel));
  }

  void _onTogglePushNotifications(
      TogglePushNotifications event, Emitter<CommunicationPreferencesState> emit) {
    if (pushNotificationsList.contains(event.index)) {
      pushNotificationsList.remove(event.index);
    } else {
      pushNotificationsList.add(event.index);
    }

    blocModel = CommunicationPreferencesBlocModel(
      pushNotificationsList: pushNotificationsList,
      emailNotificationsList: emailNotificationsList,
      isUnsubscribeFromAllSelected: blocModel.isUnsubscribeFromAllSelected,
      isUnsubscribeFromAllNotificationsSelected: blocModel.isUnsubscribeFromAllEmailsSelected,
      isUnsubscribeFromAllEmailsSelected: blocModel.isUnsubscribeFromAllEmailsSelected,
    );

    emit(CommunicationPreferencesState.initial(blocModel: blocModel));
  }

  void _onSaveChanges(SaveChanges event, Emitter<CommunicationPreferencesState> emit) {
    // todo: implement save changes
  }
}
