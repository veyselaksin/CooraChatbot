import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chatbot_coora/components/back_button.dart';
import 'package:flutter_chatbot_coora/components/setting_titles.dart';
import 'package:flutter_chatbot_coora/constants.dart';
import 'package:flutter_chatbot_coora/custom_extensions.dart';
import 'package:flutter_chatbot_coora/screens/profile_and_settings.dart';

class Languages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Ubuntu",
      ),
      home: languages(),
    );
  }
}



class languages extends StatefulWidget {
  @override
  _languagesState createState() => _languagesState();
}

class _languagesState extends State<languages> {
  String languageChoose;
  List listItems=["Türkçe"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomBackButton(function:openSettingsScreen,),
              SizedBox(height: context.highValue,),
              SettingTitles(title: "Diller",),
              SizedBox(height: context.mediumValue,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: context.mediumValue, vertical: context.lowValue),
                decoration: BoxDecoration(
                    color: secondaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: DropdownButton(
                  hint: Text("Bir dil seçin"),
                  dropdownColor: secondaryColor,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 30,
                  isExpanded: true,
                  underline: SizedBox(),
                  value: languageChoose,
                  style: context.smMediumBodyText.copyWith(color: primaryColor, fontSize: 16),
                  onChanged: (value){
                    setState(() {
                      languageChoose=value;
                    });
                  },
                  items: listItems.map((value){
                    return DropdownMenuItem(value:value,child: Text(value));
                  }).toList(),
                ),
              ),
              SizedBox(height: context.highValue,),
              Expanded(flex:1,child: Text("NOT: Bu uygulamada şu an yalnızca Türkçe dil desteği mevcuttur.", style: context.smRegularBodyText.copyWith(fontSize: 18, color: primaryColor),)),
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
