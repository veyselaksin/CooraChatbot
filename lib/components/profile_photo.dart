import 'package:flutter/material.dart';

class ProfilePhoto extends StatelessWidget {

  final double height, width;
  final String type;

  const ProfilePhoto({

    Key key, this.height, this.width, this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/user_photo.png"),
        ),
        borderRadius: (type=="circle")?BorderRadius.all(Radius.circular(100)):BorderRadius.all(Radius.circular(10)),
      ),
    );
  }
}