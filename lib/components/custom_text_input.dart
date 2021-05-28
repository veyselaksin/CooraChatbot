import 'package:flutter/material.dart';
import 'package:flutter_chatbot_coora/custom_extensions.dart';

class CustomTextInput extends StatelessWidget {
  final String hintText;
  final Color color, textColor;
  final double fontSize, borderWidth;
  final TextEditingController controller;

  const CustomTextInput(
      {Key key,
      this.hintText,
      this.color,
      this.textColor, this.fontSize, this.borderWidth, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: context.smRegularBodyText
            .copyWith(color: textColor, fontSize: fontSize),
        enabledBorder:UnderlineInputBorder(
          borderSide: new BorderSide(color: color, width: borderWidth),
        ),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: color, width: borderWidth)),
      ),
      controller: controller,
      style:
          context.smRegularBodyText.copyWith(color: textColor, fontSize: fontSize),

    );
  }
}
