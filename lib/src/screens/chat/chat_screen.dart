import 'package:chat_simple_app/src/widgets/chat/contact_message_bubble.dart';
import 'package:chat_simple_app/src/widgets/shared/message_field_box.dart';
import 'package:flutter/material.dart';
import 'package:chat_simple_app/src/widgets/chat/my_message_bubble.dart';
import 'package:provider/provider.dart';
import 'package:chat_simple_app/src/providers/chat_provider.dart';
import 'package:chat_simple_app/src/backend/entities/message.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://i.pinimg.com/736x/8f/97/5a/8f975a884fc860b6b645e868b3334897.jpg',
            ),
          ),
        ),
        title: Text('Son Goku'),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messageList[index];

                  return (message.fromWho == FromWho.contact)
                      ? ContactMessageBubble(message: message)
                      : MyMessageBubble(message: message);
                },
              ),
            ),
            MessageFieldBox(
              // onValue: (value) => chatProvider.sendMessage(value)
              onValue: chatProvider.sendMessage,
            ),
          ],
        ),
      ),
    );
  }
}
