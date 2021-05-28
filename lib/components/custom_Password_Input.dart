import 'package:flutter/material.dart';
import 'package:flutter_chatbot_coora/custom_extensions.dart';

class CustomPasswordInput extends StatefulWidget {
  final TextEditingController controller;

  const CustomPasswordInput({this.controller});

  @override
  State<StatefulWidget> createState() {
   return _CustomPasswordInputState(controller:this.controller);
  }
}

class _CustomPasswordInputState extends State<CustomPasswordInput> {
  bool isHiddenPassword = true;
  final TextEditingController controller;

  _CustomPasswordInputState({this.controller});
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isHiddenPassword,
      decoration: InputDecoration(
        hintText: "Şifre",
        hintStyle: context.smRegularBodyText
            .copyWith(color: Colors.white, fontSize: 20),
        enabledBorder: UnderlineInputBorder(
          borderSide: new BorderSide(color: Colors.white, width: 2),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 2),
        ),
        suffixIcon: InkWell(
          onTap: togglePasswordView,
          child: Icon(
            (isHiddenPassword == true)
                ? Icons.visibility_off
                : Icons.visibility,
            color: Colors.white,
          ),
        ),
      ),
      style:
      context.smRegularBodyText.copyWith(color: Colors.white, fontSize: 20),
    );
  }
  void togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }
}
