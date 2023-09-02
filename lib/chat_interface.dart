import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';

import './chat/message.dart';
import './markdown.dart';

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
/*
  @override
  void initState()
  {
    super.initState();

    // Add a user mock message
    _messageWidgets.add(
      _buildUserMessageWidget("Provide a Python implementation of the Fibonacci function?")
    );

    // Add an AI mock response with Lorem Ipsum text
    _messageWidgets.add(
      _buildAiMessageWidget(
        """
# Fibonacci Sequence

The Fibonacci sequence is a series of numbers where a number is the sum of the two preceding ones. It usually starts with 0 and 1. In mathematical terms, the sequence `F(n)` is defined by the recurrence relation:

Below is a simple Python function that calculates the Fibonacci number for a given `n`:

```python
def fibonacci(n):
    if n <= 1:
        return n
    else:
        return fibonacci(n-1) + fibonacci(n-2)

# Test the function
for i in range(10):
    print(fibonacci(i))
```

This function uses a recursive approach to compute the Fibonacci number. When called with `n`, it returns the `n-th` number in the Fibonacci sequence. The function works by breaking down the problem into two smaller sub-problems: `fibonacci(n-1)` and `fibonacci(n-2)`. These sub-problems are solved recursively until reaching the base cases of `n=0` or `n=1`.

However, it's worth noting that this recursive approach can be inefficient for large values of `n` due to the repeated computation of the same Fibonacci numbers multiple times. There are more efficient algorithms, like the iterative approach or using memoization, to compute Fibonacci numbers in a more optimized manner.

        """
      )
    );
  }
*/

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
      ..body = '{"model":"lori-v4", "prompt": "$userMessage"}';

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
    if (message == "Processing...") {
      return SpinKitDoubleBounce(
        color: Color(0xFF358097), // You can customize the color
        size: 20.0,        // You can customize the size
      );
    } else {
      return Message(
        author: MessageAuthor.ai,
        text: message,
      );
    }
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