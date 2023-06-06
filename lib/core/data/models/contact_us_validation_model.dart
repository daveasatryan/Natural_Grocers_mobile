import 'package:natural_groceries/core/data/enums/validation_enum.dart';
import 'package:natural_groceries/core/data/models/store/store_model.dart';

class ContactUsValidationModel {
  final ValidationEnum firstNameValidation;
  final ValidationEnum lastNameValidation;
  final ValidationEnum emailValidation;
  final ValidationEnum phoneNumberValidation;
  final ValidationEnum selectedTopicValidation;
  final ValidationEnum storeValidation;
  final ValidationEnum messageValidation;
  final bool isButtonActive;
  final List<StoreModel> stores;
  final StoreModel? selectedStore;

  ContactUsValidationModel({
    required this.firstNameValidation,
    required this.lastNameValidation,
    required this.emailValidation,
    required this.phoneNumberValidation,
    required this.selectedTopicValidation,
    required this.storeValidation,
    required this.messageValidation,
    required this.isButtonActive,
    required this.stores,
    required this.selectedStore,
  });

  factory ContactUsValidationModel.initial() {
    return ContactUsValidationModel(
      firstNameValidation: ValidationEnum.none,
      lastNameValidation: ValidationEnum.none,
      emailValidation: ValidationEnum.none,
      phoneNumberValidation: ValidationEnum.none,
      selectedTopicValidation: ValidationEnum.none,
      storeValidation: ValidationEnum.none,
      messageValidation: ValidationEnum.none,
      isButtonActive: false,
      selectedStore: null,
      stores: [],
    );
  }
}
