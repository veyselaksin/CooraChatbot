import 'package:flutter/material.dart';
import 'package:flutter_chatbot_coora/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppButtonModel{
  final String title, url;
  final IconData icon;
  final Color color;
  final bool isApp;
  CustomAppButtonModel({this.title,this.icon, this.url,this.color, this.isApp});
}

List<CustomAppButtonModel> apps=[
  CustomAppButtonModel(title: "Rehbere git", icon: FontAwesomeIcons.phoneAlt, url: "tel:", color: primaryColor,isApp: true),
  CustomAppButtonModel(title: "Mesajlara git", icon: FontAwesomeIcons.solidEnvelope, url: "sms:", color: primaryColor,isApp: true),
  CustomAppButtonModel(title: "YouTube'u aç", icon: FontAwesomeIcons.youtube, url: "https://www.youtube.com/", color: Color(0xFFff0000), isApp: true),
  CustomAppButtonModel(title: "YouTube Müzikleri aç", icon:FontAwesomeIcons.recordVinyl, url: "https://music.youtube.com/", color: Color(0xFFff0000),isApp: true),
  CustomAppButtonModel(title: "Telegram aç", icon: FontAwesomeIcons.telegram, url: "https://telegram.me/", color: Color(0xFF0088cc),isApp: true),
  CustomAppButtonModel(title: "Instagram aç", icon: FontAwesomeIcons.instagram, url: "https://www.instagram.com/",color: Color(0xFFc13584),isApp: true),
  CustomAppButtonModel(title: "Twitter aç", icon: FontAwesomeIcons.twitter, url: "https://www.twitter.com/" ,color: Color(0xFF1da1f2),isApp: true),
  CustomAppButtonModel(title: "Google Drive", icon: FontAwesomeIcons.googleDrive, url: "https://drive.google.com/drive/u/0/my-drive", color: primaryColor, isApp: true),
];