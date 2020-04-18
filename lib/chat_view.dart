import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  final String userName;

  const ChatView({Key key, this.userName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Container(
        child: Text("welcome $userName"),
      ),
    );
  }
}
