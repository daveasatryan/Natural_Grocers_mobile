class CommunicationPreferencesBlocModel {
  List<int>? emailNotificationsList;
  List<int>? pushNotificationsList;

  bool? isUnsubscribeFromAllSelected;
  bool? isUnsubscribeFromAllEmailsSelected;
  bool? isUnsubscribeFromAllNotificationsSelected;

  CommunicationPreferencesBlocModel({
    this.emailNotificationsList,
    this.pushNotificationsList,
    this.isUnsubscribeFromAllSelected,
    this.isUnsubscribeFromAllEmailsSelected,
    this.isUnsubscribeFromAllNotificationsSelected,
  });

  factory CommunicationPreferencesBlocModel.initial() {
    return CommunicationPreferencesBlocModel(
      isUnsubscribeFromAllEmailsSelected: false,
      isUnsubscribeFromAllNotificationsSelected: false,
      isUnsubscribeFromAllSelected: false,
    );
  }
}
