import 'package:internship_app/validations/validators/bithday_validator.dart';
import 'package:internship_app/validations/validators/first_name_validator.dart';
import 'package:internship_app/validations/validators/nickname_validator.dart';
import 'package:internship_app/validations/validators/phone_number_validator.dart';
import 'package:test/test.dart';

void main() {
  group('phoneNumberValidation', () {
    var phoneNumberValidator = PhoneNumberValidator();
    test('correctPhoneNumber', () {
      expect(phoneNumberValidator.isValid('123-456-78-90'), true);
    });
    test('incorrectPhoneNumber without delimeters', () {
      expect(phoneNumberValidator.isValid('1234567890'), false);
    });

    test('incorrectPhoneNumber with delimeters (wrong length)', () {
      expect(phoneNumberValidator.isValid('123-456-78-0'), false);
    });

    test('incorrectPhoneNumber with delimeters (wrong symbols)', () {
      expect(phoneNumberValidator.isValid('123-456-78-9a'), false);
    });
  });

  group('Birthday validation', () {
    var birthdayValidator = BirthdayValidator();
    test('correct date', () {
      expect(birthdayValidator.isValid('10/07/2000'), true);
    });

    test('31 february of any year', () {
      expect(birthdayValidator.isValid('31/02/2000'), false);
    });

    test('small year', () {
      expect(birthdayValidator.isValid('10/07/200'), false);
    });
  });

  group('Nickname validation', () {
    final nicknameValidator = NicknameValidator();
    test('correct nickname', () {
      expect(nicknameValidator.isValid('nickname'), true);
    });

    test('Correct nickname with Upper letters', () {
      expect(nicknameValidator.isValid('VAsyaPupkin3000'), true);
    });

    test('incorrect nickname (too long)', () {
      expect(nicknameValidator.isValid('nicknameeeeeeeeeeeeeeeeeee'), false);
    });

    test('incorrect nickname (too short)', () {
      expect(nicknameValidator.isValid('nick'), false);
    });

    test('incorrect nickname (wrong symbols)', () {
      expect(nicknameValidator.isValid('nick@name'), false);
    });
  });

  group('FirstName validation', () {
    final firstNameValidator = FirstNameValidator();
    // test correct name with english letters
    test('test correct name with english letters', () {
      expect(firstNameValidator.isValid('Anton'), true);
    });

    // test correct name with russian letters
    test('test correct name with russian letters', () {
      expect(firstNameValidator.isValid('Антон'), true);
    });

    test('test correct name with english letters', () {
      expect(firstNameValidator.isValid('Anton'), true);
    });

    test('empty name', () {
      expect(firstNameValidator.isValid(''), false);
    });

    test('incorrect name (wrong symbols)', () {
      expect(firstNameValidator.isValid('Anton!'), false);
    });
  });
}
