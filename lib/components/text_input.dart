import 'package:flutter/material.dart';

import '../constants.dart';

class TextInput extends StatelessWidget {
  final String labelText;

  const TextInput({
    Key key,
    this.labelText,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          labelText: labelText,
        labelStyle: TextStyle(
          color: black26,
          fontSize: 20
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: black26, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: black26, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(10)),

        )
      ),
    );
  }
}