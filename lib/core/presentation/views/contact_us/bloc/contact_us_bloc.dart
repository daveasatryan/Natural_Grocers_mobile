import 'package:bloc/bloc.dart';
import 'package:dart_extensions_methods/dart_extension_methods.dart';
import 'package:injectable/injectable.dart';
import 'package:natural_groceries/core/data/enums/validation_enum.dart';
import 'package:natural_groceries/core/data/models/contact_us_validation_model.dart';
import 'package:natural_groceries/core/data/models/store/store_model.dart';
import 'package:natural_groceries/core/data/usecases/content/get_stores_usecase.dart';
import 'package:natural_groceries/core/data/validation_utils.dart';
import 'package:natural_groceries/core/presentation/views/contact_us/bloc/contact_us_event.dart';
import 'package:natural_groceries/core/presentation/views/contact_us/bloc/contact_us_state.dart';

@injectable
class ContactUsBloc extends Bloc<ContactUsEvent, ContactUsState> {
  late ContactUsValidationModel validationModel;

  ContactUsBloc(this.getStoresUsecase) : super(const ContactUsState.loading()) {
    validationModel = state.whenOrNull(initial: (validationModel) => validationModel) ??
        ContactUsValidationModel.initial();

    on<GetStores>(_onGetStores);
    on<ValidateFirsName>(_onValidateFirsName);
    on<ValidateLastName>(_onValidateLastName);
    on<ValidateEmail>(_onValidateEmail);
    on<ValidatePhoneNumber>(_onValidatePhoneNumber);
    on<ValidateTopic>(_onValidateTopic);
    on<ValidateSelectedStore>(_onValidateSelectedStore);
    on<ValidateMessage>(_onValidateMessage);
    on<Validate>(_onValidate);
  }

  final GetStoresUsecase getStoresUsecase;

  List<StoreModel> stores = [];

  ValidationEnum? firstNameValidation;
  ValidationEnum? lastNameValidation;
  ValidationEnum? emailValidation;
  ValidationEnum? phoneNumberValidation;
  ValidationEnum? topicValidation;
  ValidationEnum? storeValidation;
  ValidationEnum? messageValidation;

  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? topic;
  String? message;
  StoreModel? store;

  bool get isButtonActive =>
      (firstNameValidation == ValidationEnum.none || firstNameValidation == ValidationEnum.valid) &&
      (lastNameValidation == ValidationEnum.none || lastNameValidation == ValidationEnum.valid) &&
      (emailValidation == ValidationEnum.none || emailValidation == ValidationEnum.valid) &&
      (phoneNumberValidation == ValidationEnum.none ||
          phoneNumberValidation == ValidationEnum.valid) &&
       /*(topicValidation == ValidationEnum.none || topicValidation == ValidationEnum.valid) &&*/
          (storeValidation == ValidationEnum.none || storeValidation == ValidationEnum.valid) &&
      (messageValidation == ValidationEnum.none || messageValidation == ValidationEnum.valid);

  void _onGetStores(GetStores event, Emitter<ContactUsState> emit) async {
    emit(const ContactUsState.loading());

    final response = await getStoresUsecase();

    response.when(
      success: (data) {
        stores = data?.result ?? [];
        validationModel = ContactUsValidationModel(
          firstNameValidation: firstNameValidation ?? ValidationEnum.none,
          lastNameValidation: lastNameValidation ?? ValidationEnum.none,
          emailValidation: emailValidation ?? ValidationEnum.none,
          phoneNumberValidation: phoneNumberValidation ?? ValidationEnum.none,
          selectedTopicValidation: topicValidation ?? ValidationEnum.none,
          storeValidation: storeValidation ?? ValidationEnum.none,
          messageValidation: messageValidation ?? ValidationEnum.none,
          isButtonActive: isButtonActive,
          selectedStore: store,
          stores: stores,
        );
        emit(ContactUsState.initial(validationModel: validationModel));
      },
      error: (msg) => emit(ContactUsState.error(msg)),
    );
  }

