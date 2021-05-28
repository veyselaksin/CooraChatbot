import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chatbot_coora/components/back_button.dart';
import 'package:flutter_chatbot_coora/components/button.dart';
import 'package:flutter_chatbot_coora/components/custom_text_input.dart';
import 'package:flutter_chatbot_coora/components/setting_titles.dart';
import 'package:flutter_chatbot_coora/constants.dart';
import 'package:flutter_chatbot_coora/custom_extensions.dart';
import 'package:flutter_chatbot_coora/services/firebase/authentication_service.dart';

class ResetPassword extends StatelessWidget {
  TextEditingController _emailController=new TextEditingController();
  AuthenticationService _authenticationService=new AuthenticationService(FirebaseAuth.instance);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomBackButton(),
              SizedBox(
                height: context.highValue,
              ),
              SettingTitles(
                title: "Şifrenizi Sıfırlayın!",
              ),
              SizedBox(
                height: context.lowValue,
              ),
              Text(
                "Şifrenizi sıfırlamak için aşağıdaki alana lütfen e-posta adresinizi girin!",
                style: context.smRegularBodyText
                    .copyWith(color: black26, fontSize: 16),
              ),
              SizedBox(height: context.mediumValue,),
              CustomTextInput(hintText: "E-posta adresinizi giriniz",color: primaryColor,textColor: primaryColor, fontSize: 20,borderWidth: 2, controller: _emailController,),
              SizedBox(height: context.highValue,),
              Row(
                children: [
                  Expanded(child: CustomButton(text: "Şifremi sıfırla",color: primaryColor, textColor: Colors.white, fontSize: 18, function: (){
                    _authenticationService.resetPassword(_emailController.text);
                  },)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

}
