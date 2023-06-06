import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:natural_groceries/core/data/enums/validation_enum.dart';
import 'package:natural_groceries/core/data/models/contact_us_validation_model.dart';
import 'package:natural_groceries/core/data/models/store/store_model.dart';
import 'package:natural_groceries/core/presentation/utilities/extensions/context_extensions.dart';
import 'package:natural_groceries/core/presentation/utilities/typography/text_theme.dart';
import 'package:natural_groceries/core/presentation/views/contact_us/bloc/contact_us_bloc.dart';
import 'package:natural_groceries/core/presentation/views/contact_us/bloc/contact_us_event.dart';
import 'package:natural_groceries/core/presentation/widgets/base/base_state.dart';
import 'package:natural_groceries/core/presentation/widgets/custom_widgets/custom_button.dart';
import 'package:natural_groceries/core/presentation/widgets/custom_widgets/custom_drop_down_widget.dart';
import 'package:natural_groceries/core/presentation/widgets/custom_widgets/custom_text_filed.dart';

class ContactUsFooter extends StatefulWidget {
  final ContactUsValidationModel validationModel;

  const ContactUsFooter({
    super.key,
    required this.validationModel,
  });

  @override
  State<ContactUsFooter> createState() => _ContactUsFooterState();
}

class _ContactUsFooterState extends State<ContactUsFooter> with BaseStateMixin {
  final maskFormatter =
      MaskTextInputFormatter(mask: '###-###-####', type: MaskAutoCompletionType.lazy);

  ContactUsValidationModel get validationModel => widget.validationModel;

  Timer? _firstNameDebounce;
  Timer? _lastNameDebounce;
  Timer? _emailDebounce;
  Timer? _phoneNumberDebounce;
  Timer? _messageDebounce;