  void _onValidateFirsName(ValidateFirsName event, Emitter<ContactUsState> emit) {
    firstName = event.firsName;
    firstNameValidation = ValidationEnum.none;

    validationModel = ContactUsValidationModel(
      firstNameValidation: firstNameValidation ?? ValidationEnum.none,
      lastNameValidation: lastNameValidation ?? ValidationEnum.none,
      emailValidation: emailValidation ?? ValidationEnum.none,
      phoneNumberValidation: phoneNumberValidation ?? ValidationEnum.none,
      selectedTopicValidation: topicValidation ?? ValidationEnum.none,
      storeValidation: storeValidation ?? ValidationEnum.none,
      messageValidation: messageValidation ?? ValidationEnum.none,
      isButtonActive: isButtonActive,
      selectedStore: store,
      stores: stores,
    );

    emit(ContactUsState.initial(validationModel: validationModel));
  }

  void _onValidateLastName(ValidateLastName event, Emitter<ContactUsState> emit) {
    lastName = event.lastName;
    lastNameValidation = ValidationEnum.none;

    validationModel = ContactUsValidationModel(
      firstNameValidation: firstNameValidation ?? ValidationEnum.none,
      lastNameValidation: lastNameValidation ?? ValidationEnum.none,
      emailValidation: emailValidation ?? ValidationEnum.none,
      phoneNumberValidation: phoneNumberValidation ?? ValidationEnum.none,
      selectedTopicValidation: topicValidation ?? ValidationEnum.none,
      storeValidation: storeValidation ?? ValidationEnum.none,
      messageValidation: messageValidation ?? ValidationEnum.none,
      isButtonActive: isButtonActive,
      selectedStore: store,
      stores: stores,
    );

    emit(ContactUsState.initial(validationModel: validationModel));
  }

  void _onValidateEmail(ValidateEmail event, Emitter<ContactUsState> emit) {
    email = event.email;
    emailValidation = ValidationEnum.none;

    validationModel = ContactUsValidationModel(
      firstNameValidation: firstNameValidation ?? ValidationEnum.none,
      lastNameValidation: lastNameValidation ?? ValidationEnum.none,
      emailValidation: emailValidation ?? ValidationEnum.none,
      phoneNumberValidation: phoneNumberValidation ?? ValidationEnum.none,
      selectedTopicValidation: topicValidation ?? ValidationEnum.none,
      storeValidation: storeValidation ?? ValidationEnum.none,
      messageValidation: messageValidation ?? ValidationEnum.none,
      isButtonActive: isButtonActive,
      selectedStore: store,
      stores: stores,
    );

    emit(ContactUsState.initial(validationModel: validationModel));
  }

  void _onValidatePhoneNumber(ValidatePhoneNumber event, Emitter<ContactUsState> emit) {
    phoneNumber = event.phoneNumber;
    phoneNumberValidation = ValidationEnum.none;

    validationModel = ContactUsValidationModel(
      firstNameValidation: firstNameValidation ?? ValidationEnum.none,
      lastNameValidation: lastNameValidation ?? ValidationEnum.none,
      emailValidation: emailValidation ?? ValidationEnum.none,
      phoneNumberValidation: phoneNumberValidation ?? ValidationEnum.none,
      selectedTopicValidation: topicValidation ?? ValidationEnum.none,
      storeValidation: storeValidation ?? ValidationEnum.none,
      messageValidation: messageValidation ?? ValidationEnum.none,
      isButtonActive: isButtonActive,
      selectedStore: store,
      stores: stores,
    );

    emit(ContactUsState.initial(validationModel: validationModel));
  }

  void _onValidateTopic(ValidateTopic event, Emitter<ContactUsState> emit) {
    topic = event.topic;
    topicValidation = ValidationEnum.none;

    validationModel = ContactUsValidationModel(
      firstNameValidation: firstNameValidation ?? ValidationEnum.none,
      lastNameValidation: lastNameValidation ?? ValidationEnum.none,
      emailValidation: emailValidation ?? ValidationEnum.none,
      phoneNumberValidation: phoneNumberValidation ?? ValidationEnum.none,
      selectedTopicValidation: topicValidation ?? ValidationEnum.none,
      storeValidation: storeValidation ?? ValidationEnum.none,
      messageValidation: messageValidation ?? ValidationEnum.none,
      isButtonActive: isButtonActive,
      selectedStore: store,
      stores: stores,
    );

    emit(ContactUsState.initial(validationModel: validationModel));
  }

