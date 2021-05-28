import 'package:flutter/material.dart';
import 'package:flutter_chatbot_coora/custom_extensions.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color color, textColor;
  final double fontSize;
  final Function function;

  const CustomButton({
    this.text,
    this.color,
    this.textColor,
    this.fontSize,
    this.function,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        decoration: BoxDecoration(
            color: color,
            borderRadius:BorderRadius.all(Radius.circular(5)),
             boxShadow:[
              BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  offset: Offset(0, 4),
                  blurRadius: 10)
            ]),
        child: Text(
          text,
          style: context.smRegularBodyText.copyWith(
            color: textColor,
            fontSize: fontSize,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
