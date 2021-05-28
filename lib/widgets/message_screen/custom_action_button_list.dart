import 'package:flutter/material.dart';
import 'package:flutter_chatbot_coora/constants.dart';
import 'package:flutter_chatbot_coora/models/button_action_model.dart';
import 'package:flutter_chatbot_coora/screens/profile_and_settings.dart';
import 'package:flutter_chatbot_coora/custom_extensions.dart';
import 'package:url_launcher/url_launcher.dart';


GestureDetector CustomActionButton(BuildContext context, int index,) {
  return GestureDetector(
    onTap: () {
      (apps[index].isApp)?launchApp(apps[index].url):Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileSettings()));
    },
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 0),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(100)),
      ),
      child: Row(
        children: [
          Icon(apps[index].icon, color: apps[index].color,),
          SizedBox(
            width: context.lowValue,
          ),
          Text(
            apps[index].title,
            style: context.smRegularBodyText.copyWith(
                color: primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    ),
  );
}
void launchApp(command) async {
  await canLaunch(command) ? await launch(command) : await launch(command);
}
