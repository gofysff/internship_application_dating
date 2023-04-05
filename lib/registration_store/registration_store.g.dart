// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegistrationStore on RegistrationStoreBase, Store {
  Computed<String>? _$fullPhoneNumberComputed;

  @override
  String get fullPhoneNumber => (_$fullPhoneNumberComputed ??= Computed<String>(
          () => super.fullPhoneNumber,
          name: 'RegistrationStoreBase.fullPhoneNumber'))
      .value;

  late final _$phoneNumberAtom =
      Atom(name: 'RegistrationStoreBase.phoneNumber', context: context);

  @override
  String get phoneNumber {
    _$phoneNumberAtom.reportRead();
    return super.phoneNumber;
  }

  @override
  set phoneNumber(String value) {
    _$phoneNumberAtom.reportWrite(value, super.phoneNumber, () {
      super.phoneNumber = value;
    });
  }

  late final _$countryNumberAtom =
      Atom(name: 'RegistrationStoreBase.countryNumber', context: context);

  @override
  String get countryNumber {
    _$countryNumberAtom.reportRead();
    return super.countryNumber;
  }

  @override
  set countryNumber(String value) {
    _$countryNumberAtom.reportWrite(value, super.countryNumber, () {
      super.countryNumber = value;
    });
  }

  late final _$otpCodeAtom =
      Atom(name: 'RegistrationStoreBase.otpCode', context: context);

  @override
  int get otpCode {
    _$otpCodeAtom.reportRead();
    return super.otpCode;
  }

  @override
  set otpCode(int value) {
    _$otpCodeAtom.reportWrite(value, super.otpCode, () {
      super.otpCode = value;
    });
  }

  late final _$firstNameAtom =
      Atom(name: 'RegistrationStoreBase.firstName', context: context);

  @override
  String get firstName {
    _$firstNameAtom.reportRead();
    return super.firstName;
  }

  @override
  set firstName(String value) {
    _$firstNameAtom.reportWrite(value, super.firstName, () {
      super.firstName = value;
    });
  }

  late final _$birthdayAtom =
      Atom(name: 'RegistrationStoreBase.birthday', context: context);

  @override
  String get birthday {
    _$birthdayAtom.reportRead();
    return super.birthday;
  }

  @override
  set birthday(String value) {
    _$birthdayAtom.reportWrite(value, super.birthday, () {
      super.birthday = value;
    });
  }

  late final _$nicknameAtom =
      Atom(name: 'RegistrationStoreBase.nickname', context: context);

  @override
  String get nickname {
    _$nicknameAtom.reportRead();
    return super.nickname;
  }

  @override
  set nickname(String value) {
    _$nicknameAtom.reportWrite(value, super.nickname, () {
      super.nickname = value;
    });
  }

  late final _$genderAtom =
      Atom(name: 'RegistrationStoreBase.gender', context: context);

  @override
  String get gender {
    _$genderAtom.reportRead();
    return super.gender;
  }

  @override
  set gender(String value) {
    _$genderAtom.reportWrite(value, super.gender, () {
      super.gender = value;
    });
  }

  late final _$showYouAtom =
      Atom(name: 'RegistrationStoreBase.showYou', context: context);

  @override
  String get showYou {
    _$showYouAtom.reportRead();
    return super.showYou;
  }

  @override
  set showYou(String value) {
    _$showYouAtom.reportWrite(value, super.showYou, () {
      super.showYou = value;
    });
  }

  late final _$showEveryoneRealNameAtom = Atom(
      name: 'RegistrationStoreBase.showEveryoneRealName', context: context);

  @override
  bool get showEveryoneRealName {
    _$showEveryoneRealNameAtom.reportRead();
    return super.showEveryoneRealName;
  }

  @override
  set showEveryoneRealName(bool value) {
    _$showEveryoneRealNameAtom.reportWrite(value, super.showEveryoneRealName,
        () {
      super.showEveryoneRealName = value;
    });
  }

  late final _$showGenderOnProfileAtom =
      Atom(name: 'RegistrationStoreBase.showGenderOnProfile', context: context);

  @override
  bool get showGenderOnProfile {
    _$showGenderOnProfileAtom.reportRead();
    return super.showGenderOnProfile;
  }

  @override
  set showGenderOnProfile(bool value) {
    _$showGenderOnProfileAtom.reportWrite(value, super.showGenderOnProfile, () {
      super.showGenderOnProfile = value;
    });
  }

  @override
  String toString() {
    return '''
phoneNumber: ${phoneNumber},
countryNumber: ${countryNumber},
otpCode: ${otpCode},
firstName: ${firstName},
birthday: ${birthday},
nickname: ${nickname},
gender: ${gender},
showYou: ${showYou},
showEveryoneRealName: ${showEveryoneRealName},
showGenderOnProfile: ${showGenderOnProfile},
fullPhoneNumber: ${fullPhoneNumber}
    ''';
  }
}
