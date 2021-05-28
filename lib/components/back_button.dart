import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';

class CustomBackButton extends StatelessWidget {
  final Function function;
  const CustomBackButton({
    Key key, this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          color: secondaryColor,
        ),
        child: Icon(
          FontAwesomeIcons.arrowLeft,
          color: primaryColor,
        ),
      ),
    );
  }
}
