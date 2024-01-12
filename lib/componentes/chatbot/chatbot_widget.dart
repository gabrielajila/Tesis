
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_10.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chat',
      theme: ThemeData(
       primaryColor: Color(0xFF4A70C8),
      ),
      home: ChatbotWidget(),
    );
  }
}

class ChatbotWidget extends StatefulWidget {
  ChatbotWidget({Key? key}) : super(key: key);

  @override
  _ChatbotWidgetState createState() => _ChatbotWidgetState();
}

class _ChatbotWidgetState extends State<ChatbotWidget> {
  final List<ChatBubble> messages = [];
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Asistencia"),
        backgroundColor: Color(0xFF4A70C8),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return messages[index];
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Escribe tu pregunta...",
                    ),
                    onSubmitted: (_) => _sendMessage(),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Color(0xFF4A70C8),),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _sendMessage() async {
    String question = _controller.text;
    String response = await askGpt(question);

    setState(() {
      messages.add(
        ChatBubble(
          clipper: ChatBubbleClipper10(type: BubbleType.sendBubble),
          alignment: Alignment.topRight,
          margin: EdgeInsets.all(10),
          backGroundColor:  Color(0xFF4A70C8),
          child: Text(
            " $question",
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
      messages.add(
        ChatBubble(
          clipper: ChatBubbleClipper10(type: BubbleType.receiverBubble),
          alignment: Alignment.topLeft,
          margin: EdgeInsets.all(10),
          backGroundColor: Colors.grey[300],
          child: Text(
            " $response",
            style: TextStyle(color: Colors.black),
          ),
        ),
      );
    });

    _controller.clear();
  }

  Future<String> askGpt(String question) async {
    var url = Uri.parse("http://192.168.3.7:3000/ask"); // cambiarlo cada que necesite la ruta

    var response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
      },
      body: json.encode({
        'questions': [
          {'role': 'user', 'content': question}
        ],
      }),
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return data['choices'][0]['message']['content'].toString();
    } else {
      print(response.body);
      return "Hubo un error al obtener la respuesta.";
    }
  }
}



