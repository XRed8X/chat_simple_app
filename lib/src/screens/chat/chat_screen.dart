import 'package:chat_simple_app/src/widgets/chat/contact_message_bubble.dart';
import 'package:chat_simple_app/src/widgets/shared/message_field_box.dart';
import 'package:flutter/material.dart';
import 'package:chat_simple_app/src/widgets/chat/my_message_bubble.dart';

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
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 100 + 1,
                itemBuilder: (context, index) {
                  return (index % 2 == 0)
                      ? ContactMessageBubble()
                      : MyMessageBubble();
                },
              ),
            ),
            MessageFieldBox(),
          ],
        ),
      ),
    );
  }
}
