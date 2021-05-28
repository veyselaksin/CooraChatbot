import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chatbot_coora/components/profile_photo.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constants.dart';

Widget chat(String message, int data) {
  return Container(
    padding: EdgeInsets.only(left: 20, right: 20),
    child: Row(
      mainAxisAlignment:
          (data == 1) ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        (data == 0)
            ? Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: secondaryColor),
                child: Icon(
                  FontAwesomeIcons.robot,
                  color: primaryColor,
                ),
              )
            : Container(),
        Padding(
          padding: EdgeInsets.all(10),
          child: Bubble(
            radius: Radius.circular(5),
            color: secondaryColor,
            elevation: 0,
            child: Padding(
              padding: EdgeInsets.all(2),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: Container(
                      constraints: BoxConstraints(maxWidth: 200),
                      child: Text(
                        message,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        (data == 1)
            ? Container(
                height: 60,
                width: 60,
                child: ProfilePhoto(
                  height: 60,
                  width: 60,
                  type: "circle",
                ),
              )
            : Container(),
      ],
    ),
  );
}
