import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_state.dart';
import 'sandbox_screen.dart';

class ChatMessage {
  final String text;
  final bool isUser;

  ChatMessage({required this.text, required this.isUser});
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<ChatMessage> _messages = [];

  void _sendMessage() {
    if (_messageController.text.trim().isEmpty) return;

    final userText = _messageController.text;
    setState(() {
      _messages.add(ChatMessage(text: userText, isUser: true));
      _messageController.clear();
    });

    // Mock AI response
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _messages.add(ChatMessage(
            text: "Hello! I am your AI assistant. You said: $userText",
            isUser: false));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Chat - ${appState.selectedModel}'),
        actions: [
          DropdownButton<String>(
            value: appState.selectedModel,
            items: appState.availableModels.map((String model) {
              return DropdownMenuItem<String>(
                value: model,
                child: Text(model),
              );
            }).toList(),
            onChanged: (String? newValue) {
              if (newValue != null) {
                appState.setModel(newValue);
              }
            },
            icon: Icon(Icons.arrow_drop_down, color: Colors.white),
            dropdownColor: Colors.blue,
            style: TextStyle(color: Colors.white),
            underline: Container(), // Remove underline
          ),
          IconButton(
            icon: Icon(Icons.code),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SandboxScreen()),
              );
            },
            tooltip: 'Open Sandbox',
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                return ListTile(
                  title: Align(
                    alignment: msg.isUser
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: msg.isUser ? Colors.blue[100] : Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(msg.text),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onSubmitted: (_) => _sendMessage(),
                  ),
                ),
                SizedBox(width: 8),
                IconButton(
                  icon: Icon(Icons.send),
                  color: Colors.blue,
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
