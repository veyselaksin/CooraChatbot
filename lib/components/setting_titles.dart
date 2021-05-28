import 'package:flutter_chatbot_coora/custom_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chatbot_coora/constants.dart';

class SettingTitles extends StatelessWidget {
  final String title;

  const SettingTitles({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(title,
      style: context.mdMediumHeadlineText.copyWith(color: primaryColor),
    );
  }
}
