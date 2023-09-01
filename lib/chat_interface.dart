import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './chat/message.dart';

class ChatInterface extends StatefulWidget {
  @override
  _ChatInterfaceState createState() => _ChatInterfaceState();
}

class _ChatInterfaceState extends State<ChatInterface> {
  TextEditingController _inputTextController = TextEditingController();
  List<Widget> _messageWidgets = [];
  String? _errorMessage;
  String _aiPartialMessage = "Processing...";
  bool _firstTokenReceived = false;  // Track if the first token has been received

  Future<void> sendRequest() async {
    String userMessage = _inputTextController.text;
    setState(() {
      _messageWidgets.add(_buildUserMessageWidget(userMessage));
      _messageWidgets.add(_buildAiMessageWidget(_aiPartialMessage));  // Add "Processing..." message
    });

    var request = http.Request(
      'POST',
      Uri.parse('http://localhost:11434/api/generate'),
    )
      ..headers['Content-Type'] = 'application/json'
      ..body = '{"model":"lori-v3", "prompt": "$userMessage"}';

    try {
      final response = await request.send();
      response.stream.transform(utf8.decoder).listen((data) {
        Map<String, dynamic> jsonData = json.decode(data);
        String token = jsonData['response'] ?? "";
        setState(() {
          if (!_firstTokenReceived) {
            _aiPartialMessage = token;  // Replace "Processing..." with the first token
            _firstTokenReceived = true;
          } else {
            _aiPartialMessage += token; // Append incoming tokens
          }
          _messageWidgets[_messageWidgets.length - 1] = _buildAiMessageWidget(_aiPartialMessage);
        });
      }, onDone: () {
        // Once we're done processing all tokens for this message, reset the variables
        _aiPartialMessage = "Processing...";
        _firstTokenReceived = false;
      });
    } catch (error) {
      setState(() {
        _errorMessage = "Error: ${error.toString()}";
        _aiPartialMessage = _errorMessage!;
        _messageWidgets[_messageWidgets.length - 1] = _buildAiMessageWidget(_aiPartialMessage);
        _aiPartialMessage = "Processing...";
        _firstTokenReceived = false;
      });
    } finally {
      _inputTextController.clear();
    }
  }


  Widget _buildUserMessageWidget(String message) {
    return Message(
      author: MessageAuthor.user,
      text: message,
    );
  }
  Widget _buildAiMessageWidget(String message) {
    return Message(
      author: MessageAuthor.ai,
      text: message,
    );
  }

  // Placeholder for no messages
  Widget _buildPlaceholder() {
    return Center(
      child: Text(
        'Start a conversation!',
        style: TextStyle(
          fontSize: 18.0,
          color: Colors.grey[600],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: MediaQuery.of(context).platformBrightness == Brightness.dark
            ? Color(0xFF03212D)
            : Color(0xFFCAE6F1),
        ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: _messageWidgets.isEmpty
                    ? _buildPlaceholder()
                    : Center(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: 4096), // Max width for centered appearance
                          child: Column(
                            children: _messageWidgets,
                          ),
                        ),
                      ),
              ),
            ),
            SizedBox(height: 12.0),
            Container(
              height: 48.0,
              margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    offset: Offset(0, 1),
                    blurRadius: 2,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: TextField(
                controller: _inputTextController,
                decoration: InputDecoration(
                  hintText: 'Type your message...',
                  contentPadding: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.send),
                    onPressed: sendRequest,
                  ),
                  border: InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                  errorText: _errorMessage,
                ),
                onSubmitted: (text) => sendRequest(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageHolder {
  String message;
  MessageHolder({required this.message});
}