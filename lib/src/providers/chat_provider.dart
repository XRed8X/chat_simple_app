import 'package:flutter/material.dart';
import 'package:chat_simple_app/src/backend/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> messages = [
    Message(text: "Hello, I'm Goku", fromWho: FromWho.contact),
    Message(text: 'Hi, wanna fight?', fromWho: FromWho.me),
  ];


  Future<void> sendMessage(String text) async {
    // TODO: Implement method
  } 

}
