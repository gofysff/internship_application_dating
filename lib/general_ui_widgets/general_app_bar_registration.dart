import 'package:flutter/material.dart';

AppBar generalAppBarRegistration = AppBar(
    elevation: 0,
    backgroundColor: Colors.white10, //? why it is working? ,
    iconTheme: const IconThemeData(
      size: 24,
      opacity: 0.8,
      color: Colors.black, // <-- SEE HERE
    ));
