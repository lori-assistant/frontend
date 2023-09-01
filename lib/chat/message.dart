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
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9),
                              color: author == MessageAuthor.ai
                                ? Color(0xFF379A5D)
                                : Color(0xFF37839A)
                            ),
                            child: Icon(
                              author == MessageAuthor.ai
                                ? Icons.android
                                : Icons.person,
                              color: Color(0x44000000),
                            ),
                          ),

                          SizedBox(width: 12.0),

                          Text(
                            author == MessageAuthor.ai ? "Lori" : "User",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],
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