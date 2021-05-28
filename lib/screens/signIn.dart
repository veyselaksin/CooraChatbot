import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_chatbot_coora/screens/message_screen.dart';
import 'package:flutter_chatbot_coora/widgets/brandImage.dart';
import 'package:flutter_chatbot_coora/widgets/signIn//signIn_area.dart';
import 'package:flutter_chatbot_coora/custom_extensions.dart';
import 'package:provider/provider.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user=context.watch<User>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Ubuntu'),
      home: (user!=null)?MessageScreen():signIn(),
    );
  }
}
class signIn extends StatefulWidget {
  @override
  _signInState createState() => _signInState();
}

class _signInState extends State<signIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: SafeArea(
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
              SignInArea(),
            ],
          ),
        ),
      ),
    );
  }
}
