import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_chatbot_coora/components/back_button.dart';
import 'package:flutter_chatbot_coora/components/setting_titles.dart';
import 'package:flutter_chatbot_coora/custom_extensions.dart';

class Appointment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Ubuntu'),
      home: appointment(),
    );
  }
}

class appointment extends StatefulWidget {
  @override
  _appointmentState createState() => _appointmentState();
}

class _appointmentState extends State<appointment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomBackButton(),
              SizedBox(
                height: context.highValue,
              ),
              SettingTitles(
                title: "Hatırlatıcı",
              ),
              SizedBox(
                height: context.mediumValue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
