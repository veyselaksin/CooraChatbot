import 'package:flutter/material.dart';
import 'package:flutter_chatbot_coora/components/back_button.dart';
import 'package:flutter_chatbot_coora/components/setting_titles.dart';
import 'package:flutter_chatbot_coora/constants.dart';
import 'package:flutter_chatbot_coora/screens/profile_and_settings.dart';
import 'package:flutter_chatbot_coora/custom_extensions.dart';

class RateApp extends StatefulWidget {
  const RateApp({Key key}) : super(key: key);

  @override
  _RateAppState createState() => _RateAppState();
}

class _RateAppState extends State<RateApp> {
  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomBackButton(function:openSettingsScreen,),
              SizedBox(
                height: context.highValue,
              ),
              SettingTitles(
                title: (sizeWidth > 375) ? "Uygulamaya oy verin" : "Oy verin",
              ),
              SizedBox(height: context.mediumValue,),
              Text("Uygulamayı beğendiyseniz, oylayabilirsiniz. Kendimizi geliştirmek adına yorumlarınıza ihtiyacımız var!", style: context.smMediumBodyText.copyWith(color: black26, fontSize: 18, fontWeight: FontWeight.w400),),
              SizedBox(height: context.mediumValue,),
            ],
          ),
        ),
      ),
    );
  }
  openSettingsScreen() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ProfileSettings()));
  }
}
