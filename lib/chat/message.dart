import 'package:flutter/material.dart';

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
            color: author == MessageAuthor.ai ? Color(0x11000000) : Colors.transparent,
            padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,  // AI Icon is left-aligned
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: Color(0x44000000),
                      child: Icon(
                        author == MessageAuthor.ai
                          ? Icons.android 
                          : Icons.person,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 12.0),
                    Container(
                      // constraints: BoxConstraints(maxWidth: 700),
                      child: SelectableText(text),
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