  void _onValidateSelectedStore(ValidateSelectedStore event, Emitter<ContactUsState> emit) {
    store = event.store;
    storeValidation = ValidationEnum.none;

    validationModel = ContactUsValidationModel(
      firstNameValidation: firstNameValidation ?? ValidationEnum.none,
      lastNameValidation: lastNameValidation ?? ValidationEnum.none,
      emailValidation: emailValidation ?? ValidationEnum.none,
      phoneNumberValidation: phoneNumberValidation ?? ValidationEnum.none,
      selectedTopicValidation: topicValidation ?? ValidationEnum.none,
      storeValidation: storeValidation ?? ValidationEnum.none,
      messageValidation: messageValidation ?? ValidationEnum.none,
      isButtonActive: isButtonActive,
      selectedStore: store,
      stores: stores,
    );

    emit(ContactUsState.initial(validationModel: validationModel));
  }

  void _onValidateMessage(ValidateMessage event, Emitter<ContactUsState> emit) {
    message = event.message;
    messageValidation = ValidationEnum.none;

    validationModel = ContactUsValidationModel(
      firstNameValidation: firstNameValidation ?? ValidationEnum.none,
      lastNameValidation: lastNameValidation ?? ValidationEnum.none,
      emailValidation: emailValidation ?? ValidationEnum.none,
      phoneNumberValidation: phoneNumberValidation ?? ValidationEnum.none,
      selectedTopicValidation: topicValidation ?? ValidationEnum.none,
      storeValidation: storeValidation ?? ValidationEnum.none,
      messageValidation: messageValidation ?? ValidationEnum.none,
      isButtonActive: isButtonActive,
      selectedStore: store,
      stores: stores,
    );

    emit(ContactUsState.initial(validationModel: validationModel));
  }

  void _onValidate(Validate event, Emitter<ContactUsState> emit) {
    final isEmailValid = ValidationUtils.isValidEmail(email);

    if (firstName.isNullOrEmpty()) {
      firstNameValidation = ValidationEnum.empty;
    } else {
      firstNameValidation = ValidationEnum.valid;
    }

    if (lastName.isNullOrEmpty()) {
      lastNameValidation = ValidationEnum.empty;
    } else {
      lastNameValidation = ValidationEnum.valid;
    }

    if (email.isNullOrEmpty()) {
      emailValidation = ValidationEnum.empty;
    } else if (!isEmailValid) {
      emailValidation = ValidationEnum.invalid;
    } else {
      emailValidation = ValidationEnum.valid;
    }

    if (phoneNumber.isNullOrEmpty()) {
      phoneNumberValidation = ValidationEnum.empty;
    } else if (phoneNumber?.length != 10) {
      phoneNumberValidation = ValidationEnum.invalid;
    } else {
      phoneNumberValidation = ValidationEnum.valid;
    }

    if (message.isNullOrEmpty()) {
      messageValidation = ValidationEnum.empty;
    } else {
      messageValidation = ValidationEnum.valid;
    }

    /* if (topic.isNullOrEmpty()) {
      emailValidation = ValidationEnum.empty;
    } else {
      emailValidation = ValidationEnum.valid;
    } */

    if (store != null) {
      storeValidation = ValidationEnum.valid;
    } else {
      storeValidation = ValidationEnum.empty;
    }

    validationModel = ContactUsValidationModel(
      firstNameValidation: firstNameValidation ?? ValidationEnum.none,
      lastNameValidation: lastNameValidation ?? ValidationEnum.none,
      emailValidation: emailValidation ?? ValidationEnum.none,
      phoneNumberValidation: phoneNumberValidation ?? ValidationEnum.none,
      selectedTopicValidation: topicValidation ?? ValidationEnum.none,
      storeValidation: storeValidation ?? ValidationEnum.none,
      messageValidation: messageValidation ?? ValidationEnum.none,
      isButtonActive: isButtonActive,
      selectedStore: store,
      stores: stores,
    );

    emit(ContactUsState.initial(validationModel: validationModel));

    if (firstNameValidation != ValidationEnum.valid ||
        lastNameValidation != ValidationEnum.valid ||
        emailValidation != ValidationEnum.valid ||
        phoneNumberValidation != ValidationEnum.valid ||
        topicValidation != ValidationEnum.valid ||
        storeValidation != ValidationEnum.valid ||
        messageValidation != ValidationEnum.valid) return;

    //todo: api call
  }
}
