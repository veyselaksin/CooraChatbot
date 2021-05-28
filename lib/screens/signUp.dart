import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_chatbot_coora/widgets/brandImage.dart';
import 'package:flutter_chatbot_coora/custom_extensions.dart';
import 'package:flutter_chatbot_coora/widgets/signUp/signUp_area.dart';

import '../constants.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Ubuntu'),
      home: signUp(),
    );
  }
}

class signUp extends StatefulWidget {
  @override
  _signUpState createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  String popUp = "close";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: context.dynamicHeight(0.03),
            ),
            BrandImage(),
            SizedBox(
              height: context.dynamicHeight(0.03),
            ),
            SignUpArea(),
          ],
        ),
      ),
    );
  }
}
