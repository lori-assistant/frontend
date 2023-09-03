import 'package:flutter/material.dart';

class LHeading extends StatelessWidget {
  final String text;
  final int level;

  LHeading({required this.text, required this.level});

  @override
  Widget build(BuildContext context) {
    TextStyle? style;
    switch (level) {
      case 1:
        style = Theme.of(context).textTheme.headline1;
        break;
      case 2:
        style = Theme.of(context).textTheme.headline2;
        break;
      case 3:
        style = Theme.of(context).textTheme.headline3;
        break;
      case 4:
        style = Theme.of(context).textTheme.headline4;
        break;
      case 5:
        style = Theme.of(context).textTheme.headline5;
        break;
      case 6:
        style = Theme.of(context).textTheme.headline6;
        break;
    }
    return Container(
      child: SelectableText(text, style: style),
      margin: EdgeInsets.only(top: 24.0),
    );
  }
}
