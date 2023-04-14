import 'package:internship_app/validations/validators/bithday_validator.dart';
import 'package:internship_app/validations/validators/first_name_validator.dart';
import 'package:internship_app/validations/validators/nickname_validator.dart';
import 'package:internship_app/validations/validators/phone_number_validator.dart';
import 'package:test/test.dart';

void main() {
  group('phoneNumberValidation', () {
    test('correctPhoneNumber', () {
      expect(PhoneNumberValidator.isPhoneNumberCorrect('123-456-78-90'), true);
    });
    test('incorrectPhoneNumber without delimeters', () {
      expect(PhoneNumberValidator.isPhoneNumberCorrect('1234567890'), false);
    });

    test('incorrectPhoneNumber with delimeters (wrong length)', () {
      expect(PhoneNumberValidator.isPhoneNumberCorrect('123-456-78-0'), false);
    });

    test('incorrectPhoneNumber with delimeters (wrong symbols)', () {
      expect(PhoneNumberValidator.isPhoneNumberCorrect('123-456-78-9a'), false);
    });
  });

  group('Birthday validation', () {
    test('correct date', () {
      expect(BirthdayValidator.isCorrectDate('10/07/2000'), true);
    });

    test('31 february of any year', () {
      expect(BirthdayValidator.isCorrectDate('31/02/2000'), false);
    });

    test('small year', () {
      expect(BirthdayValidator.isCorrectDate('10/07/200'), false);
    });
  });

  group('Nickname validation', () {
    test('correct nickname', () {
      expect(NicknameValidator.isCorrectNickname('nickname'), true);
    });

    test('Correct nickname with Upper letters', () {
      expect(NicknameValidator.isCorrectNickname('VAsyaPupkin3000'), true);
    });

    test('incorrect nickname (too long)', () {
      expect(NicknameValidator.isCorrectNickname('nicknameeeeeeeeeeeeeeeeeee'),
          false);
    });

    test('incorrect nickname (too short)', () {
      expect(NicknameValidator.isCorrectNickname('nick'), false);
    });

    test('incorrect nickname (wrong symbols)', () {
      expect(NicknameValidator.isCorrectNickname('nick@name'), false);
    });
  });

  group('FirstName validation', () {
    // test correct name with english letters
    test('test correct name with english letters', () {
      expect(FirstNameValidator.isCorrectFirstName('Anton'), true);
    });

    // test correct name with russian letters
    test('test correct name with russian letters', () {
      expect(FirstNameValidator.isCorrectFirstName('Антон'), true);
    });

    test('test correct name with english letters', () {
      expect(FirstNameValidator.isCorrectFirstName('Anton'), true);
    });

    test('empty name', () {
      expect(FirstNameValidator.isCorrectFirstName(''), false);
    });

    test('incorrect name (wrong symbols)', () {
      expect(FirstNameValidator.isCorrectFirstName('Anton!'), false);
    });
  });
}
