import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_chatbot_coora/components/back_button.dart';
import 'package:flutter_chatbot_coora/components/button.dart';
import 'package:flutter_chatbot_coora/components/setting_titles.dart';
import 'package:flutter_chatbot_coora/constants.dart';
import 'package:flutter_chatbot_coora/screens/profile_and_settings.dart';
import 'package:flutter_chatbot_coora/custom_extensions.dart';
import 'package:flutter_chatbot_coora/services/mail_service.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key key}) : super(key: key);

  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  TextEditingController _subjectController = new TextEditingController();
  TextEditingController _bodyController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomBackButton(
                  function: openSettingsScreen,
                ),
                SizedBox(
                  height: context.highValue,
                ),
                SettingTitles(
                  title: "İletişim",
                ),
                SizedBox(
                  height: context.mediumValue,
                ),
                Text(
                  "Geliştiriciye bir not bırakın!",
                  style: context.smMediumBodyText.copyWith(
                      color: black26,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: context.mediumValue,
                ),
                Container(
                  height: context.dynamicHeight(0.5),
                  width: context.dynamicWidth(1),
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Column(
                          children: [
                            Container(
                              child: TextField(
                                controller: _subjectController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Başlık",
                                ),
                                style: context.smMediumBodyText.copyWith(
                                    color: black26,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 24),
                              ),
                            ),
                            Container(
                              height: context.dynamicHeight(0.36),
                              child: SingleChildScrollView(
                                child: TextField(
                                  controller: _bodyController,
                                  keyboardType: TextInputType.multiline,
                                  maxLines: 14,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Not yazın!"),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 10,
                        child: Container(
                          height: 30,
                          width: 200,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(100),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "veyselaksn@gmail.com",
                              style: context.smRegularBodyText.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: context.highValue,
                ),
                Center(
                    child: CustomButton(
                  text: "Gönder",
                  color: primaryColor,
                  textColor: Colors.white,
                  fontSize: 16,
                  function: sendMail,
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  openSettingsScreen() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ProfileSettings()));
  }

  sendMail() {
    MailService.openEmail(
        toEmail: 'veyselaksn@gmail.com',
        subject: _subjectController.text,
        body: _bodyController.text);
  }
}
