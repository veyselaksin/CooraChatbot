import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_chatbot_coora/components/button.dart';
import 'package:flutter_chatbot_coora/components/custom_Password_Input.dart';
import 'package:flutter_chatbot_coora/components/custom_text_input.dart';
import 'package:flutter_chatbot_coora/components/welcome_title.dart';
import 'package:flutter_chatbot_coora/constants.dart';
import 'package:flutter_chatbot_coora/custom_extensions.dart';
import 'package:flutter_chatbot_coora/screens/signIn.dart';
import 'package:flutter_chatbot_coora/widgets/alert_dialog.dart';
import 'package:provider/provider.dart';
import 'package:flutter_chatbot_coora/services/firebase/authentication_service.dart';

class SignUpArea extends StatefulWidget {
  @override
  _SignUpAreaState createState() => _SignUpAreaState();
}

class _SignUpAreaState extends State<SignUpArea> {
  bool remember = true;
  bool isHiddenPassword = true;

  final TextEditingController _fullnameController=new TextEditingController();
  final TextEditingController _emailController=new TextEditingController();
  final TextEditingController _passwordController=new TextEditingController();

  AuthenticationService authenticationService=new AuthenticationService(FirebaseAuth.instance);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: context.highValue),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(40),
            topLeft: Radius.circular(40),
          ),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.only(top: context.highValue),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WelcomeTitle(sessionType: "signUp", press: openSignInPage),
                SizedBox(
                  height: context.mediumValue,
                ),
                Container(
                  child: Column(
                    children: [
                      CustomTextInput(
                        hintText: "Ad ve Soyad",
                        color: Colors.white,
                        textColor: Colors.white,
                        borderWidth: 2,
                        fontSize: 20,
                        controller: _fullnameController,

                      ),
                      SizedBox(height: context.mediumValue),
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
                      SizedBox(
                        height: context.lowValue,
                      ),
                      /*userAgreement(context),*/
                      SizedBox(
                        height: context.mediumValue,
                      ),
                      signUpButton(),
                      SizedBox(
                        height: context.mediumValue,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row signUpButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: CustomButton(
            text:"Kayıt ol",
            color: Colors.white,
            textColor: primaryColor,
            fontSize: 20,
            function: signUp,
          ),
        ),
      ],
    );
  }


  /*Row userAgreement(BuildContext context) {
    return Row(
      children: [
        Theme(
          child: Checkbox(
            value: remember,
            activeColor: Colors.white,
            checkColor: primaryColor,
            onChanged: (bool value) {
              setState(() {
                remember = value;
              });
            },
          ),
          data: ThemeData(
            unselectedWidgetColor: Colors.white,
          ),
        ),
        Text(
          "Kullanıcı sözleşmesini okudum",
          style: context.smRegularBodyText
              .copyWith(color: Colors.white, fontSize: 16),
        )
      ],
    );
  }*/


  void openSignInPage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
  }

  signUp(){
      context.read<AuthenticationService>().signUp(
        fullname: _fullnameController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      ).then((value) async {
        RegExp emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
        if(value!=null){
          final action=await Dialogs.dialogAction(context, "Kayıt ol!", "Başarılı bir şekilde kayıt oldunuz.", "message");
          if(action==DialogAction.ok) {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>SignIn()));
          }
        }
        if(_fullnameController.text.length<=0){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Lütfen adınız giriniz!")));
        }
        if(emailValid.allMatches(_emailController.text) != null){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Lütfen geçerli bir e-posta adresi giriniz!")));
        }
        if(_passwordController.text.length<6){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Şifreniz en az 6 haneli olmalı!")));
        }
      });
  }
}
