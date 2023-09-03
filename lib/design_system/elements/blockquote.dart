import 'package:flutter/material.dart';

class LBlockquote extends StatelessWidget {
  final String text;

  LBlockquote({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 24.0, left: 24.0),
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
        border: Border(left: BorderSide(width: 4.0, color: Colors.grey[300]!)),
      ),
      child: SelectableText(
        text,
        style: Theme.of(context).textTheme.bodyText1?.copyWith(
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}
