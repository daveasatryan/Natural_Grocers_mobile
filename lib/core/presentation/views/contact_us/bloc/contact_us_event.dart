import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:natural_groceries/core/data/models/store/store_model.dart';

part 'contact_us_event.freezed.dart';

@freezed
class ContactUsEvent with _$ContactUsEvent {

  const factory ContactUsEvent.getStores() = GetStores;

  const factory ContactUsEvent.validateFirsName(String? firsName) = ValidateFirsName;

  const factory ContactUsEvent.validateLastName(String? lastName) = ValidateLastName;

  const factory ContactUsEvent.validateEmail(String? email) = ValidateEmail;

  const factory ContactUsEvent.validatePhoneNumber(String? phoneNumber) = ValidatePhoneNumber;

  const factory ContactUsEvent.validateTopic(String? topic) = ValidateTopic;

  const factory ContactUsEvent.validateSelectedStore(StoreModel? store) = ValidateSelectedStore;

  const factory ContactUsEvent.validateMessage(String? message) = ValidateMessage;

  const factory ContactUsEvent.validate() = Validate;
}
