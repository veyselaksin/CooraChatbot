import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_chatbot_coora/components/button.dart';
import 'package:flutter_chatbot_coora/components/custom_Password_Input.dart';
import 'package:flutter_chatbot_coora/components/custom_text_input.dart';
import 'package:flutter_chatbot_coora/components/google_button.dart';
import 'package:flutter_chatbot_coora/components/welcome_title.dart';
import 'package:flutter_chatbot_coora/constants.dart';
import 'package:flutter_chatbot_coora/custom_extensions.dart';
import 'package:flutter_chatbot_coora/screens/message_screen.dart';
import 'package:flutter_chatbot_coora/screens/reset_password.dart';
import 'package:flutter_chatbot_coora/screens/signUp.dart';
import 'package:flutter_chatbot_coora/services/firebase/authentication_service.dart';
import 'package:provider/provider.dart';


class SignInArea extends StatefulWidget {

  @override
  _SignInAreaState createState() => _SignInAreaState();
}

class _SignInAreaState extends State<SignInArea> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  AuthenticationService authenticationService=new AuthenticationService(FirebaseAuth.instance);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: context.highValue),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          color: primaryColor,
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: context.highValue),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WelcomeTitle(
                    sessionType: "login",
                    press: openSignUpPage,
                  ),
                  SizedBox(
                    height: context.mediumValue,
                  ),
                  Container(
                    child: Column(
                      children: [
                        CustomTextInput(
                          hintText: "E-posta",
                          color: Colors.white,
                          textColor: Colors.white,
                          borderWidth: 2,
                          fontSize: 20,
                          controller: _emailController,
                        ),
                        SizedBox(height: context.mediumValue),
                        CustomPasswordInput(
                          controller: _passwordController,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: context.lowValue,
                  ),
                  forgotPassword(context),
                  SizedBox(
                    height: context.mediumValue,
                  ),
                  signInButton(context),
                  SizedBox(
                    height: context.mediumValue,
                  ),
                  Center(
                    child: Text(
                      "Veya",
                      style: context.mdSmallHeadlineText
                          .copyWith(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: context.mediumValue,
                  ),
                  signInGoogleButton(context),
                  SizedBox(
                    height: context.mediumValue,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row forgotPassword(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ResetPassword()));
          },
          child: Text(
            "Şifremi unuttum",
            style: context.smRegularBodyText
                .copyWith(color: Colors.white, fontSize: 16),
          ),
        ),
      ],
    );
  }

  Row signInButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: CustomButton(
            text: "Giriş yap",
            color: Colors.white,
            textColor: primaryColor,
            fontSize: 20,
            function: login,
          ),
        ),
      ],
    );
  }

  Row signInGoogleButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: GoogleButton(
            text: "Google ile giriş yap",
            color: Colors.white,
            textColor: primaryColor,
            fontSize: 20,
            function: loginWithGoogle,
          ),
        ),
      ],
    );
  }

  openSignUpPage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
  }

  login() async {
    context.read<AuthenticationService>().signIn(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    ).then((value){
      if(value!=null){
        return Navigator.push(context, MaterialPageRoute(builder: (context)=>MessageScreen()));
      }else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("E-posta veya şifre hatalı!")));
      }
    });

  }

  loginWithGoogle() async{
    await authenticationService.signInWithGoogle();
  }
}
