import 'package:flutter/material.dart';

class BrandImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: MediaQuery.of(context).size.height*.15,
      width: MediaQuery.of(context).size.width,
      child: Image(
        image: AssetImage("assets/images/coora.png"),
      ),
    );
  }
}
