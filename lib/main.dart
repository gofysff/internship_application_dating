import 'package:flutter/material.dart';

import 'registration_screens/create_nickname_screen/create_nickname_screen.dart';
import 'registration_screens/first_name_screen/fisrt_name_screen.dart';
import 'registration_screens/gender_select_screen/gender_select_screen.dart';
import 'registration_screens/otp_code_screen/otp_code_screen.dart';
import 'registration_screens/phone_number_screen/phone_number_screen.dart';
import 'registration_screens/show_u_screen/show_u_screen.dart';
import 'registration_screens/start_screen/start_screen.dart';
import 'registration_screens/birthday_screen/birthday_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const StartScreen(),
        PhoneNumberScreen.routeName: (context) => const PhoneNumberScreen(),
        OtpCodeScreen.routename: (context) => const OtpCodeScreen(),
        FirstNameScreen.routename: (context) => const FirstNameScreen(),
        BirthdayScreen.routeName: (context) => const BirthdayScreen(),
        CreateNicknameScreen.routename: (context) =>
            const CreateNicknameScreen(),
        GenderSelectScreen.routeName: (context) => const GenderSelectScreen(),
        ShowYouScreen.routeName: (context) => const ShowYouScreen(),
      },
    );
  }
}

// TODO: try to make our screens lighter and more beautiful \ avoid using so many variables in state and try to make build method more clear
// TODO: work with RegistrationStore

// TODO: try to figure out how customize correctly the keyboard 

// TODO: try to figure out why in show_u screen and gender_select_screen genderList doesn't give us the correct value from the store(method is getSelectedButtonValue)