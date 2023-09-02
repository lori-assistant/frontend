import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../markdown.dart';

class Message extends StatelessWidget {
  // Typically, you might also include some final variables here to be passed in when the widget is instantiated.
  final MessageAuthor author;
  final String text;

  Message({
    required this.author,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            color: MediaQuery.of(context).platformBrightness == Brightness.dark
              ? author == MessageAuthor.ai
                ? Color(0xFF021A23)
                : Colors.transparent
              : author == MessageAuthor.ai
                ? Color(0xFFBDDCE7)
                : Colors.transparent,
            padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,  // AI Icon is left-aligned
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width > 768 ? 768 : double.infinity,
                      child: Row(
                        children: [
                          Container(
                            width: 42,
                            height: 42,
                            child: SvgPicture.asset(
                              'assets/icons/${author == MessageAuthor.ai ? 'chatbot' : 'user'}_squircle.svg',
                              semanticsLabel: 'Chatbot Icon',
                            ),
                          ),

                          SizedBox(width: 15.0),

                          Text(
                            author == MessageAuthor.ai ? "Lori" : "User",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: author == MessageAuthor.ai ? Color(0xFF379A5D) : Color(0xFFEEEEEE),
                              fontVariations: [
                                FontVariation(
                                  'wght',
                                  ((FontWeight.w600.index + 1) * 100).toDouble(),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(height: 24.0),
                    Container(
                      // constraints: BoxConstraints(maxWidth: 700),
                      child: MarkdownRenderer(source: text),
                      width: MediaQuery.of(context).size.width > 768 ? 768 : double.infinity,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

enum MessageAuthor {
  ai,
  user,
}