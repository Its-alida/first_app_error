import 'dart:convert';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Chatbot extends StatefulWidget {
  const Chatbot({super.key});

  @override
  State<Chatbot> createState() => ChatbotState();
}

class ChatbotState extends State<Chatbot> {
  ChatUser myself = ChatUser(
    id: '1',
    firstName: "Myself",
  );
  ChatUser bot = ChatUser(id: '2', firstName: "Streeva");
  List<ChatMessage> allMessages = [];

  List<ChatUser> typing = [];

  final ourUrl =
      "https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key= AIzaSyDPx_uA48sM9OoCG1SXrS76OPJ5jfGmtXs";

  final header = {'Content-Type': 'application/json'};

  getdata(ChatMessage m) async {
    typing.add(bot);
    allMessages.insert(0, m);
    setState(() {});

    var data = {
      "contents": [
        {
          "parts": [
            {"text": m.text}
          ]
        }
      ]
    };

    await http
        .post(Uri.parse(ourUrl), headers: header, body: jsonEncode(data))
        .then((value) {
      if (value.statusCode == 200) {
        var result = jsonDecode(value.body);
        var text = result['candidates'][0]['content']['parts'][0]['text'];
        text = text.replaceAll("*", "");
        // print(result['candidates'][0]['content']['parts'][0]['text']);
        ChatMessage m1 = ChatMessage(
            // text: result['candidates'][0]['content']['parts'][0]['text'],
            text: text,
            user: bot,
            createdAt: DateTime.now());

        allMessages.insert(0, m1);
      } else {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Error occurred'),
              duration: Duration(seconds: 3),
            ),
          );
        }
      }
    }).catchError((e) {});
    typing.remove(bot);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: streevaAppBar(context),
      body: DashChat(
        typingUsers: typing,
        currentUser: myself,
        onSend: (ChatMessage m) {
          getdata(m);
        },
        messages: allMessages,
        inputOptions: const InputOptions(
            alwaysShowSend: true,
            sendOnEnter: true,
            cursorStyle: CursorStyle(color: Colors.pink)),
        messageOptions: MessageOptions(
          currentUserContainerColor: Colors.pink,
          avatarBuilder: yourAvatarBuilder,
        ),
      ),
    );
  }

  AppBar streevaAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 245, 206, 235),
      title: const Text(
        'Streeva',
        style: TextStyle(
          color: Color.fromARGB(255, 0, 0, 0),
          fontSize: 22.0,
        ),
      ),
      leading: IconButton(
        icon: const CircleAvatar(
          backgroundImage: AssetImage('assets/splash_image.png'),
          radius: 100,
        ),
        onPressed: () {
          _showProfilePopup(context);
        },
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.more_vert),
          onPressed: () {
            _showPopupMenu(context);
          },
        ),
      ],
    );
  }

  Widget yourAvatarBuilder(
      ChatUser p1, Function? onPressAvatar, Function? onLongPressAvatar) {
    return Center(
      child: Image.asset(
        'assets/splash_image.png',
        height: 40,
        width: 40,
      ),
    );
  }

  void _showProfilePopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Hi, I am Streeva'),
          content: const Text('Your personal chatbot :) You can trust me!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showPopupMenu(BuildContext context) async {
    final RenderBox button = context.findRenderObject() as RenderBox;

    await showMenu(
      // pop up menu bar on appbar made using generative AI
      context: context,
      position: RelativeRect.fromLTRB(
        button.localToGlobal(Offset.zero).dx + 0.2,
        button.localToGlobal(button.size.bottomRight(Offset.zero)).dy + 50,
        button.localToGlobal(button.size.bottomRight(Offset.zero)).dx - 200.0,
        button.localToGlobal(button.size.bottomRight(Offset.zero)).dy + 10.0,
      ),
      items: [
        const PopupMenuItem(
          child: Text('Menu Item 1'),
        ),
        const PopupMenuItem(
          child: Text('Menu Item 2'),
        ),
      ],
    );
  }
}
