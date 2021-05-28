import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double dynamicWidth(double val) => MediaQuery.of(this).size.width * val;
  double dynamicHeight(double val) => MediaQuery.of(this).size.height * val;

  ThemeData get theme => Theme.of(this);
}

extension NumberExtension on BuildContext {
  double get lowValue => dynamicHeight(0.01);
  double get mediumValue => dynamicHeight(0.03);
  double get highValue => dynamicHeight(0.05);
}

extension PaddingExtension on BuildContext {
  EdgeInsets get paddingAllLow => EdgeInsets.all(lowValue);
}

extension EmptyWidget on BuildContext {
  Widget get emptyWidgetHeight => SizedBox(
        height: lowValue,
      );
}
extension TextExtension on BuildContext{

  //Regular Text Styles
  TextStyle get smRegularBodyText=>theme.textTheme.bodyText2;
  TextStyle get smMediumBodyText=>theme.textTheme.bodyText1;

  //Medium Text Styles
  TextStyle get mdMediumHeadlineText=>theme.textTheme.headline4;
  TextStyle get mdSmallHeadlineText=>theme.textTheme.headline5;
}
