import 'package:flutter/material.dart';
import 'package:internship_app/registration_store/registration_store.dart';
import 'package:internship_app/styling.dart';
import 'package:provider/provider.dart';

import 'registration_screens/create_nickname_screen/create_nickname_screen.dart';
import 'registration_screens/first_name_screen/fisrt_name_screen.dart';
import 'registration_screens/gender_select_screen/gender_select_screen.dart';
import 'registration_screens/otp_code_screen/otp_code_screen.dart';
import 'registration_screens/phone_number_screen/phone_number_screen.dart';
import 'registration_screens/show_u_screen/show_u_screen.dart';
import 'registration_screens/start_screen/start_screen.dart';
import 'registration_screens/birthday_screen/birthday_screen.dart';
import 'validations/validation_store/validation_store.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => RegistrationStore(),
      builder: (context, _) => Provider(
        // nesting because of dependencing the stores
        create: (_) => ValidationStore(
          Provider.of<RegistrationStore>(context),
        ),
        child: MaterialApp(
          theme: StylingMainAplicationTheme.mainThemeData,
          routes: {
            '/': (context) => const StartScreen(),
            PhoneNumberScreen.routeName: (context) => const PhoneNumberScreen(),
            OtpCodeScreen.routename: (context) => const OtpCodeScreen(),
            FirstNameScreen.routename: (context) => const FirstNameScreen(),
            BirthdayScreen.routeName: (context) => const BirthdayScreen(),
            CreateNicknameScreen.routename: (context) =>
                const CreateNicknameScreen(),
            GenderSelectScreen.routeName: (context) =>
                const GenderSelectScreen(),
            ShowYouScreen.routeName: (context) => const ShowYouScreen(),
          },
        ),
      ),
    );
  }
}




//? TODO: add validators to textFields
// Todo: write logic to http requests to server after and before getting otp code 
// TODO: 2 specify information about otp timer work
// TODO: https://dart.dev/guides/language/effective-dart/design says that styling written uncoorrectly