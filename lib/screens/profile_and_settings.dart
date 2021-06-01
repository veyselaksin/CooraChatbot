import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_chatbot_coora/components/back_button.dart';
import 'package:flutter_chatbot_coora/components/setting_titles.dart';
import 'package:flutter_chatbot_coora/constants.dart';
import 'package:flutter_chatbot_coora/custom_extensions.dart';
import 'package:flutter_chatbot_coora/screens/contact_screen.dart';
import 'package:flutter_chatbot_coora/screens/languages.dart';
import 'package:flutter_chatbot_coora/screens/message_screen.dart';
import 'package:flutter_chatbot_coora/screens/rate_app_screen.dart';
import 'package:flutter_chatbot_coora/screens/to_do.dart';
import 'package:flutter_chatbot_coora/widgets/profile_tab.dart';
import 'package:flutter_chatbot_coora/widgets/settings/settings_custom_cards.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Ubuntu',
      ),
      home: profileandsettings(),
    );
  }
}

class profileandsettings extends StatefulWidget {
  @override
  _profileandsettingsState createState() => _profileandsettingsState();
}

class _profileandsettingsState extends State<profileandsettings> {
  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomBackButton(
                  function: openMessageScreen,
                ),
                SizedBox(
                  height: context.highValue,
                ),
                SettingTitles(
                  title: "Profil ve Ayarlar",
                ),
                SizedBox(
                  height: context.mediumValue,
                ),
                ProfileTab(),
                Divider(
                  height: 20,
                  thickness: 3,
                  color: primaryColor,
                ),
                SizedBox(
                  height: context.lowValue,
                ),
                SettingsCustomCards(
                  title: "Diller",
                  icon: FontAwesomeIcons.globe,
                  function: openLanguages,
                ),
                SizedBox(
                  height: context.mediumValue,
                ),
                SettingsCustomCards(
                  title: (sizeWidth > 375) ? "Yapılacaklar Listesi" : "ToDo",
                  icon: FontAwesomeIcons.listUl,
                  function: openMyToDo,
                ),
                SizedBox(
                  height: context.highValue,
                ),
                Text(
                  "Diğer",
                  style: context.smMediumBodyText
                      .copyWith(color: primaryColor, fontSize: 22),
                ),
                SizedBox(
                  height: context.mediumValue,
                ),
                SettingsCustomCards(
                  title: "İletişim",
                  icon: FontAwesomeIcons.headset,
                  function: openContactScreen,
                ),
                SizedBox(
                  height: context.mediumValue,
                ),
                SettingsCustomCards(
                  title: (sizeWidth > 375) ? "Uygulamaya oy verin" : "Oy verin",
                  icon: FontAwesomeIcons.solidStar,
                  function: openRateAppScreen,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  openMessageScreen() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MessageScreen()));
  }

  openLanguages() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Languages()));
  }
  openMyToDo() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ToDoScreen()));
  }

  openRateAppScreen() {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>RateApp()));
  }
  openContactScreen() {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>ContactScreen()));
  }
}