  @override
  void dispose() {
    _firstNameDebounce?.cancel();
    _firstNameDebounce = null;
    _lastNameDebounce?.cancel();
    _lastNameDebounce = null;
    _emailDebounce?.cancel();
    _emailDebounce = null;
    _phoneNumberDebounce?.cancel();
    _phoneNumberDebounce = null;
    _messageDebounce?.cancel();
    _messageDebounce = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          hint: strings.first_name,
          borderColor: colors.borderTrueColor,
          labelText: strings.first_name_label,
          labelStyle: TextStyle(color: colors.blackOpacityColor),
          fillColor: context.colors.transparent,
          errorText: validationModel.firstNameValidation.errorMessageFirstName,
          onChanged: (value) {
            if (_firstNameDebounce?.isActive == true) _firstNameDebounce?.cancel();
            _firstNameDebounce = Timer(
              const Duration(milliseconds: 500),
              () {
                context.read<ContactUsBloc>().add(ContactUsEvent.validateFirsName(value));
              },
            );
          },
        ),
        SizedBox(height: 20.sp),
        CustomTextField(
          hint: strings.last_name,
          labelText: strings.last_name_label,
          borderColor: colors.borderTrueColor,
          labelStyle: TextStyle(color: colors.blackOpacityColor),
          fillColor: context.colors.transparent,
          errorText: validationModel.lastNameValidation.errorMessageLastName,
          onChanged: (value) {
            if (_lastNameDebounce?.isActive == true) _lastNameDebounce?.cancel();
            _lastNameDebounce = Timer(
              const Duration(milliseconds: 500),
              () {
                context.read<ContactUsBloc>().add(ContactUsEvent.validateLastName(value));
              },
            );
          },
        ),
        SizedBox(height: 20.sp),
        CustomTextField(
          hint: strings.email_hint,
          labelText: strings.email_label,
          borderColor: colors.borderTrueColor,
          labelStyle: TextStyle(color: colors.blackOpacityColor),
          textCapitalization: TextCapitalization.none,
          fillColor: context.colors.transparent,
          errorText: validationModel.emailValidation.errorMessageEmail,
          onChanged: (value) {
            if (_emailDebounce?.isActive == true) _emailDebounce?.cancel();
            _emailDebounce = Timer(
              const Duration(milliseconds: 500),
              () {
                context.read<ContactUsBloc>().add(ContactUsEvent.validateEmail(value));
              },
            );
          },
        ),
        SizedBox(height: 20.sp),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              hint: strings.phone_number,
              labelText: strings.phone_number_label,
              inputFormatters: [maskFormatter],
              borderColor: colors.borderTrueColor,
              labelStyle: TextStyle(color: colors.blackOpacityColor),
              fillColor: context.colors.transparent,
              errorText: validationModel.phoneNumberValidation.errorMassagePhoneNumber,
              onChanged: (value) {
                if (_phoneNumberDebounce?.isActive == true) _phoneNumberDebounce?.cancel();
                _phoneNumberDebounce = Timer(
                  const Duration(milliseconds: 500),
                  () {
                    context.read<ContactUsBloc>().add(
                          ContactUsEvent.validatePhoneNumber(
                            maskFormatter.unmaskText(value),
                          ),
                        );
                  },
                );
              },
            ),
            SizedBox(height: 9.sp),
            Padding(
              padding: EdgeInsets.only(left: 20.sp),
              child: Text(
                '• ${strings.digits_only_no_spaces_or_dashes}',
                style: fonts.latoBold.copyWith(
                  fontSize: 14.sp,
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 20.sp),
        CustomDropDown<String>(
          // todo: topics
          hint: strings.select_topic,
          labelText: strings.select_topic_label,
          labelStyle: TextStyle(color: colors.blackOpacityColor, fontSize: 14.sp),
          items: const [],
          onChanged: (value) {
            context.read<ContactUsBloc>().add(ContactUsEvent.validateTopic(value));
          },
        ),
        SizedBox(height: 20.sp),
        CustomDropDown<StoreModel>(
          hint: strings.select_store,
          labelText: strings.select_store_label,
          labelStyle: TextStyle(color: colors.blackOpacityColor, fontSize: 14.sp),
          errorText: validationModel.storeValidation.errorMessagePreferredStore,
          value: widget.validationModel.selectedStore,
          dropdownDecoration: BoxDecoration(
            border: Border.all(color: context.colors.borderTrueColor),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(34.sp),
              bottomRight: Radius.circular(34.sp),
            )
          ),
          selectedMenuItemBuilder: (context, child) {
            return Container(
              color: context.colors.orangeBorderColor.withOpacity(.2),
              child: child,
            );
          },
          items: validationModel.stores
              .map(
                (store) => DropdownMenuItem<StoreModel>(
                  value: store,
                  child: Text(
                    store.fullTitle ?? '',
                    style: fonts.latoBoldItalic.copyWith(fontSize: 14.sp),
                  ),
                ),
              )
              .toList(),
          onChanged: (value) {
            context.read<ContactUsBloc>().add(ContactUsEvent.validateSelectedStore(value));
          },
        ),
        SizedBox(height: 20.sp),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Stack(
              children: [
                CustomTextField(
                  minLines: 6,
                  maxLines: 30,
                  maxLength: 3000,
                  keyboardType: TextInputType.multiline,
                  hint: strings.message_field_hint,
                  borderRadius: 40.sp,
                  contentPaddingVertical: 10.sp,
                  labelText: strings.message,
                  borderColor: colors.borderTrueColor,
                  hintStyle: fonts.latoRegular.copyWith(color: colors.whisperColor),
                  labelStyle: TextStyle(color: colors.blackOpacityColor),
                  fillColor: context.colors.transparent,
                  errorText: validationModel.messageValidation.errorMessage,
                  onChanged: (value) {
                    if (_messageDebounce?.isActive == true) _messageDebounce?.cancel();
                    _messageDebounce = Timer(
                      const Duration(milliseconds: 500),
                      () {
                        context.read<ContactUsBloc>().add(ContactUsEvent.validateMessage(value));
                      },
                    );
                  },
                ),
                Positioned(
                  bottom: 20,
                  right: 30,
                  child: Text(
                    '(100-300)',
                    style: fonts.latoLight.copyWith(color: colors.whisperColor, fontSize: 14.sp),
                  ),
                )
              ],
            ),
            SizedBox(height: 27.sp),
            FractionallySizedBox(
              widthFactor: .42,
              child: CustomButton(
                isColorFilled: true,
                onTap: () {
                  context.read<ContactUsBloc>().add(const ContactUsEvent.validate());
                },
                padding: EdgeInsets.symmetric(vertical: 12.sp),
                color: validationModel.isButtonActive
                    ? context.colors.borderTrueColor
                    : context.colors.borderTrueColor.withOpacity(0.5),
                ignorePointer: !(validationModel.isButtonActive),
                child: Center(
                  child: Text(
                    strings.send,
                    style: fonts.latoBold.copyWith(
                      fontSize: 16.sp,
                      color: context.colors.whiteColor,
                    ),
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
