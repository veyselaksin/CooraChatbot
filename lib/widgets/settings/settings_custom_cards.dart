
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_chatbot_coora/custom_extensions.dart';
import '../../constants.dart';

class SettingsCustomCards extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function function;
  const SettingsCustomCards({
    Key key, this.title, this.icon, this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Icon(icon, color: primaryColor,),
          ),
          SizedBox(width: context.mediumValue,),
          Text(title, style: context.mdSmallHeadlineText.copyWith(color: primaryColor), overflow:TextOverflow.ellipsis,),
          Spacer(),
          Icon(FontAwesomeIcons.chevronRight, color: primaryColor,),
        ],
      ),
    );
  }
}