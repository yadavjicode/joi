import 'package:flutter/material.dart';

class ChatCall extends StatefulWidget {
  const ChatCall({super.key});

  @override
  State<ChatCall> createState() => _ChatCallState();
}

class _ChatCallState extends State<ChatCall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 35),
          alignment: Alignment.center,
          child: Text(
            "ChatCall",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        )
      ],
    ));
  }
}
