import 'package:flutter/material.dart';
import 'package:chat_simple_app/src/backend/entities/message.dart';
import 'package:chat_simple_app/config/helpers/get_api_answer.dart';

class ChatProvider extends ChangeNotifier {
  final chatScrollController = ScrollController();
  final getApiAnswer = GetApiAnswer();

  List<Message> messageList = [
    Message(text: "Hello, I'm Goku", fromWho: FromWho.contact),
    Message(text: 'Hi, wanna fight?', fromWho: FromWho.me),
    Message(text: 'Hi, wanna fight?', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;

    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);

    if (text.endsWith('?') || text.endsWith('??')) {
      await contactAnswer();
    }

    notifyListeners();
    moveScroolToBottom();
  }

  Future<void> contactAnswer() async {
    final contactMessage = await getApiAnswer.getAnswer();
    messageList.add(contactMessage);
    notifyListeners();
    moveScroolToBottom();
  }

  void moveScroolToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
