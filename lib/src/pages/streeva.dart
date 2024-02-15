import 'package:flutter/material.dart';


class StreevaPage extends StatelessWidget {
  const StreevaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ChatList(),
    );
  }
}

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dummyChats.length,
      itemBuilder: (context, index) {
        final chat = dummyChats[index];
        return ChatItem(chat: chat);
      },
    );
  }
}

class ChatItem extends StatelessWidget {
  final Chat chat;

  const ChatItem({Key? key, required this.chat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(chat.sender.substring(0, 1)),
      ),
      title: Text(chat.sender),
      subtitle: Text(chat.message),
      onTap: () {
    
      },
    );
  }
}

class Chat {
  final String sender;
  final String message;

  Chat({required this.sender, required this.message});
}

final List<Chat> dummyChats = [
  Chat(sender: 'Mental Health Analysis', message: 'Get insigts for your mental health'),
  Chat(sender: 'Menopause Discussion', message: 'Confused? Talk to us'),
];
