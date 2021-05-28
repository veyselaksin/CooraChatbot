import 'package:flutter/material.dart';
import 'package:flutter_chatbot_coora/custom_extensions.dart';

class GoogleButton extends StatelessWidget {
  final String text;
  final Color color, textColor;
  final double fontSize;
  final Function function;

  const GoogleButton({
    Key key,
    this.text,
    this.color,
    this.textColor,
    this.fontSize,
    this.function,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double widthSize = MediaQuery.of(context).size.width;
    return GestureDetector(
        onTap: function,
        child: (widthSize > 385)
            ? Container(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          offset: Offset(0, 4),
                          blurRadius: 10)
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/google_icon.png",
                      height: context.dynamicHeight(0.03),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      text,
                      style: context.smRegularBodyText.copyWith(
                        color: textColor,
                        fontSize: fontSize,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ))
            : Container(
                height: context.dynamicHeight(0.065),
                width: context.dynamicWidth(0.065),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          offset: Offset(0, 4),
                          blurRadius: 10)
                    ]),
                child: Padding(
                  padding: EdgeInsets.all(context.lowValue),
                  child: Image.asset("assets/images/google_icon.png"),
                ),
              ));
  }
}
