import 'package:flutter/material.dart';

import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart';

final customTheme = Map<String, TextStyle>.from(atomOneDarkTheme)
  ..update('root', (value) => value.copyWith(backgroundColor: Colors.transparent));

class LCodeBlock extends StatelessWidget {
  final String content;
  final String? language;

  LCodeBlock({required this.content, this.language});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
      margin: EdgeInsets.symmetric(horizontal: 0.0, vertical: 24.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9.0),
        color: MediaQuery.of(context).platformBrightness == Brightness.dark
          ? Color(0xFF000E13)
          : Colors.white,
      ),
      child: HighlightView(
        content.trimRight(),
        language: language ?? 'plaintext',
        theme: customTheme,
        textStyle: TextStyle(fontFamily: 'Inconsolata', fontSize: 18),
      ),
    );
  }
}
