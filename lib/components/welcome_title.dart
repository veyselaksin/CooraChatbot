
import 'package:flutter/material.dart';
import 'package:flutter_chatbot_coora/custom_extensions.dart';

class WelcomeTitle extends StatelessWidget {
  final String sessionType;
  final Function press;

  const WelcomeTitle({Key key, this.sessionType, this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hoşgeldiniz!",
          style: context.mdMediumHeadlineText.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: context.lowValue,
        ),
        Row(
          children: [
            Text(
              (sessionType=="login")?"Hesabınız yok mu? ":"Zaten bir hesabınız var mı? ",
              style: context.smRegularBodyText
                  .copyWith(color: Colors.white, fontSize: 16),
            ),
            GestureDetector(
              onTap: press,
              child:Text(
                (sessionType=="login")?"Kayıt olun!":"Giriş yapın!",
                style: context.smMediumBodyText.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              ),
            )
          ],
        ),
      ],
    );
  }
}

