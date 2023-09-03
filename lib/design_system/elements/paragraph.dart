import 'package:flutter/material.dart';

class LParagraph extends StatelessWidget {
  final String text;

  LParagraph({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 24.0),
      child: SelectableText(
        text,
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}
