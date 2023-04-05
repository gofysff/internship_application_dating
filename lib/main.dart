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
        '/phone_number_screen': (context) => const PhoneNumberScreen(),
        '/otp_code_screen': (context) => const OTPcodeScreen(),
        '/first_name_screen': (context) => const FirstNameScreen(),
        '/birthday_screen': (context) => const BirthdayScreen(),
        '/create_nickname_screen': (context) => const CreateNicknameScreen(),
        '/gender_select_screen': (context) => const GenderSelectScreen(),
        '/show_u_screen': (context) => const ShowYouScreen(),
      },
    );
  }
}
