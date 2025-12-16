import 'package:chat_simple_app/config/helpers/get_api_answer.dart';
import 'package:flutter/material.dart';
import 'package:chat_simple_app/src/backend/entities/message.dart';

class ContactMessageBubble extends StatelessWidget {
  const ContactMessageBubble({super.key, required this.message});

  final Message message;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: colors.secondary,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(message.text, style: TextStyle(color: Colors.white)),
          ),
        ),
        const SizedBox(height: 5),
        _ImageBubble(imageURL: message.imageURL ?? 'https://yesno.wtf/assets/yes/14-b57c6dc03aa15a4b18f53eb50d6197ee.gif')
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String imageURL;

  const _ImageBubble({required this.imageURL});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        imageURL,
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            width: size.width * 0.7,
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: const Text('Goku is typing...'),
          );
        },
      ),
    );
  }
}
